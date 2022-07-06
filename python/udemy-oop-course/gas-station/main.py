from employee import Attendant
from employee import Cook
from employee import Manager
from employee import Mechanic
from reporting import AccountingReport
from reporting import ScheduleReport
from reporting import StaffingReport
from shift import AfternoonShift
from shift import MorningShift
from shift import NightShift

employees = [
    Manager("Vera", "Schmidt", 2000, MorningShift()),
    Attendant("Chuck", "Norris", 1800, MorningShift()),
    Attendant("Samantha", "Carrington", 1800, AfternoonShift()),
    Cook("Roberto", "Jacketti", 2100, MorningShift()),
    Mechanic("Dave", "Dreibig", 2000, MorningShift()),
    Mechanic("Tina", "River", 2000, MorningShift()),
    Mechanic("Ringo", "Rama", 2200, AfternoonShift()),
    Mechanic("Chuck", "Rainey", 2300, NightShift())
]

reports = [
    AccountingReport(employees),
    StaffingReport(employees),
    ScheduleReport(employees)
]

for r in reports:
    r.print_report()  # polymorphism in action. we changed the method names in each report class to the same.

    print()
