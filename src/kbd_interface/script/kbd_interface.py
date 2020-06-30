#! /usr/bin/env python
# -*- coding: utf-8 -*-
#
# Copyright (c) 2013 PAL Robotics SL.
# Released under the BSD License.
#
# Authors:
#   * Siegfried-A. Gevatter

import curses
import math

import rospy
#from geometry_msgs.msg import Twist
from sim_real_msg_interface.msg import Commands, Odometry

class Velocity(object):

    _max_step_size = 0.05
    _min_step_size = 0.005
    _step_size_delta = 0.005
    _hard_decay = 0.8
    _soft_decay = 0.995
    
    def __init__(self, max_val, step_size = 0.02):
        assert max_val > 0 and step_size > 0
        self._max_val = max_val
        self._step_size = step_size
        self._current = 0.0
        
    def __call__(self, command=0): # -3: Hard break, -2: Soft break, -1: Decelerate, 0: Return val, 1: Accelerate
        if command == 0:
            return self._current
        elif command == -3:
            target_vel = self._current * Velocity._hard_decay
            self._current = int(target_vel / self._step_size) * self._step_size
        elif command == -2:
            target_vel = self._current * Velocity._soft_decay
            self._current = int(target_vel / self._step_size) * self._step_size
        else:
            current = self._current + command*self._step_size
            if abs(current) >= self._step_size/2:
                current_dir = int(current / abs(current))
                current_abs = min(abs(current), self._max_val)
                self._current = current_dir * current_abs
            else:
                self._current = 0


    def change_step_size(self, direction):
        self._step_size = max(min(Velocity._max_step_size, self._step_size + direction*Velocity._step_size_delta), Velocity._min_step_size)
        
class TextWindow():

    _screen = None
    _window = None
    _num_lines = None

    def __init__(self, stdscr, lines=15):
        self._screen = stdscr
        self._screen.nodelay(True)
        curses.curs_set(0)

        self._num_lines = lines

    def read_key(self):
        keycode = self._screen.getch()
        return keycode if keycode != -1 else None

    def clear(self):
        self._screen.clear()

    def write_line(self, lineno, message):
        if lineno < 0 or lineno >= self._num_lines:
            raise ValueError, 'lineno out of bounds'
        height, width = self._screen.getmaxyx()
        y = (height / self._num_lines) * lineno
        x = 3
        for text in message.split('\n'):
            text = text.ljust(width)
            self._screen.addstr(y, x, text)
            y += 1

    def refresh(self):
        self._screen.refresh()

    def beep(self):
        curses.flash()

class KeyTeleop():

    _interface = None
    _linear = None
    _angular = None

    def __init__(self, interface, pub_topic='cmd_vel', hz=10):
        
        rospy.init_node(pub_topic)
        self._interface = interface
        self._pub_topic = rospy.Publisher(pub_topic, Commands)

        self._hz = hz
        self._linear = Velocity(0.5)
        self._angular = Velocity(0.5)

    def run(self):
        rate = rospy.Rate(self._hz)
        # Initialize screen, pass zero to AP
        self._publish()
        while not rospy.is_shutdown():
            keycode = self._interface.read_key()
            if keycode:
                if self._key_pressed(keycode):
                    self._publish()
            else:
                #self._publish()
                rate.sleep()

    def _get_message(self):
        command = Commands()
        command.velocity = self._linear()
        command.omega = self._angular()
        return command

    def _key_pressed(self, keycode):
        movement_bindings = {
            ord('w'): ( 1,  0),
            ord('s'): (-1,  0),
            ord('a'): ( 0,  1),
            ord('d'): ( 0, -1),
            ord('q'): (-2, -2),
            ord('e'): (-3, -3),
            ord('r'): (0, -3)
        }
        step_bindings = {
            ord('['): (1, 1),
            ord(']'): (-1, -1),
        }
        
        if keycode in movement_bindings:
            cmd = movement_bindings[keycode]
            forward = self._linear(cmd[0])
            rotational = self._angular(cmd[1])
            
        elif keycode in step_bindings:
            cmd = step_bindings[keycode]
            self._linear.change_step_size(cmd[0])
            self._angular.change_step_size(cmd[1])
            
        elif keycode == ord('x'):
            self._linear._current = 0
            self._angular._current = 0
            self._publish()
            rospy.signal_shutdown('Bye')
        else:
            return False

        return True

    def _publish(self):
        self._interface.clear()
        self._interface.write_line(2, 'Linear: %.3f, Angular: %.3f' % (self._linear(), self._angular()))
        self._interface.write_line(3, 'Linear Step: %.3f, Angular Step: %.3f' % (self._linear._step_size, self._angular._step_size))
        self._interface.write_line(5, 'Instructions:')
        self._interface.write_line(6, 'WSAD to change speeds') 
        self._interface.write_line(7, 'q/e to soft/hard break')
        self._interface.write_line(8, 'r to turn break')
        self._interface.write_line(9, '[ or ] to increase/decrease step size')
        self._interface.write_line(10, 'x to exit')

        self._interface.refresh()

        self._pub_topic.publish(self._get_message())

def main(stdscr):
    app = KeyTeleop(TextWindow(stdscr))
    app.run()

if __name__ == '__main__':
    try:
        curses.wrapper(main)
    except rospy.ROSInterruptException:
        pass
