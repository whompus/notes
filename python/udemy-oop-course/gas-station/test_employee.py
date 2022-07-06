import unittest

from employee import Employee


class TestEmployee(unittest.TestCase):
    def test_get_full_name(self):
        e = Employee("Vera", "Schmidt", 0, None)
        self.assertEqual(e.get_full_name(), "Vera Schmidt")

    def test_raise_salary(self):
        e = Employee("", "", 2000, None)
        e.raise_salary(100)
        self.assertEqual(e.salary, 2100)
