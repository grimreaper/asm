#!/usr/bin/env python3

#TODO: figure out why subprocess isn't actually running the process anymore?
import subprocess
import unittest

def run_shell_cmd(cmd):
    proc = subprocess.Popen(cmd, bufsize=0, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    stdout, stderr = proc.communicate()
    ret = proc.returncode
    return (stdout, stderr, ret)


class HelloWorld(unittest.TestCase):
    def test_hello_world(self):
        stdout, stderr, ret = run_shell_cmd(["./hello_world"])
        self.assertEqual(stdout, b"Hello, World!\n")

    def test_hello_world2(self):
        stdout, stderr, ret = run_shell_cmd(["./hello_world2"])
        self.assertEqual(stdout, b"Hello, World!\n")

class Argv(unittest.TestCase):
    def test_argv_alone(self):
        stdout, stderr, ret = run_shell_cmd(["./argv"])
        print(stdout)
        self.assertEqual(stdout, b"0 : ./argv\n")

    def test_argv_multiple_args(self):
        stdout, stderr, ret = run_shell_cmd(["./argv", "a", "b"])
        lines = stdout.splitlines()
        self.assertEqual(len(lines), 2)
        self.assertEqual(lines[0], b"0 : ./argv")
        self.assertEqual(lines[1], b"1 : a")
        self.assertEqual(lines[2], b"2 : b")

if __name__ == "__main__":
    unittest.main()
