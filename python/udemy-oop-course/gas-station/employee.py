class Employee:
    # the dunder init is the moment where you can inject information into the object. if a class needs data to work
    # with, the dunder init method is way to get the data in the object.
    # In this case, it expects a name a salary when it is instantiated.
    def __init__(self, first_name, last_name, salary, shift):
        self._first_name = first_name
        self._last_name = last_name
        self.salary = salary
        self.shift = shift

    def get_full_name(self):
        return f"{self._first_name} {self._last_name}"

    def raise_salary(self, amount):
        self.salary = self.salary + amount


class Mechanic(Employee):  # this tells python that mechanic is inherited from employee as a subclass
    job_title = "Mechanic"  # this is a class variable, not defined in a method. persistent across objects


class Manager(Employee):
    job_title = "Manager"


class Attendant(Employee):
    job_title = "Station Attendant"


class Cook(Employee):
    job_title = "Cook"
