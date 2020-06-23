### Table of Contents
- [Dictionaries](#dictionaries)
- [for Loops](#for-loops)
- [Logic Operations](#logic-operations)
- [Reading user input](#reading-user-input)
- [Functions](#functions)
- [More on functions](#more-on-functions)
- [Using Standard Library Packages](#using-standard-library-packages)
- [Environemnt Variables](#environemnt-variables)
- [Interacting with files](#interacting-with-files)
- [Parsing Command Line Parameters](#parsing-command-line-parameters)
- [Robust CLIs with 'argparse'](#robust-clis-with-argparse)
- [Error Handling](#error-handling)
- [Exit statuses](#exit-statuses)
- [Execute Shell Commands from Python](#execute-shell-commands-from-python)
- [Advanced Iteration With List Comprehensions](#advanced-iteration-with-list-comprehensions)
- [`random` and `json`](#random-and-json)
- [`shutil` & `glob`](#shutil--glob)
- [`re` (regular expression) & `math`](#re-regular-expression--math)
- [Installing Third-Party PAckages Using 'pip'](#installing-third-party-packages-using-pip)
- [Virtual Environments (venv)](#virtual-environments-venv)
- [Using Third-Party Packages in your Scripts](#using-third-party-packages-in-your-scripts)
- [pgbackup](#pgbackup)
- [Initial Project layout](#initial-project-layout)
- [Intro to TDD (Test Driven Development) and First Tests](#intro-to-tdd-test-driven-development-and-first-tests)
- [Implementing CLI Guided by Tests](#implementing-cli-guided-by-tests)
- [Introduction to Mocking in Tests](#introduction-to-mocking-in-tests)
- [Implementing PostgreSQL Interaction](#implementing-postgresql-interaction)
- [Implementing Local File Storage](#implementing-local-file-storage)
- [Implementing AWS Interaction](#implementing-aws-interaction)
- [Wiring everything together](#wiring-everything-together)
- [Building and sharing a Wheel Distribution](#building-and-sharing-a-wheel-distribution)

## Helpful Links:
https://pythonnotesnotorganizedyet.readthedocs.io/en/latest/PythonSystemAutomation.html?highlight=create_parser#

# Dictionaries
Learn how to use dictionaries (the `dict` type) to hold onto key/value information in Python.
Python Documentation For This Video

* [Dictionaries](https://docs.python.org/3/library/stdtypes.html#mapping-types-dict)

Dictionaries are the main mapping type that we’ll use in Python. This object is comparable to a Hash or “associative array” in other languages.

Things to note about dictionaries:

1. Unlike Python 2 dictionaries, as of Python 3.6, keys are ordered in dictionaries. You'll need `OrderedDict` if you want this to work on another version of Python.
2. You can set the key to any IMMUTABLE TYPE (no lists).
3. Avoid using things other than simple objects as keys.
4. Each key can only have one value (so don’t have duplicates when creating a dict).

We create dictionary literals by using curly braces (`{` and `}`), separating keys from values using colons (`:`), and separating key/value pairs using commas (`,`). Here’s an example dictionary:

```python
>>> ages = { 'kevin': 59, 'alex': 29, 'bob': 40 }
>>> ages
{'kevin': 59, 'alex': 29, 'bob': 40}
```

We can read a value from a dictionary by subscripting using the key:

```python
>>> ages['kevin']
59
>>> ages['billy']
Traceback (most recent call last):
  File "", line 1, in 
KeyError: 'billy'
```

Keys can be added or changed using subscripting and assignment:

```python
>>> ages['kayla'] = 21
>>> ages
{'kevin': 59, 'alex': 29, 'bob': 40, 'kayla': 21}
```

Items can be removed from a dictionary using the `del` statement or by using the `pop` method:

```python
>>> del ages['kevin']
>>> ages
{'alex': 29, 'bob': 40, 'kayla': 21}
>>> del ages
>>> ages
Traceback (most recent call last):
  File "", line 1, in 
NameError: name 'ages' is not defined
>>> ages = { 'kevin': 59, 'alex': 29, 'bob': 40 }
>>> ages.pop('alex')
29
>>> ages
{'kevin': 59, 'bob': 40}
```

It’s not uncommon to want to know what keys or values we have without caring about the pairings. For that situation we have the `values` and `keys` methods:

```python
>>> ages = {'kevin': 59, 'bob': 40}
>>> ages.keys()
dict_keys(['kevin', 'bob'])
>>> list(ages.keys())
['kevin', 'bob']
>>> ages.values()
dict_values([59, 40])
>>> list(ages.values())
[59, 40]
```

## Alternative Ways to Create a `dict` Using Keyword Arguments

There are a few other ways to create dictionaries that we might see, those being those that use the `dict` constructor with key/value arguments and a list of tuples:

```python
>>> weights = dict(kevin=160, bob=240, kayla=135)
>>> weights
{'kevin': 160, 'bob': 240, 'kayla': 135}
>>> colors = dict([('kevin', 'blue'), ('bob', 'green'), ('kayla', 'red')])
>>> colors
{'kevin': 'blue', 'bob': 'green', 'kayla': 'red'}
```

- - -
&nbsp;

# for Loops
It’s incredibly common to need to repeat something a set number of times or to iterate over content. Here is where looping and iteration come into play.

Python Documentation For This Video

* [`for` statement](https://docs.python.org/3/tutorial/controlflow.html#for-statements%3CPaste%3E)

## The `for` Loop

The most common use we have for looping is when we want to execute some code for each item in a sequence. For this type of looping or iteration, we’ll use the `for` loop. The general structure for a `for` loop is:

```python
for TEMP_VAR in SEQUENCE:
    pass
```

The `TEMP_VAR` will be populated with each item as we iterate through the `SEQUENCE` and it will be available to us in the context of the loop. After the loop finishes one iteration, then the `TEMP_VAR` will be populated with the next item in the `SEQUENCE`, and the loop’s body will execute again. This process continues until we either hit a `break` statement or we’ve iterated over every item in the `SEQUENCE`. Here’s an example looping over a list of colors:

```python
>>> colors = ['blue', 'green', 'red', 'purple']
>>> for color in colors:
...     print(color)
...
blue
green
red
purple
>>> color
'purple'
```

If we didn't want to print out certain colors we could utilize the `continue` or `break` statements again. Let’s say we want to skip the string `'blue'` and terminate the loop if we see the string `'red'`:

```python
>>> colors = ['blue', 'green', 'red', 'purple']
>>> for color in colors:
...     if color == 'blue':
...         continue
...     elif color == 'red':
...         break
...     print(color)
...
green
>>>
```

## Other Iterable Types

Lists will be the most common type that we iterate over using a `for` loop, but we can also iterate over other sequence types. Of the types we already know, we can iterate over strings, dictionaries, and tuples.

Here’s a tuple example:

```python
>>> point = (2.1, 3.2, 7.6)
>>> for value in point:
...     print(value)
...
2.1
3.2
7.6
>>>
```

A dictionary example:

```python
>>> ages = {'kevin': 59, 'bob': 40, 'kayla': 21}
>>> for key in ages:
...     print(key)
...
kevin
bob
kayla
```

A string example:

```python
>>> for letter in "my_string":
...     print(letter)
...
m
y
_
s
t
r
i
n
g
>>>
```

## Unpacking Multiple Items in a `for` Loop

We discussed in the tuples video how you can separate a tuple into multiple variables by “unpacking” the values. Unpacking works in the context of a loop definition, and you’ll need to know this to most effectively iterate over dictionaries because you’ll usually want the key and the value. Let’s iterate of a list of “points” to test this out:

```python
>>> list_of_points = [(1, 2), (2, 3), (3, 4)]
>>> for x, y in list_of_points:
...     print(f"x: {x}, y: {y}")
...
x: 1, y: 2
x: 2, y: 3
x: 3, y: 4
```

Seeing how this unpacking works, let’s use the `items` method on our `ages` dictionary to list out the names and ages:

```python
>>> for name, age in ages.items():
...     print(f"Person Named: {name}")
...     print(f"Age of: {age}")
...
Person Named: kevin
Age of: 59
Person Named: bob
Age of: 40
Person Named: kayla
Age of: 21
```

- - -
&nbsp;

# Logic Operations

Up to this point, we’ve learned how to make simple comparisons, and now it’s time to make compound comparisons using logic/boolean operators.

Python Documentation For This Video:

* [Boolean Operators](https://docs.python.org/3/tutorial/introduction.html#first-steps-towards-programming)

## The `not` Operation

Sometimes we want to know the opposite boolean value for something. This might not sound intuitive, but sometimes we want to execute an `if` statement when a value is `False`, but that’s not how the `if` statement works. Here’s an example of how we can use `not` to make this work:

```python
>>> name = ""
>>> not name
True
>>> if not name:
...     print("No name given")
...
>>>
```

We know that an empty string is a “falsy” value, so `not ""` will always return `True`. `not` will return the opposite boolean value for whatever it’s operating on.

We can also use `not in` to see if an item exists in a list, dictionary, or tuple:

```python
>>> items = [2, 3, 4]
>>> 3 not in items
False
>>> 1 not in items
True
>>> (2, 3) not in [(2, 3), (5, 6), (9, 1)]
False
>>> (2, 3) not in [(2, 7), (7, 3), "hi"]
True
>>> dictionary = {'Mat': 27, 'Kevin': 32, 'Kayla': 42}
>>> "Mat" not in dictionary
False
>>> "Lee" not in dictionary
True
```

Though preferably, if you are checking for keys in a dictionary, use:

```python
>>> dictionary = {'Mat': 27, 'Kevin': 32, 'Kayla': 42}
>>> if dictionary['Mat']:
...     print('key exists')
... else:
...     print('no key')
... 
key exists
>>> if dictionary['Lee']:
...     print('key exists')
... else:
...     print('no key')
... 
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'Lee'
```

[Check if value exists](https://stackoverflow.com/questions/3733992/determine-whether-a-key-is-present-in-a-dictionary)

[Check if key and value exist](https://stackoverflow.com/questions/25711660/check-if-a-specific-key-and-a-value-exist-in-a-dictionary)

## The `or` Operation

Occasionally, we want to carry out a branch in our logic if one condition OR the other condition is `True`. Here is where we’ll use the `or` operation. Let’s see `or` in action with an `if` statement:

```python
>>> first = ""
>>> last = "Thompson"
>>> if first or last:
...     print("The user has a first or last name")
...
The user has a first or last name
>>>
```

If both `first` and `last` were “falsy” then the print would never happen:

```python
>>> first = ""
>>> last = ""
>>> if first or last:
...     print("The user has a first or last name")
...
>>>
```

Another feature of `or` that we should know is that we can use it to set default values for variables:

```python
>>> last = ""
>>> last_name = last or "Doe"
>>> last_name
'Doe'
>>>
```

The `or` operation will return the first value that is “truthy” or the last value in the chain:

```python
>>> 0 or 1
1
>>> 1 or 2
1
```

## The `and` Operation

The opposite of `or` is the `and` operation, which requires both conditions to be `True`. Continuing with our first and last name example, let’s conditionally print based on what we know:

```python
>>> first = "Keith"
>>> last = ""
>>> if first and last:
...     print(f"Full name: {first} {last}")
... elif first:
...     print(f"First name: {first}")
... elif last:
...     print(f"Last name: {last}")
...
First name: Keith
>>>
```

Now let’s try the same thing with both `first` and `last`:

```python
>>> first = "Keith"
>>> last = "Thompson"
>>> if first and last:
...     print(f"Full name: {first} {last}")
... elif first:
...     print(f"First name: {first}")
... elif last:
...     print(f"Last name: {last}")
...
Full name: Keith Thompson
>>>
```

The `and` operation will return the first value that is “falsy” or the last value in the chain:

```python
>>> 0 and 1
0
>>> 1 and 2 # this will say, yep, 1 is True and move onto the next item, hence why it's printed to the console
2
>>> (1 == 1) and print("Something")
Something
>>> (1 == 2) and print("Something")
False
```

- - -
&nbsp;

# Reading user input

Our scripts become most powerful when they can take in inputs and don’t just do the same thing every time. Let’s learn how to prompt the user for input.
Python Documentation For This Video

* [The `input` function](https://docs.python.org/3/library/functions.html#input)

## Accepting User Input Using `input`

We’re going to build a script that requests three pieces of information from the user after the script runs. Let’s collect this data:

* name - The user’s name as a string
* birthdate - The user’s birthdate as a string
* age - The user’s age as an integer (we’ll need to convert it)

`~/bin/age`

```python
#!/usr/bin/env python3.6

name = input("What is your name? ")
birthdate = input("What is your birthdate? ")
age = int(input("How old are you? "))

print(f"{name} was born on {birthdate}")
print(f"Half of your age is {age / 2}")
```

- - -
&nbsp;

# Functions

Being able to write code that we can call multiple times without repeating ourselves is one of the most powerful things that we can do. Let’s learn how to define functions in Python.
Python Documentation For This Video

* [Defining Functions](https://docs.python.org/3/tutorial/controlflow.html#defining-functions)

## Function Basics

We can create functions in Python using the following:

* The `def` keyword
* The function name - lowercase starting with a letter or underscore (`_`)
*Left parenthesis (`(`)
* 0 or more argument names
* Right parenthesis (`)`)
* A colon `:`
* An indented function body

Here’s an example without an argument:

```python
>>> def hello_world():
...     print("Hello, World!")
...
>>> hello_world()
Hello, World!
>>>
```

If we want to define an argument we will put the variable name we want it to have within the parentheses:

```python
>>> def print_name(name):
...     print(f"Name is {name}")
...
>>> print_name("Keith")
Name is Keith
```

Let’s try to assign the value from `print_name` to a variable:

```python
>>> output = print_name("Keith")
Name is Keith
>>> output
>>>
```

Neither of these examples has a return value, but we will usually want to have a return value unless the function is our “main” function or carries out a “side-effect” like printing. If we don’t explicitly declare a return value, then the result will be `None`.

We can declare what we’re returning from a function using the `return` keyword:

```python
>>> def add_two(num):
...     return num + 2
...
>>> result = add_two(2)
>>> result
4
```
# More on functions

Now that we’ve looked into the structure of functions, let’s utilize them in a script.
Python Documentation For This Video

* [Defining Functions](https://docs.python.org/3/tutorial/controlflow.html#defining-functions)

## Encapsulating Behavior with Functions

To dig into functions, we’re going to write a script that prompts the user for some information and calculates the user’s Body Mass Index (BMI). That isn’t a common problem, but it’s something that makes sense as a function and doesn’t require us to use language features that we haven’t learned yet.

Here’s the formula for BMI:

`BMI = (weight in kg / height in meters squared )`

For Imperial systems, it’s the same formula except you multiply the result by `703`.

We want to prompt the user for their information, gather the results, and make the calculations if we can. If we can’t understand the measurement system, then we need to prompt the user again after explaining the error.

## Gathering Info

Since we want to be able to prompt a user multiple times we’re going to package up our calls to `input` within a single function that returns a tuple with the user given information:

```python
def gather_info():
    height = float(input("What is your height? (inches or meters) "))
    weight = float(input("What is your weight? (pounds or kilograms) "))
    system = input("Are your measurements in metric or imperial units? ").lower().strip()
    return (height, weight, system)
```

We’re converting the `height` and `weight` into `float` values, and we’re okay with a potential error if the user inputs an invalid number. For the `system`, we’re going to standardize things by calling `lower` to lowercase the input and then calling `strip` to remove the whitespace from the beginning and the end.

The most important thing about this function is the `return` statement that we added to ensure that we can pass the `height`, `weight`, and `system` back to the caller of the function.

## Calculating and Printing the BMI

Once we’ve gathered the information, we need to use that information to calculate the BMI. Let’s write a function that can do this:

```python
def calculate_bmi(weight, height, system='metric'):
    """
    Return the Body Mass Index (BMI) for the
    given weight, height, and measurement system.
    """
    if system == 'metric':
        bmi = (weight / (height ** 2))
    else:
        bmi = 703 * (weight / (height ** 2))
    return bmi
```

This function will return the calculated value, and we can decide what to do with it in the normal flow of our script.

The triple-quoted string we used at the top of our function is known as a “documentation string” or “doc string” and can be used to automatically generated documentation for our code using tools in the Python ecosystem.

## Setting Up The Script’s Flow

Our functions don’t do us any good if we don’t call them. Now it’s time for us to set up our scripts flow. We want to be able to re-prompt the user, so we want to utilize an intentional infinite loop that we can break out of. Depending on the `system`, we’ll determine how we should calculate the BMI or prompt the user again. Here’s our flow:

```python
while True:
    height, weight, system = gather_info()
    if system.startswith('i'):
        bmi = calculate_bmi(weight, system='imperial', height=height)
        print(f"Your BMI is {bmi}")
        break
    elif system.startswith('m'):
        bmi = calculate_bmi(weight, height)
        print(f"Your BMI is {bmi}")
        break
    else:
        print("Error: Unknown measurement system. Please use imperial or metric.")
```

## Full Script

Once we’ve written our script, we’ll need to make it executable (using `chmod u+x ~/bin/bmi`).

_~/bin/bmi_
```python
#!/usr/bin/env python3.6

def gather_info():
    height = float(input("What is your height? (inches or meters) "))
    weight = float(input("What is your weight? (pounds or kilograms) "))
    system = input("Are your mearsurements in metric or imperial systems? ").lower().strip()
    return (height, weight, system)

def calculate_bmi(weight, height, system='metric'):
    if system == 'metric':
        bmi = (weight / (height ** 2))
    else:
        bmi = 703 * (weight / (height ** 2))
    return bmi

while True:
    height, weight, system = gather_info()
    if system.startswith('i'):
        bmi = calculate_bmi(weight, system='imperial', height=height)
        print(f"Your BMI is {bmi}")
        break
    elif system.startswith('m'):
        bmi = calculate_bmi(weight, height)
        print(f"Your BMI is {bmi}")
        break
    else:
        print("Error: Unknown measurement system. Please use imperial or metric.")
```

- - -
&nbsp;

# Using Standard Library Packages

One of the best reasons to use Python for scripting is that it comes with a lot of useful packages in the standard library.

## Python Documentation For This Video

* [Python Library Reference](https://docs.python.org/3/library/index.html)
* [The time package](https://docs.python.org/3/library/time.html)

## Utilizing Packages

Up to this point, we’ve only used functions and types that are always globally available, but there are a lot of functions that we can use if we import them from the standard library. Importing packages can be done in a few different ways, but the simplest is using the `import` statement. Here’s how we can import the `time` package for use:

```python
>>> import time
>>>
```

Importing the package allows us to access functions and classes that it defines. We can do that by chaining off of the package name. Let’s call the `localtime` function provided by the `time` package:

```python
>>> now = time.localtime()
>>> now
time.struct_time(tm_year=2018, tm_mon=1, tm_mday=26, tm_hour=15, tm_min=32, tm_sec=43, tm_wday=4, tm_yday=26, tm_isdst=0)
```

Calling this function returns a `time.struct_time` to use that has some attributes that we can interact with using a period (`.`):

```python
>>> now.tm_hour
15
```

Here is our first time interaction with an attribute on an object that isn’t a function. Sometimes we need to access the data from an object, and for that, we don’t need to use parentheses.

## Building a Stopwatch Script

To put our knowledge of the standard library to use, we’re going to read through the [`time` package’s documentation](https://docs.python.org/3/library/time.html) and utilize some of its functions and types to build a stopwatch. We’ll be using the following functions:

[`localtime`(https://docs.python.org/3/library/time.html#time.localtime)] - gives us the time_struct for the current moment
[`strftime`](https://docs.python.org/3/library/time.html#time.strftime) - allows us to specify how to represent the time_struct as a string.
[`mktime`](https://docs.python.org/3/library/time.html#time.mktime) - converts a time_struct into a numeric value so we can calculate the time difference.

_~/bin/timer_

```python
#!/usr/bin/env python3.6
import time


start_time = time.localtime()

print(f"Timer started at {time.strftime('%X', start_time)}")


#Wait for user to stop timer

input("Press 'Enter' to stop timer ")


stop_time = time.localtime()

difference = time.mktime(stop_time) - time.mktime(start_time)


print(f"Timer stopped at {time.strftime('%X', stop_time)}")

print(f"Total time: {difference} seconds")
```

## Importing Specifics From a Module

We’re only using a subset of the functions from the `time` package, and it’s a good practice to only import what we need. We can import a subset of a module using the `from`statement combined with our `import`. The usage will look like this:

```python
from MODULE import FUNC1, FUNC2, etc...
```

Let’s convert our script over to only import the functions that we need using the `from` statement:

_~/bin/timer_

```python
#!/usr/bin/env python3.6
from time import localtime, mktime, strftime


start_time = localtime()

print(f"Timer started at {strftime('%X', start_time)}")


#Wait for user to stop timer

input("Press 'Enter' key to stop timer ")


stop_time = localtime()

difference = mktime(stop_time) - mktime(start_time)


print(f"Timer stopped at {strftime('%X', stop_time)}")

print(f"Total time: {difference} seconds")
```

- - -
&nbsp;

# Environemnt Variables

A common way to configure a script or CLI is to use environment variables. Let’s learn how we can access environment variables from inside of our Python scripts.

## Python Documentation For This Video

* [The `os` package](https://docs.python.org/3/library/os.html)
* [The `os.environ` attribute](https://docs.python.org/3/library/os.html#os.environ)
* [The `os.getenv` function](https://docs.python.org/3/library/os.html#os.getenv)

## Working with Environment Variables

By importing the `os` package, we’re able to access a lot of miscellaneous operating system level attributes and functions, not the least of which is the `environ` object. This object behaves like a dictionary, so we can use the subscript operation to read from it.

Let’s create a simple script that will read a `'STAGE'` environment variable and print out what stage we’re currently running in:

_~/bin/running_

```python
#!/usr/bin/env python3.6

import os


stage = os.environ["STAGE"].upper()


output = f"We're running in {stage}"


if stage.startswith("PROD"):
    output = "DANGER!!! - " + output


print(output)
```

We can set the environment variable when we run the script to test the differences:

```
$ STAGE=staging running
We're running in STAGING
$ STAGE=production running
DANGER!!! - We're running in PRODUCTION
```

What happens if the 'STAGE' environment variable isn’t set though?
```
$ running
Traceback (most recent call last):
  File "/home/user/bin/running", line 5, in 
    stage = os.environ["STAGE"].upper()
  File "/usr/local/lib/python3.6/os.py", line 669, in __getitem__
    raise KeyError(key) from None
KeyError: 'STAGE'
```
This potential `KeyError` is the biggest downfall of using `os.environ`, and the reason that we will usually use `os.getenv`.

## Handling A Missing Environment Variable

If the `'STAGE'` environment variable isn’t set, then we want to default to `'DEV'`, and we can do that by using the `os.getenv` function:

_~/bin/running_

```python
#!/usr/bin/env python3.6

import os


stage = os.getenv("STAGE", "dev").upper()


output = f"We're running in {stage}"


if stage.startswith("PROD"):
    output = "DANGER!!! - " + output


print(output)
```

Now if we run our script without a `'STAGE'` we won’t have an error:

```
$ running
We're running in DEV
```

- - -
&nbsp;

# Interacting with files

Let’s learn how to interact with files in Python.

## Python Documentation For This Video

* [The `ope`n function](https://docs.python.org/3/library/functions.html#open)
* [The `file-object`](https://docs.python.org/3/glossary.html#term-file-object)
* [The `io` module](https://docs.python.org/3/library/io.html#io-overview)

## Interacting with Files

It’s pretty common to need to read the contents of a file in a script and Python makes that pretty easy for us. Before we get started, let’s create a text file that we can read from called `xmen_base.txt`:

_~/xmen_base.txt_

```
Storm
Wolverine
Cyclops
Bishop
Nightcrawler
```

Now that we have a file to work with, let’s experiment from the REPL before writing scripts that utilize files.

## Opening and Reading a File

Before we can read a file, we need to open a connection to the file. Let’s open the `xmen_base.txt` file to see what a file object can do:

```python
>>> xmen_file = open('xmen_base.txt', 'r')
>>> xmen_file
<_io.TextIOWrapper name='xmen_base.txt' mode='r' encoding='UTF-8'>
```

The [`open`](https://docs.python.org/3/library/functions.html#open) function allows us to connect to our file by specifying the path and the mode. We can see that our `xmen_file` object is an `_io.TextIOWrapper` so we can look at [the documentation](https://docs.python.org/3/library/io.html#io.TextIOWrapper) to see what we can do with that type of object.

There is a `read` function so let’s try to use that:

```python
>>> xmen_file.read()
'Storm\nWolverine\nCyclops\nBishop\nNightcrawler\n'
>>> xmen_file.read()
''
```

`read` gives us all of the content as a single string, but notice that it gave us an empty string when we called the function as second time. That happens because the file maintains a cursor position and when we first called `read` the cursor was moved to the very end of the file’s contents. If we want to reread the file we’ll need to move the beginning of the file using the `seek` function like so:

```python
>>> xmen_file.seek(0)
0
>>> xmen_file.read()
'Storm\nWolverine\nCyclops\nBishop\nNightcrawler\n'
>>> xmen_file.seek(6)
6
>>> xmen_file.read()
'Wolverine\nCyclops\nBishop\nNightcrawler\n'
```

By seeking to a specific point of the file, we are able to get a string that only contains what is after our cursor’s location.

Another way that we can read through content is by using a `for` loop:

```python
>>> xmen_file.seek(0)
0
>>> for line in xmen_file:
...     print(line, end="")
...
Storm
Wolverine
Cyclops
Bishop
Nightcrawler
>>>
```

Notice that we added a custom `end` to our printing because we knew that there were already newline characters (`\n`) in each line.

Once we’re finished working with a file, it is import that we close our connection to the file using the `close` function:

```python
>>> xmen_file.close()
>>> xmen_file.read()
Traceback (most recent call last):
  File "", line 1, in 
ValueError: I/O operation on closed file.
>>>
```

## Creating a New File and Writing to It

We now know the basics of reading a file, but we’re also going to need to know how to write content to files. Let’s create a copy of our xmen file that we can add additional content to:

```python
>>> xmen_base = open('xmen_base.txt')
>>> new_xmen = open('new_xmen.txt', 'w')
```

We have to reopen our previous connection to the `xmen_base.txt` so that we can read it again. We then create a connection to a file that doesn't exist yet and set the mode to `w`, which stands for “write”. The opposite of the `read` function is the `write` function, and we can use both of those to populate our new file:

```python
>>> new_xmen.write(xmen_base.read())
>>> new_xmen.close()
>>> new_xmen = open(new_xmen.name, 'r+')
>>> new_xmen.read()
'Storm\nWolverine\nCyclops\nBishop\nNightcrawler\n'
```

We did quite a bit there, let’s break that down:

* We `read` from the base file and used the return value as the argument to `write` for our new file.
* We closed the new file.
* We reopened the new file, using the `r+` mode which will allow us to read and write content to the file.
* We `read` the content from the new file to ensure that it wrote properly.

Now that we have a file that we can read and write from let’s add some more names:

```python
>>> new_xmen.seek(0)
>>> new_xmen.write("Beast\n")
6
>>> new_xmen.write("Phoenix\n")
8
>>> new_xmen.seek(0)
0
>>> new_xmen.read()
'Beast\nPhoenix\ne\nCyclops\nBishop\nNightcrawler\n'
```

What happened there? Since we are using the `r+` we are overwriting the file on a per character basis since we used `seek` to go back to the beginning of the file. If we reopen the file in the `w` mode, the pre-existing contents will be truncated.

## Appending to a File

A fairly common thing to want to do is to append to a file without reading its current contents. This can be done with the `a` mode. Let’s `close` the `xmen_base.txt` file and reopen it in the a mode to add another name without worrying about losing our original content. This time, we’re going to use the `with` statement to temporarily open the file and have it automatically closed after our code block has executed:

```python
>>> xmen_file.close()
>>> with open('xmen_base.txt', 'a') as f:
...     f.write('Professor Xavier\n')
...
17
>>> f = open('xmen_base.txt', 'a')
>>> with f:
...     f.write("Something\n")
...
10
>>> exit()
```

To test what we just did, let’s cat out the contents of this file:

```
$ cat xmen_base.txt
Storm
Wolverine
Cyclops
Bishop
Nightcrawler
Professor Xavier
Something
```

- - -
&nbsp;

# Parsing Command Line Parameters

Many times scripts are more useful if we can pass in arguments when we type the command rather than having a second step to get user input.

## Python Documentation For This Video

* [The `sys` module](https://docs.python.org/3/library/sys.html)
* [The `sys.argv` attribute](https://docs.python.org/3/library/sys.html#sys.argv)

## Accepting Simple Positional Arguments

Most of the scripts and utilities that we work with accept positional arguments instead of prompting us for information after we’ve run the command. The simplest way for us to do this in Python is to use the [`sys` module’s `argv` attribute](https://docs.python.org/3/library/sys.html#sys.argv). Let’s try this out by writing a small script that echoes our first argument back to us:

_~/bin/param_echo_

```python
#!/usr/bin/env python3.6

import sys


print(f"First argument {sys.argv[0]}")
```

After we make this executable and give it a shot, we see that the first argument is the script itself:

```bash
$ chmod u+x ~/bin/param_echo
$ param_echo testing
First argument /home/user/bin/param_echo
```

That’s not quite what we wanted, but now we know that [`argv`](https://docs.python.org/3/library/sys.html#sys.argv) will contain the script and we’ll need to get the index of `1` for our first argument. Let’s adjust our script to echo all of the arguments except the script name and then echo the first positional argument by itself:

_~/bin/param_echo_

```python
#!/usr/bin/env python3.6

import sys


print(f"Positional arguments: {sys.argv[1:]}")
print(f"First argument: {sys.argv[1]}")
```

Trying the same command again, we get a much different result:

```bash
$ param_echo testing
Positional arguments: ['testing']
First argument: testing
$ param_echo testing testing12 'another argument'
Positional arguments: ['testing', 'testing12', 'another argument']
First argument: testing
$ param_echo
Positional arguments: []
Traceback (most recent call last):
  File "/home/user/bin/param_echo", line 6, in 
    print(f"First argument: {sys.argv[1]}")
IndexError: list index out of range
```

This shows us a few things about working with `argv`:

1. Positional arguments are based on spaces unless we explicitly wrap the argument in quotes.
2. We can get a slice of the first index and after without worrying about it being empty.
3. We risk an `IndexError` if we assume that there will be an argument for a specific position and one isn’t given.

Using [`sys.argv`](https://docs.python.org/3/library/sys.html#sys.argv) is the simplest way to allow our scripts to accept positional arguments. In the next video, we’ll explore a standard library package that will allow us to provide a more robust command line experience with help text, named arguments, and flags.

- - -
&nbsp;

# Robust CLIs with 'argparse'

We can build simple scripts with positional arguments using `sys.argv`, but when we want to provide a better command-line user experience, we should use something that can provide contextual information and documentation. Let's learn how to use the [`argparse`](https://docs.python.org/3/library/argparse.html) module to do just that.

## Python Documentation For This Video

-   [The `argparse` module](https://docs.python.org/3/library/argparse.html)
-   [The `argparse.ArgumentParser` class](https://docs.python.org/3/library/argparse.html#argparse.ArgumentParser)

## Building a CLI to Reverse Files

The tool that we're going to build in this video will need to do the following:

1.  Require a `filename` argument, so it knows what file to read.
2.  Print the contents of the file backward (bottom of the script first, each line printed backward)
3.  Provide help text and documentation when it receives the `--help` flag.
4.  Accept an optional `--limit` or `-l` flag to specify how many lines to read from the file.
5.  Accept a `--version` flag to print out the current version of the tool.

This sounds like quite a bit, but thankfully the [`argparse`](https://docs.python.org/3/library/argparse.html) module will make doing most of this trivial. We'll build this script up gradually as we learn what the [`argparse.ArgumentParser`](https://docs.python.org/3/library/argparse.html#argparse.ArgumentParser) can do. Let's start by building an `ArgumentParser` with our required argument:

*~/bin/reverse-file*

```python
#!/usr/bin/env python3.6

import argparse

```

Here we've created an instance of `ArgumentParser` without any arguments. Next, we'll use the [`add_argument`](https://docs.python.org/3/library/argparse.html#argparse.ArgumentParser.add_argument) method to specify a positional argument called `filename` and provide some help text using the `help` argument. Finally, we tell the parser to parse the arguments from stdin using the [`parse_args`](https://docs.python.org/3/library/argparse.html#argparse.ArgumentParser.parse_args) method and stored off the parsed arguments as the variable `args`.

Let's make our script executable and try this out without any arguments:

```bash
$ chmod u+x ~/bin/reverse-file
$ reverse-file
usage: reverse-file [-h] filename
reverse-file: error: the following arguments are required: filename
```

Since `filename` is required and wasn't given the `ArgumentParser` object recognized the problem and returned a useful error message. That's awesome! We can also see that it looks like it takes the `-h` flag already, let's try that now:

```bash
$ reverse-file -h
usage: reverse-file [-h] filename

positional arguments:
  filename    the file to read

```

It looks like we've already handled our requirement to provide help text. The last thing we need to test out is what happens when we do provide a parameter for `filename`:

```bash
$ reverse-file testing.txt
Namespace(filename='testing.txt')
```

We can see here that `args` in our script is a [`Namespace`](https://docs.python.org/3/library/argparse.html#argparse.Namespace) object. This is a simple type of object that's sole purpose is to hold onto named pieces of information from our `ArgumentParser` as attributes. The only attribute that we've asked it to hold onto is the `filename` attribute, and we can see that it set the value to `'testing.txt'` since that's what we passed in. To access these values in our code, we will chain off of our `args` object with a period:

```python
>>> args.filename
'testing.txt'
```

## Adding Optional parameters

We've already handled two of the five requirements we set for this script; let's continue by adding the optional flags to our parser and then we'll finish by implementing the real script logic. We need to add a `--limit` flag with a `-l` alias.

*~/bin/reverse-file*

```python
#!/usr/bin/env python3.6
import argparse

parser = argparse.ArgumentParser(description='Read a file in reverse')
parser.add_argument('filename', help='the file to read')
parser.add_argument('--limit', '-l', type=int, help='the number of lines to read')

```

To specify that an argument is a flag, we need to place two hyphens at the beginning of the flag's name. We've used the `type` option for `add_argument` to state that we want the value converted to an integer, and we specified a shorter version of the flag as our second argument.

Here is what `args` now looks like:

```bash
$ reverse-file --limit 5 testing.txt
Namespace(filename='testing.txt', limit=5)
```

Next, we'll add a `--version` flag. This one will be a little different because we're going to use the `action` option to specify a string to print out when this flag is received:

*~/bin/reverse-file*

```python
#!/usr/bin/env python3.6
import argparse

parser = argparse.ArgumentParser(description='Read a file in reverse')
parser.add_argument('filename', help='the file to read')
parser.add_argument('--limit', '-l', type=int, help='the number of lines to read')
parser.add_argument('--version', '-v', action='version', version='%(prog)s 1.0')

```

This uses a built-in action type of [`version`](https://docs.python.org/3/library/argparse.html#action) which we've found in the documentation.

Here's what we get when we test out the `--version` flag:

```bash
$ reverse-file --version
reverse-file 1.0
```

*Note:* Notice that it carried out the `version` action and didn't continue going through the script.

## Time to reverse

We've implemented the CLI parser for our `reverse-file` script, and now it's time to utilize the arguments that were parsed to reverse the given file's content.

## Python Documentation For This Video

-   [The `argparse` module](https://docs.python.org/3/library/argparse.html)
-   [The `argparse.ArgumentParser` class](https://docs.python.org/3/library/argparse.html#argparse.ArgumentParser)

## Adding Our Business Logic

We finally get a chance to use our file IO knowledge in a script:

*~/bin/reverse-file*

```python
#!/usr/bin/env python3.6
import argparse

parser = argparse.ArgumentParser(description='Read a file in reverse')
parser.add_argument('filename', help='the file to read')
parser.add_argument('--limit', '-l', type=int, help='the number of lines to read')
parser.add_argument('--version', '-v', action='version', version='%(prog)s 1.0')
args = parser.parse_args()
with open(args.filename) as f:
    lines = f.readlines()
    lines.reverse()
if args.limit:
    lines = lines[:args.limit]

for line in lines:
    print(line.strip()[::-1])</code></pre>
```

Here's what we get when we test this out on the xmen_base.txt file from our working with files video:

```bash
$ reverse-file xmen_base.txt
gnihtemoS
reivaX rosseforP
relwarcthgiN
pohsiB
spolcyC
enirevloW
mrotS
$ reverse-file -l 2 xmen_base.txt
gnihtemoS
reivaX rosseforP
```

- - -
&nbsp;

# Error Handling

We've run into a few situations already where we could run into errors, particularly when working with user input. Let's learn how to handle these errors gracefully to write the best possible scripts.

## Python Documentation For This Video

-   [The `try` statement & workflow](https://docs.python.org/3/reference/compound_stmts.html#the-try-statement)

## Handling Errors with try/except/else/finally

In our `reverse-file` script, what happens if the filename doesn't exist? Let's give it a shot:

```bash
$ reverse-file fake.txt
Traceback (most recent call last):
  File "/home/user/bin/reverse-file", line 11, in
    with open(args.filename) as f:
FileNotFoundError: [Errno 2] No such file or directory: 'fake.txt'
```

This `FileNotFoundError` is something that we can expect to happen quite often and our script should handle this situation. Our parser isn't going to catch this because we're technically using the CLI properly, so we need to handle this ourselves. To handle these errors we're going to utilize the keywords [`try`](https://docs.python.org/3/reference/compound_stmts.html#the-try-statement), `except`, and `else`.

*~/bin/reverse-file*

```python
#!/usr/bin/env python3.6
import argparse

parser = argparse.ArgumentParser(description='Read a file in reverse')
parser.add_argument('filename', help='the file to read')
parser.add_argument('--limit', '-l', type=int, help='the number of lines to read')
parser.add_argument('--version', '-v', action='version', version='%(prog)s verison 1.0')
args = parser.parse_args()
try:
    f = open(args.filename)
    limit = args.limit
except FileNotFoundError as err:
    print(f"Error: {err}")
else:
    with f:
        lines = f.readlines()
        lines.reverse()
    if limit:
        lines = lines[:limit]

    for line in lines:
        print(line.strip()[::-1])</code></pre>
```

We utilize the `try` statement to denote that it's quite possible for an error to happen within it. From there we can handle specific types of errors using the `except` keyword (we can have more than one). In the event that there isn't an error, then we want to carry out the code that is in the `else` block. If we want to execute some code regardless of there being an error or not, we can put that in a `finally` block at the very end of our `try/except` workflow.
Now when we try our script with a fake file, we get a much better response:

```bash
$ reverse-file fake.txt
Error: [Errno 2] No such file or directory: 'fake.txt'
```

- - -
&nbsp;

# Exit statuses

When we're writing scripts, we'll want to be able to set exit statuses if something goes wrong. For that, we'll be using [the `sys` module](https://docs.python.org/3/library/sys.html).

## Python Documentation For This Video

-   [The `sys` module](https://docs.python.org/3/library/sys.html)
-   [The `sys.exit` function](https://docs.python.org/3/library/sys.html#sys.exit)

## Adding Error Exit Status to `reverse-file`

When our `reverse-file` script receives a file that doesn't exist, we show an error message, but we don't set the exit status to `1` to be indicative of an error.

```bash
$ reverse-file -l 2 fake.txt
Error: [Errno 2] No such file or directory: 'fake.txt'
~ $ echo $?
0
```

Let's use the [`sys.exit`](https://docs.python.org/3/library/sys.html#sys.exit) function to accomplish this:

*~/bin/reverse-file*

```python
#!/usr/bin/env python3.6

import argparse
import sys

parser = argparse.ArgumentParser(description='Read a file in reverse')
parser.add_argument('filename', help='the file to read')
parser.add_argument('--limit', '-l', type=int, help='the number of lines to read')
parser.add_argument('--version', '-v', action='version', version='%(prog)s verison 1.0')
args = parser.parse_args()
try:
    f = open(args.filename)
    limit = args.limit
except FileNotFoundError as err:
    print(f"Error: {err}")
    sys.exit(1)
else:
    with f:
        lines = f.readlines()
        lines.reverse()
    if limit:
        lines = lines[:limit]

    for line in lines:
        print(line.strip()[::-1])</code></pre>
```

Now, if we try our script with a missing file, we will exit with the proper code:

```bash
$ reverse-file -l 2 fake.txt
Error: [Errno 2] No such file or directory: 'fake.txt'
$ echo $?
1
```

- - -
&nbsp;

# Execute Shell Commands from Python

Sometimes when we're scripting, we need to call a separate shell command. Not every tool is written in python, but we can still interact with the userland API of other tools.

## Python Documentation For This Video

-   [The `subprocess` module](https://docs.python.org/3/library/subprocess.html)
-   [The `subprocess.run` function](https://docs.python.org/3/library/subprocess.html#subprocess.run)
-   [The `subprocess.CompletedProcess` class](https://docs.python.org/3/library/subprocess.html#subprocess.CompletedProcess)
-   [The `subprocess.PIPE` object](https://docs.python.org/3/library/subprocess.html#subprocess.PIPE)
-   [The `bytes` type](https://docs.python.org/3/library/stdtypes.html#bytes)
-   [The `subprocess.CalledProcessError` class](https://docs.python.org/3/library/subprocess.html#subprocess.CalledProcessError)

## Executing Shell Commands With `subprocess.run`

For working with external processes, we're going to experiment with the [`subprocess`](https://docs.python.org/3/library/subprocess.html) module from the REPL. The main function that we're going to work with is the [`subprocess.run`](https://docs.python.org/3/library/subprocess.html#subprocess.run) function, and it provides us with a lot of flexibility:

```
>>> import subprocess
>>> proc = subprocess.run(['ls', '-l'])
total 20
drwxrwxr-x. 2 user user  54 Jan 28 15:36 bin
drwxr-xr-x. 2 user user   6 Jan  7  2015 Desktop
-rw-rw-r--. 1 user user  44 Jan 26 22:16 new_xmen.txt
-rw-rw-r--. 1 user user  98 Jan 26 21:39 read_file.py
-rw-rw-r--. 1 user user 431 Aug  6  2015 VNCHOWTO
-rw-rw-r--. 1 user user  61 Jan 28 14:11 xmen_base.txt
-rw-------. 1 user user  68 Mar 18  2016 xrdp-chansrv.log
>>> proc
CompletedProcess(args=['ls', '-l'], returncode=0)
```

Our `proc` variable is a [`CompletedProcess`](https://docs.python.org/3/library/subprocess.html#subprocess.CompletedProcess) object, and this provides us with a lot of flexibility. We have access to the `returncode` attribute on our `proc` variable to ensure that it succeeded and returned a `0` to us. Notice that the `ls` command was executed and printed to the screen without us specifying to print anything. We can get around this by capturing STDOUT using a [`subprocess.PIPE`](https://docs.python.org/3/library/subprocess.html#subprocess.PIPE).

```
>>> proc = subprocess.run(
...     ['ls', '-l'],
...     stdout=subprocess.PIPE,
...     stderr=subprocess.PIPE,
... )
>>> proc
CompletedProcess(args=['ls', '-l'], returncode=0, stdout=b'total 20\ndrwxrwxr-x. 2 user user  54 Jan 28 15:36 bin\ndrwxr-xr-x. 2 user user   6 Jan  7  2015 Desktop\n-rw-rw-r--. 1 user user  44 Jan 26 22:16 new_xmen.txt\n-rw-rw-r--. 1 user user  98 Jan 26 21:39 read_file.py\n-rw-rw-r--. 1 user user 431 Aug  6  2015 VNCHOWTO\n-rw-rw-r--. 1 user user  61 Jan 28 14:11 xmen_base.txt\n-rw-------. 1 user user  68 Mar 18  2016 xrdp-chansrv.log\n', stderr=b'')
>>> proc.stdout
b'total 20\ndrwxrwxr-x. 2 user user  54 Jan 28 15:36 bin\ndrwxr-xr-x. 2 user user   6 Jan  7  2015 Desktop\n-rw-rw-r--. 1 user user  44 Jan 26 22:16 new_xmen.txt\n-rw-rw-r--. 1 user user  98 Jan 26 21:39 read_file.py\n-rw-rw-r--. 1 user user 431 Aug  6  2015 VNCHOWTO\n-rw-rw-r--. 1 user user  61 Jan 28 14:11 xmen_base.txt\n-rw-------. 1 user user  68 Mar 18  2016 xrdp-chansrv.log\n'
```

Now that we've captured the output to attributes on our `proc` variable, we can work with it from within our script and determine whether or not it should ever be printed. Take a look at this string that is prefixed with a `b` character. It is because it is a [`bytes`](https://docs.python.org/3/library/stdtypes.html#bytes) object and not a string. The `bytes` type can only contain ASCII characters and won't do anything special with escape sequences when printed. If we want to utilize this value as a string, we need to explicitly convert it using the [`bytes.decode`](https://docs.python.org/3/library/stdtypes.html#bytes.decode) method.

```
>>> print(proc.stdout)
b'total 20\ndrwxrwxr-x. 2 user user  54 Jan 28 15:36 bin\ndrwxr-xr-x. 2 user user   6 Jan  7  2015 Desktop\n-rw-rw-r--. 1 user user  44 Jan 26 22:16 new_xmen.txt\n-rw-rw-r--. 1 user user  98 Jan 26 21:39 read_file.py\n-rw-rw-r--. 1 user user 431 Aug  6  2015 VNCHOWTO\n-rw-rw-r--. 1 user user  61 Jan 28 14:11 xmen_base.txt\n-rw-------. 1 user user  68 Mar 18  2016 xrdp-chansrv.log\n'
>>> print(proc.stdout.decode())
total 20
drwxrwxr-x. 2 user user  54 Jan 28 15:36 bin
drwxr-xr-x. 2 user user   6 Jan  7  2015 Desktop
-rw-rw-r--. 1 user user  44 Jan 26 22:16 new_xmen.txt
-rw-rw-r--. 1 user user  98 Jan 26 21:39 read_file.py
-rw-rw-r--. 1 user user 431 Aug  6  2015 VNCHOWTO
-rw-rw-r--. 1 user user  61 Jan 28 14:11 xmen_base.txt
-rw-------. 1 user user  68 Mar 18  2016 xrdp-chansrv.log

```

## Intentionally Raising Errors

The [`subprocess.run`](https://docs.python.org/3/library/subprocess.html#subprocess.run) function will not raise an error by default if you execute something that returns a non-zero exit status. Here's an example of this:

```
>>> new_proc = subprocess.run(['cat', 'fake.txt'])
cat: fake.txt: No such file or directory
>>> new_proc
CompletedProcess(args=['cat', 'fake.txt'], returncode=1)
```

In this situation, we might want to raise an error, and if we pass the `check` argument to the function, it will raise a [`subprocess.CalledProcessError`](https://docs.python.org/3/library/subprocess.html#subprocess.CalledProcessError) if something goes wrong:

```
>>> error_proc = subprocess.run(['cat', 'fake.txt'], check=True)
cat: fake.txt: No such file or directory
Traceback (most recent call last):
  File "", line 1, in
  File "/usr/local/lib/python3.6/subprocess.py", line 418, in run
    output=stdout, stderr=stderr)
subprocess.CalledProcessError: Command '['cat', 'fake.txt']' returned non-zero exit status 1.
>>>
```

## Python 2 Compatible Functions

If you're interested in writing code with the [`subprocess`](https://docs.python.org/3/library/subprocess.html) module that will still work with Python 2, then you cannot use the [`subprocess.run`](https://docs.python.org/3/library/subprocess.html#subprocess.run) function because it's only in Python 3. For this situation, you'll want to look into using [`subprocess.call`](https://docs.python.org/3/library/subprocess.html#subprocess.call) and [`subprocess.check_output`](https://docs.python.org/3/library/subprocess.html#subprocess.check_output).

- - -
&nbsp;

# Advanced Iteration With List Comprehensions

We've talked about how often we're likely to work with large amounts of data, and we often want to take a list and either:

1.  Filter out items in that list
2.  Modify every item in the list

For this, we can utilize ["list comprehensions"](https://docs.python.org/3/tutorial/datastructures.html#list-comprehensions).

## Python Documentation For This Video

-   [List Comprehensions](https://docs.python.org/3/tutorial/datastructures.html#list-comprehensions)

*Note:* we need the words file to exist at `/usr/share/dict/words` for this video. This can be installed via:

```bash
$ sudo yum install -y words
```

## Our `contains` Script

To dig into [list comprehensions](https://docs.python.org/3/tutorial/datastructures.html#list-comprehensions), we're going to write a script that takes a word that then returns all of the values in the "words" file on our machine that contain the word. Our first step will be writing the script using standard iteration, and then we're going to refactor our script to utilize a [list comprehension](https://docs.python.org/3/tutorial/datastructures.html#list-comprehensions).

*~/bin/contains*

```python
#!/usr/bin/env python3.6

import argparse
parser = argparse.ArgumentParser(description='Search for words including partial word')
parser.add_argument('snippet', help='partial (or complete) string to search for in words')
args = parser.parse_args()
snippet = args.snippet.lower()
with open('/usr/share/dict/words') as f:
  words = f.readlines()
matches = []
for word in words:
   if snippet in word.lower():
       matches.append(word)

```

Let's test out our first draft of the script to make sure that it works:

```bash
$ chmod u+x bin/contains
$ contains Keith
['Keith\n', 'Keithley\n', 'Keithsburg\n', 'Keithville\n']
```

*Note:* Depending on your system's words file your results may vary.

## Utilizing a List Comprehension

This portion of our script is pretty standard:

*~/bin/contains* (partial)

```python
words = open('/usr/share/dict/words').readlines()
matches = []

for word in words:
   if snippet in word.lower():
       matches.append(word)

```

We can rewrite that chunk of our script as one or two lines using a [list comprehension](https://docs.python.org/3/tutorial/datastructures.html#list-comprehensions):

*~/bin/contains* (partial)

```python
words = open('/usr/share/dict/words').readlines()
print([word for word in words if snippet in word.lower()])
```

We can take this even further by removing the `'\n'` from the end of each "word" we return:

*~/bin/contains* (partial)

```python
words = open('/usr/share/dict/words').readlines()
print([word.strip() for word in words if snippet in word.lower()])
```

## Final Version

Here's the final version of our script that works (nearly) the same as our original version:

*~/bin/contains*

```python
#!/usr/bin/env python3.6

import argparse
parser = argparse.ArgumentParser(description='Search for words including partial word')
parser.add_argument('snippet', help='partial (or complete) string to search for in words')
args = parser.parse_args()
snippet = args.snippet.lower()

```

Here's our output:

```bash
$ contains Keith
['Keith', 'Keithley', 'Keithsburg', 'Keithville']
```

- - -
&nbsp;

# `random` and `json`

Over the next few videos, we're going to look at some more useful packages that we have access to from the Python standard library as we build a tool to reconcile some receipts.

## Python Documentation For This Video

-   [The `random` module](https://docs.python.org/3/library/random.html)
-   [The `json` module](https://docs.python.org/3/library/json.html)
-   [The `range` type](https://docs.python.org/3/library/stdtypes.html#range)

## Generating Random Test Data

To write our receipt reconciliation tool, we need to have some receipts to work with as we're testing out our implementation. We're expecting receipts to be JSON files that contain some specific data and we're going to write a script that will create some receipts for us.

We're working on a system that requires some local paths, so let's put what we're doing in a `receipts` directory:

```bash
$ mkdir -p receipts/new
$ cd receipts
```

The receipts that haven't been reconciled will go in the `new` directory, so we've already created that. Let's create a `gen_receipts.py` file to create some unreconciled receipts when we run it:

*~/receipts/gen_receipts.py*

```python
import random
import os
import json

count = int(os.getenv("FILE_COUNT") or 100)
words = [word.strip() for word in open('/usr/share/dict/words').readlines()]

for identifier in range(count):
    amount = random.uniform(1.0, 1000)
    content = {
        'topic': random.choice(words),
        'value': "%.2f" % amount
    }
    with open(f'./new/receipt-{identifier}.json', 'w') as f:
        json.dump(content, f)
```

We're using the [`json.dump`](https://docs.python.org/3/library/json.html#json.dump) function to ensure that we're writing out valid JSON (we'll read it in later). [`random.choice`](https://docs.python.org/3/library/random.html#random.choice) allows us to select one item from an iterable (str, tuple, or list). The function [`random.uniform`](https://docs.python.org/3/library/random.html#random.uniform) gives us a float between the two bounds specified. This code does show us how to create a [`range`](https://docs.python.org/3/library/stdtypes.html#range), which takes a starting number and an ending number and can be iterated through the values between.

Now we can run our script using the `python3.6` command:

```bash
$ FILE_COUNT=10 python3.6 gen_receipts.py
$ ls new/
receipt-0.json  receipt-2.json  receipt-4.json  receipt-6.json  receipt-8.json
receipt-1.json  receipt-3.json  receipt-5.json  receipt-7.json  receipt-9.json
$ cat new/receipt-0.json
{"topic": "microceratous", "value": "918.67"}
```

- - -
&nbsp;

# `shutil` & `glob`

Some of the most used utilities in Linux are `mv`, `mkdir`, `cp`, `ls`, and `rm`. Thankfully, we don't need to utilize `subprocess` to access the same functionality of these utilities because the standard library has us covered.

## Python Documentation For This Video

-   [The `os.mkdir` function](https://docs.python.org/3/library/os.html#os.mkdir)
-   [The `shutil` module](https://docs.python.org/3/library/shutil.html)
-   [The `glob` module](https://docs.python.org/3/library/glob.html)
-   [The `json` module](https://docs.python.org/3/library/json.html)

## Creating a Directory If It Doesn't Exist

Before we start doing anything with the receipts, we want to have a `processed` directory to move them to so that we don't try to process the same receipt twice. Our script can be smart enough to create this directory for us if it doesn't exist when we first run the script. We'll use the [`os.mkdir`](https://docs.python.org/3/library/os.html#os.mkdir) function; if the directory already exists we can catch the `OSError` that is thrown:

*~/receipts/process_receipts.py*

```python
import os

try:
    os.mkdir("./processed")
except OSError:
    print("'processed' directory already exists")
```

## Collecting the Receipts to Process

From the shell, we're able to collect files based on patterns, and that's useful. For our purposes, we want to get every receipt from the `new` directory that matches this pattern:

```bash
receipt-[0-9]*.json
```

That pattern translates to `receipt-`, followed by any number of digits, and ending with a `.json` file extension. We can achieve this exact result using the [`glob.glob`](https://docs.python.org/3/library/glob.html#glob.glob) function.

*~/receipts/process_receipts.py* (partial)

```python
receipts = glob.glob('./new/receipt-[0-9]*.json')
subtotal = 0.0
```

Part of processing the receipts will entail adding up all of the values, so we're going to start our script with a subtotal of `0.0`.

## Reading JSON, Totaling Values, and Moving Files

The remainder of our script is going to require us to do the following:

1.  Iterate over the `receipts`
2.  Reading each receipt's JSON
3.  Totaling the value of the receipts
4.  Moving each receipt file to the `processed` directory after we're finished with it

We used the `json.dump` function to write out a JSON file, and we can use the opposite function [`json.load`](https://docs.python.org/3/library/json.html#json.load) to read a JSON file. The contents of the file will be turned into a dictionary that we can us to access its keys. We'll add the `value` to the `subtotal` before finally moving the file using [`shutil.move`](https://docs.python.org/3/library/shutil.html#shutil.move). Here's our final script:

*~/receipts/process_receipts.py*

```python
import glob
import os
import shutil
import json

try:
    os.mkdir("./processed")
except OSError:
    print("'processed' directory already exists")

# Get a list of receipts
receipts = glob.glob('./new/receipt-[0-9]*.json')
subtotal = 0.0

for path in receipts:
    with open(path) as f:
        content = json.load(f)
        subtotal += float(content['value'])
    name = path.split('/')[-1]
    destination = f"./processed/{name}"
    shutil.move(path, destination)
    print(f"moved '{path}' to '{destination}'")

print("Receipt subtotal: $%.2f" % subtotal)
```

Let's add some files that don't match our pattern to the `new` directory before running our script:

```bash
touch new/receipt-other.json new/receipt-14.txt new/random.txt
```

Finally, let's run our script twice and see what we get:

```bash
$ python3.6 process_receipts.py
moved './new/receipt-0.json' to './processed/receipt-0.json'
moved './new/receipt-1.json' to './processed/receipt-1.json'
moved './new/receipt-2.json' to './processed/receipt-2.json'
moved './new/receipt-3.json' to './processed/receipt-3.json'
moved './new/receipt-4.json' to './processed/receipt-4.json'
moved './new/receipt-5.json' to './processed/receipt-5.json'
moved './new/receipt-6.json' to './processed/receipt-6.json'
moved './new/receipt-7.json' to './processed/receipt-7.json'
moved './new/receipt-8.json' to './processed/receipt-8.json'
moved './new/receipt-9.json' to './processed/receipt-9.json'
Receipt subtotal: $6932.04
$ python3.6 process_receipts.py
'processed' directory already exists
Receipt subtotal: $0.00
```

*Note:* The subtotal that is printed for you will be different since our receipts are all randomly generated.

- - -
&nbsp;

# `re` (regular expression) & `math`

In this video, we take a look at some potential modifications that we can make to our `process_receipts.py` file to change how we work with strings and numbers.

## Python Documentation For This Video

-   [The `re` module](https://docs.python.org/3/library/re.html)
-   [The `math` module](https://docs.python.org/3/library/math.html)

## More Specific Patterns Using Regular Expressions (The `re` Module)

Occasionally, we need to be very specific about string patterns that we use, and sometimes those are just not doable with basic globbing. As an exercise in this, let's change our `process_receipts.py` file to only return even numbered files (regardless of length). Let's generate some more receipts and try to accomplish this from the REPL:

```python
$ FILE_COUNT=20 python3.6 gen_receipts.py
$ python3.6
>>> import glob
>>> receipts = glob.glob('./new/receipt-[0-9]*[24680].json')
>>> receipts.sort()
>>> receipts
['./new/receipt-10.json', './new/receipt-12.json', './new/receipt-14.json', './new/receipt-16.json', './new/receipt-18.json']
```

That glob was pretty close, but it didn't give us the single-digit even numbers. Let's try now using the [`re`](https://docs.python.org/3/library/re.html) (Regular Expression) module's [`match`](https://docs.python.org/3/library/re.html#re.match) function, the [`glob.iglob`](https://docs.python.org/3/library/glob.html#glob.iglob) function, and a list comprehension:

```python
>>> import re
>>> receipts = [f for f in glob.iglob('./new/receipt-[0-9]*.json') if re.match('./new/receipt-[0-9]*[02468].json', f)]
>>> receipts
['./new/receipt-0.json', './new/receipt-2.json', './new/receipt-4.json', './new/receipt-6.json', './new/receipt-8.json', './new/receipt-10.json', './new/receipt-12.json', './new/receipt-14.json', './new/receipt-16.json', './new/receipt-18.json']
```

We're using the [`glob.iglob`](https://docs.python.org/3/library/glob.html#glob.iglob) function instead of the standard `glob` function because we knew we were going to iterate through it and make modifications at the same time. This iterator allows us to avoid fitting the whole expanded `glob.glob` list into memory at one time.

Regular Expressions are a pretty big topic, but once you've learned them, they are incredibly useful in scripts and also when working with tools like grep. The [`re`](https://docs.python.org/3/library/re.html) module gives us quite a few powerful ways to use regular expressions in our python code.

## Improved String Replacement

One actual improvement that we can make to our `process_receipts.py` file is that we can use a single function call to go from our `path` variable to the `destination` that we want. This section:

*~/receipts/process_receipts.py* (partial)

```python
    name = path.split('/')[-1]
    destination = f"./processed/{name}"
```

Becomes this using the [`str.replace`](https://docs.python.org/3/library/stdtypes.html#str.replace) method:

```python
    destination = path.replace('new', 'processed')
```

This is a useful refactoring to make because it makes the intention of our code more clear.

## Working With Numbers Using `math`

Depending on how we want to process the values of our receipts, we might want to manipulate the numbers that we are working with by rounding; going to the next highest integer, or the next lowest integer. These sort of "rounding" actions are pretty common, and some of them require the [`math`](https://docs.python.org/3/library/math.html) module:

```python
>>> import math
>>> math.ceil(1.1)
2
>>> math.floor(1.1)
1
>>> round(1.1111111111, 2)
1.11
```

We can utilize the built-in [`round`](https://docs.python.org/3/library/functions.html#round) function to clean up the printing of the subtotal at the end of the script. Here's the final version of `process_receipts.py`:

*~/receipts/process_receipts.py*

```python
import glob
import os
import shutil
import json

try:
    os.mkdir("./processed")
except OSError:
    print("'processed' directory already exists")
subtotal = 0.0
for path in glob.iglob('./new/receipt-[0-9]*.json'):
    with open(path) as f:
        content = json.load(f)
        subtotal += float(content['value'])
    destination = path.replace('new', 'processed')
    shutil.move(path, destination)
    print(f"moved '{path}' to '{destination}'")

print(f"Receipt subtotal: ${round(subtotal, 2)}")
```

#### BONUS: Truncate Float Without Rounding

I mentioned in the video that you can do some more complicated math to print a number to a specified number of digits without rounding. Here's an example a function that would do the truncation (for those curious):

```python
>>> import math
>>> def ftruncate(f, ndigits=None):
...     if ndigits and (ndigits > 0):
...         multiplier = 10 ** ndigits
...         num = math.floor(f * multiplier) / multiplier
...     else:
...         num = math.floor(f)
...     return num
>>> num = 1.5441020468646993
>>> ftruncate(num)
1
>>> ftruncate(num, 2)
1.54
>>> ftruncate(num, 8)
1.54410204
```

- - -
&nbsp;

# Installing Third-Party PAckages Using 'pip'

We installed `pip3.6` when we built Python 3, and now we're ready to start working with Third-Party code.

## Python Documentation For This Video

-   [`pip`](https://pip.pypa.io/en/stable/)
-   [`boto3`](https://boto3.readthedocs.io/en/latest/)

## Viewing Installed Packages

We can check out your installed packages using the `list` subcommand:

```
$ pip3.6 list
DEPRECATION: The default format will switch to columns in the future. You can use --format=(legacy|columns) (or define a format=(legacy|columns) in your pip.conf under the [list] section) to disable this warning.
pip (9.0.1)
setuptools (28.8.0)
```

You may have gotten a deprecation warning. To fix that, let's create a `$HOME/.config/pip/pip.conf` file:

```
$ mkdir -p ~/.config/pip
$ vim ~/.config/pip/pip.conf
```

*~/.config/pip/pip.conf*

```
[list]
format=columns
```

Now if we use `list` we'll get a slightly different result:

```
$ pip3.6 list
Package    Version
---------- -------
pip        9.0.1
setuptools 28.8.0
```

## Installing New Packages

Later in this course, we'll be using the [`boto3`](https://boto3.readthedocs.io/en/latest/) package to interact with AWS S3. Let's use that as an example package to install using the `install` subcommand:

```
$ pip3.6 install boto3
...
PermissionError: [Errno 13] Permission denied: '/usr/local/lib/python3.6/site-packages/jmespath'
```

Since we installed Python 3.6 into `/usr/local`, it's meant to be usable by all users, but we can only add or remove packages if we're `root` (or via `sudo`).

```
$ sudo pip3.6 install boto3
```

## Managing Required Packages with `requirements.txt`

If we have a project that relies on [`boto3`](https://boto3.readthedocs.io/en/latest/), we probably want to keep track of that dependency somewhere, and pip can facilitate this through a "requirements file" traditionally called `requirements.txt`. If we've already installed everything manually, then we can dump the current dependency state using the `freeze` subcommand that pip provides.

```
$ pip3.6 freeze
boto3==1.5.22
botocore==1.8.36
docutils==0.14
jmespath==0.9.3
python-dateutil==2.6.1
s3transfer==0.1.12
six==1.11.0
$ pip3.6 freeze > requirements.txt
```

Now we can use this file to tell pip what to install (or uninstall) using the `-r` flag to either command. Let's uninstall these packages from the global site-packages:

```
$ sudo pip3.6 uninstall -y -r requirements.txt
```

#### Installing Packages Local To Our User

We need to use `sudo` to install packages globally, but sometimes we only want to install a package for ourselves, and we can do that by using the `--user` flag to the `install` command. Let's reinstall [`boto3`](https://boto3.readthedocs.io/en/latest/) so that it's local to our user by using our `requirements.txt` file:

```
$ pip3.6 install --user -r requirements.txt
$ pip3.6 list --user
$ pip3.6 uninstall boto3
```

- - -
&nbsp;

# Virtual Environments (venv)

We can only have one version of a package installed at a given time, and this can sometimes be a headache if we have multiple projects that require different versions of the same dependency. This is where `virtualenv` comes into play and allows us to create sandboxed Python environments.

## Python Documentation for This Video

-   [`venv`](https://docs.python.org/3/library/venv.html)

## Virtualenv or Venv

Virtualenvs allow you to create sandboxed Python environments. In Python 2, you need to install the `virtualenv` package to do this, but with Python 3 it's been worked in under the module name of `venv`.

To create a virtualenv, we'll use the following command:

```
$ python3.6 -m venv [PATH FOR VIRTUALENV]
```

The `-m` flag loads a module as a script, so it looks a little weird, but "python3.6 -m venv" is a stand-alone tool. This tool can even handle its own flags.

Let's create a directory to store our virtualenvs called `venvs`. From here we create an `experiment` virtualenv to see how they work.

```
$ mkdir venvs
$ python3.6 -m venv venvs/experiment
```

Virtualenvs are local Python installations with their own site-packages, and they do absolutely nothing for us by default. To use a virtualenv, we need to `activate` it. We do this by sourcing an `activate` file in the virtualenv's `bin` directory:

```
$ source venvs/experiment/bin/activate
(experiment) ~ $
```

Notice that our prompt changed to indicate to us what virtualenv is active. This is part of what the `activate` script does. It also changes our `$PATH`:

```
(experiment) ~ $ echo $PATH
/home/user/venvs/experiment/bin:/home/user/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/home/user/.local/bin:/home/user/bin
(experiment) ~ $ which python
~/venvs/experiment/bin/python
(experiment) ~ $ python --version
Python 3.6.4
(experiment) ~ $ pip list
Package    Version
---------- -------
pip        9.0.1
setuptools 28.8.0
(experiment) ~ $ deactivate
$ which python
/usr/bin/python
```

With the virtualenv activated, the `python` and `pip` binaries point to the local Python 3 variations, so we don't need to append the `3.6` to all of our commands. To remove the virtualenv's contents from our `$PATH`, we will utilize the `deactivate` script that the virtualenv provided.

- - -
&nbsp;

# Using Third-Party Packages in your Scripts

Now that we know how to install third-party code, it's time to learn how to use it in our scripts.

## Python Documentation For This Video

-   [The `requests` package](http://docs.python-requests.org/en/master/)
-   [The `argparse.ArgumentParser` class](https://docs.python.org/3/library/argparse.html#argparse.ArgumentParser)
-   [The `os.getenv` function](https://docs.python.org/3/library/os.html#os.getenv)
-   [The `sys.exit` function](https://docs.python.org/3/library/sys.html#sys.exit)

## Creating a Weather Script

We're going to write up the start of a script that can provide us with weather information using data from [openweathermap.org](https://openweathermap.org/). For this video, we're going to be installing another package called [`requests`](http://docs.python-requests.org/en/master/). This is a nice package for making web requests from Python and one of the most used Python packages. You will need to get your API key from [OpenWeatherMap](https://linuxacademy.com/cp/courses/lesson/course/1688/lesson/openweathermap.org) to follow along with this video.

Let's start off by activating the `experiment` virtualenv that we created in the previous video. Install the package and set an environment variable with an API key:

```
$ source ~/venvs/experiment/bin/activate
(experiment) $ pip install requests
(experiment) $ export OWM_API_KEY=[YOUR API KEY]
```

Create a new script called `weather`:

*~/bin/weather*

```python
#!/usr/bin/env python3.6

import os
import requests
import sys
from argparse import ArgumentParser

parser = ArgumentParser(description='Get the current weather information')
parser.add_argument('zip', help='zip/postal code to get the weather for')
parser.add_argument('--country', default='us', help='country zip/postal belongs to, default is "us"')

args = parser.parse_args()

api_key = os.getenv('OWM_API_KEY')

if not api_key:
    print("Error: no 'OWM_API_KEY' provided")
    sys.exit(1)

url = f"http://api.openweathermap.org/data/2.5/weather?zip={args.zip},{args.country}&appid={api_key}"

res = requests.get(url)

if res.status_code != 200:
    print(f"Error talking to weather provider: {res.status_code}")
    sys.exit(1)

url = f"http://api.openweathermap.org/data/2.5/weather?zip={args.zip},{args.country}&appid={api_key}"

res = requests.get(url)

if res.status_code != 200:
    print(f"Error talking to weather provider: {res.status_code}")
    sys.exit(1)

print(res.json())
```

Notice that we were able to use the [`requests`](http://docs.python-requests.org/en/master/) package in the same way that we would any package from the standard library.

Let's try it out:

```
(experiment) $ chmod u+x ~/bin/weather
(experiment) $ weather 45891
(experiment) ~ $ weather 45891
{'coord': {'lon': -84.59, 'lat': 40.87}, 'weather': [{'id': 801, 'main': 'Clouds', 'description': 'few clouds', 'icon': '02d'}], 'base': 'stations', 'main': {'temp': 282.48, 'pressure': 1024, 'humidity': 84, 'temp_min': 282.15, 'temp_max': 283.15}, 'visibility': 16093, 'wind': {'speed': 1.5, 'deg': 210}, 'clouds': {'all': 20}, 'dt': 1517169240, 'sys': {'type': 1, 'id': 1029, 'message': 0.0043, 'country': 'US', 'sunrise': 1517143892, 'sunset': 1517179914}, 'id': 0, 'name': 'Van Wert', 'cod': 200}
```

## Making `weather` Work Regardless of the Active Virtualenv

Currently, our `weather` script will only work if the `experiment` virtualenv is active since no other Python has [`requests`](http://docs.python-requests.org/en/master/) installed. We can get around this by changing the shebang to point to the specific python within our virtualenv:

Make this script work regardless of active python by using this as the shebang:

```python
#!/home/$USER/venvs/experiment/python
```

You'll need to substitute in your actual username for `$USER`. Here's what the script looks like on a cloud server with the username of `user`:

*~/bin/weather*

```python
#!/home/user/venvs/experiment/bin/python

import os
import requests
import sys

from argparse import ArgumentParser

parser = ArgumentParser(description='Get the current weather information')
parser.add_argument('zip', help='zip/postal code to get the weather for')
parser.add_argument('--country', default='us', help='country zip/postal belongs to, default is "us"')

args = parser.parse_args()

api_key = os.getenv('OWM_API_KEY')

if not api_key:
    print("Error: no 'OWM_API_KEY' provided")
    sys.exit(1)

url = f"http://api.openweathermap.org/data/2.5/weather?zip={args.zip},{args.country}&appid={api_key}"

res = requests.get(url)

if res.status_code != 200:
    print(f"Error talking to weather provider: {res.status_code}")
    sys.exit(1)

print(res.json())
```

Now if we deactivate and use the script it will still work:

```
(experiment) $ deactivate
$ weather 45891
{'coord': {'lon': -84.59, 'lat': 40.87}, 'weather': [{'id': 801, 'main': 'Clouds', 'description': 'few clouds', 'icon': '02d'}], 'base': 'stations', 'main': {'temp': 282.48, 'pressure': 1024, 'humidity': 84, 'temp_min': 282.15, 'temp_max': 283.15}, 'visibility': 16093, 'wind': {'speed': 1.5, 'deg': 210}, 'clouds': {'all': 20}, 'dt': 1517169240, 'sys': {'type': 1, 'id': 1029, 'message': 0.0035, 'country': 'US', 'sunrise': 1517143892, 'sunset': 1517179914}, 'id': 0, 'name': 'Van Wert', 'cod': 200}
```

Take is as a challenge to build on this example to make a more full-featured weather CLI.

- - -
&nbsp;

In this last segment, we're tackling a single, large problem over multiple videos. We'll dig into development practices that we can utilize to ensure the success of our projects.

Our approach will include:

1.  Project Planning
2.  Documentation
3.  Test Driven Development (TDD)

Through Test Driven Development, we'll run into a wide variety of errors and establish a familiarity with the stack trace that will make debugging projects in the future easier.

## Links For This Video

-   [db_setup.sh](https://raw.githubusercontent.com/linuxacademy/content-python3-sysadmin/master/helpers/db_setup.sh)
-   [PostgreSQL RPM](https://download.postgresql.org/pub/repos/yum/9.6/redhat/rhel-7-x86_64/pgdg-centos96-9.6-3.noarch.rpm)

## The Project

We have many database servers that we manage, and we want to create a single tool that we can use to easily back up the databases to either AWS S3 or locally. We would like to be able to:

1.  Specify the database URL to backup.
2.  Specify a "driver" (`local` or `s3`)
3.  Specify the backup "destination". This will be a file path for `local` and a bucket name for `s3`.
4.  Depending on the "driver", create a local backup of the database or upload the backup to an S3 bucket.

## Setting up PostgreSQL Lab Server

Before we begin, we're going to need to need a PostgreSQL database to work with. The code repository for this course contains a `db_setup.sh` script that we'll use on a CentOS 7 cloud server to create and run our database. Create a "CentOS 7" cloud server and run the following on it:

```
$ curl -o db_setup.sh https://raw.githubusercontent.com/linuxacademy/content-python3-sysadmin/master/helpers/db_setup.sh
$ chmod +x db_setup.sh
$ ./db_setup.sh
```

You will be prompted for your sudo password and for the username and password you'd like to use to access the database.

## Installing The Postgres 9.6 Client

On our development machines, we'll need to make sure that we have the Postgres client installed. The version needs to be 9.6.6.

On Red-hat systems we'll use the following:

```
$ wget https://download.postgresql.org/pub/repos/yum/9.6/redhat/rhel-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
$ sudo yum install -y pgdg-redhat-repo-latest.noarch.rpm
$ sudo yum update -y
$ sudo yum autoremove -y postgresql
$ sudo yum install -y postgresql96
```

On debian systems, the equivalent would be:

```
$ sudo apt-get install postgres-client-9.6
```

## Test connection from Workstation

Let's make sure that we can connect to the PostgreSQL server from our development machine by running the following command:

*Note: You'll need to substitute in your database user's values for `[USERNAME]`, `[PASSWORD]`, and `[SERVER_IP]`.

```
$ psql postgres://[USERNAME]:[PASSWORD]@[SERVER_IP]:80/sample -c "SELECT count(id) FROM employees;"
```

With this prep work finished, we're ready to start planning the project itself.

- - -

To start out our project, we're going to set up our source control, our virtualenv, and finally start documenting how we want the project to work.

## Creating the Repo and Virtualenv

Since we're building a project that will likely be more than a single file, we're going to create a full project complete with source control and dependencies. We'll start by creating the directory to hold our project, and we're going to place this in a `code` directory:

```
$ rm ~/requirements.txt
$ mkdir -p ~/code/pgbackup
$ cd ~/code/pgbackup
```

We've talked about pip and virtualenvs, and how they allow us to manage our dependency versions. For a development project, we will leverage a new tool to manage our project's virtualenv and install dependencies. This tool is called [`pipenv`](https://docs.pipenv.org/). Let's install [`pipenv`](https://docs.pipenv.org/) for our user and create a Python 3 virtualenv for our project:

```
$ pip3.6 install --user pipenv
$ pipenv --python $(which python3.6)
```

Rather than creating a `requirements.txt` file for us, pipenv has created a `Pipfile` that it will use to store virtualenv and dependency information. To activate our new virtualenv, we use the command `pipenv shell`, and to deactivate it we use `exit` instead of `deactivate`.

Next, let's set up [`git`](https://git-scm.com/) as our source control management tool by initializing our repository. We'll also add a `.gitignore` file [from GitHub](https://raw.githubusercontent.com/github/gitignore/master/Python.gitignore) so that we don't later track files that we don't mean to.

```
$ git init
$ curl https://raw.githubusercontent.com/github/gitignore/master/Python.gitignore -o .gitignore
```

## Sketch out the README.rst

One great way to start planning out a project is to start by documenting it from the top level. This is the documentation that we would give to someone who wanted to know how to use the tool but didn't care about creating the tool. This approach is sometimes called "README Driven Development". Whenever we write documentation in a Python project, we should be using [reStructuredText](http://docutils.sourceforge.net/rst.html). We use this specific markup format because there are tools in the Python ecosystem that can read this text and render documentation in a standardized way. Here's our `READEME.rst` file:

*~/code/pgbackup/README.rst*

pgbackup
========

CLI for backing up remote PostgreSQL databases locally or to AWS S3.

Preparing for Development
-------------------------

1.  Ensure `pip` and `pipenv` are installed

2.  Clone repository: `git clone git@github.com:example/pgbackup`

3.  `cd` into repository

4.  Fetch development dependencies `make install`

5.  Activate virtualenv: `pipenv shell`

Usage
-----

Pass in a full database URL, the storage driver, and destination.

S3 Example w/ bucket name:

::

`$ pgbackup postgres://bob@example.com:5432/db_one --driver s3 backups`

Local Example w/ local path:

::


`$ pgbackup postgres://bob@example.com:5432/db_one --driver local /var/local/db_one/backups`


Running Tests
-------------

Run tests locally using `make` if virtualenv is active:

::

`$ make`

If virtualenv isn't active then use:

::


`$ pipenv run make`


## Our Initial Commit

Now that we've created our `README.rst` file to document what we plan on doing with this project, we're in a good position to stage our changes and make our first commit:

```
$ git add --all .
$ git commit -m 'Initial commit'
```

- - -
&nbsp;

# Initial Project layout

The last thing we need to do before we start implementing our `pgbackup` tool is structure the project with the required files and folders.

## Documentation For This Video

-   [The `setuptools` package](https://setuptools.readthedocs.io/en/latest/setuptools.html#basic-use)
-   [The `make` documentation](https://www.gnu.org/software/make/manual/make.html)

## Create Package Layout

There are a few specific places that we're going to put code in this project:

1.  In a `src/pgbackup` directory. This is where our project's business logic will go.
2.  In a `tests` directory. We'll put automated tests here.

We're not going to write the code that goes in these directories just yet, but we are going to create them and put some empty files in so that we can make a git commit that contains these directories. In our `src/pgbackup` directory, we'll use a special file called `__init__.py`, but in our `tests` directory, we'll use a generically named, hidden file.

```
(pgbackup-E7nj_BsO) $ mkdir -p src/pgbackup tests
(pgbackup-E7nj_BsO) $ touch src/pgbackup/__init__.py tests/.keep
```

## Writing Our `setup.py`

One of the requirements for an installable Python package is a `setup.py` file at the root of the project. In this file, we'll utilize [`setuptools`](https://setuptools.readthedocs.io/en/latest/setuptools.html#basic-use) to specify how our project is to be installed and define its metadata. Let's write out this file now:

*~/code/pgbackup/setup.py*

```python
from setuptools import setup, find_packages

with open('README.rst', encoding='UTF-8') as f:
    readme = f.read()

setup(
    name='pgbackup',
    version='0.1.0',
    description='Database backups locally or to AWS S3.',
    long_description=readme,
    author='Keith',
    author_email='keith@linuxacademy.com',
    packages=find_packages('src'),
    package_dir={'': 'src'},
    install_requires=[]
)
```

For the most part, this file is metadata, but the `packages`, `package_dir`, and `install_requires` parameters of the [`setup`](https://setuptools.readthedocs.io/en/latest/setuptools.html#basic-use) function define where setuptools will look for our source code and what other packages need to be installed for our package to work.

To make sure that we didn't mess up anything in our `setup.py`, we'll install our package as a development package using `pip`.

```
(pgbackup-E7nj_BsO) $ pip install -e .
Obtaining file:///home/user/code/pgbackup
Installing collected packages: pgbackup
  Running setup.py develop for pgbackup
Successfully installed pgbackup
```

It looks like everything worked, and we won't need to change our `setup.py` for awhile. For the time being, let's uninstall `pgbackup` since it doesn't do anything yet:

```
(pgbackup-E7nj_BsO) $ pip uninstall pgbackup
Uninstalling pgbackup-0.1.0:
  /home/user/.local/share/virtualenvs/pgbackup-E7nj_BsO/lib/python3.6/site-packages/pgbackup.egg-link
  Proceed (y/n)? y
    Successfully uninstalled pgbackup-0.1.0
```

## Makefile

In our `README.rst` file, we mentioned that to run tests we wanted to be able to simply run `make` from our terminal. To do that, we need to have a `Makefile`. We'll create a second make task that can be used to setup the virtualenv and install dependencies using `pipenv` also. Here's our `Makefile`:

*~/code/pgbackup/Makefile*

```
.PHONY: default install test

default: test

install:
    pipenv install --dev --skip-lock

test:
    PYTHONPATH=./src pytest
```

This is a great spot for us to make a commit:

```
(pgbackup-E7nj_BsO) $ git add --all .
(pgbackup-E7nj_BsO) $ git commit -m 'Structure project with setup.py and Makefile'
[master 1c0ed72] Structure project with setup.py and Makefile
 4 files changed, 26 insertions(+)
 create mode 100644 Makefile
 create mode 100644 setup.py
 create mode 100644 src/pgbackup/__init__.py
 create mode 100644 tests/.keep
```

- - -
&nbsp;

# Intro to TDD (Test Driven Development) and First Tests

With our project structured, we're finally ready to start implementing the logic to create database backups. We're going to tackle this project using "Test Driven Development", so let's learn the basics of TDD now.

## Documentation For This Video

-   [The `pytest` package](https://docs.pytest.org/en/latest/)
-   [The `pytest.raises` function](https://docs.pytest.org/en/latest/assert.html#assertions-about-expected-exceptions)

## Installing `pytest`

For this course, we're using [`pytest`](https://docs.pytest.org/en/latest/) as our testing framework. It's a simple tool, and although there is a unit testing framework built into Python, I think that `pytest` is a little easier to understand. Before we can use it though, we need to install it. We'll use `pipenv` and specify that this is a "dev" dependency:

```
(pgbackup-E7nj_BsO) $ pipenv install --dev pytest
...
Adding pytest to Pipfile's [dev-packages]...
Locking [dev-packages] dependencies...
Locking [packages] dependencies...
Updated Pipfile.lock (5c8539)!
```

Now the line that we wrote in our `Makefile` that utilized the `pytest`, CLI will work.

## Writing Our First Tests

The first step of TDD is writing a failing test. In our case, we're going to go ahead and write a few failing tests. Using [`pytest`](https://docs.pytest.org/en/latest/), our tests will be functions with names that start with `test_`. As long as we name the functions properly, the test runner should find and run them.

We're going to write three tests to start:

1.  A test that shows that the CLI fails if no `driver` is specified.
2.  A test that shows that the CLI fails if there is no `destination` value given.
3.  A test that shows, given a driver and a destination, that the CLI's returned `Namespace` has the proper values set.

At this point, we don't even have any source code files, but that doesn't mean that we can't write code that demonstrates how we would like our modules to work. The module that we want is called `cli`, and it should have a `create_parser` function that returns an `ArgumentParser` configured for our desired use.

RED > GREEN > REFACTOR: Once the test is green, we are free to modify and clean up the implementation, as long as the changes keep the tests green

- Start with a red test, let the test drive implementation
- Once it's green, free to go back and clean up the code to make it work a little bit better, but should still have the same end result if your tests were passing to begin with

Let's write some tests that exercise `cli.create_parser` and ensure that our `ArgumentParser` works as expected. The name of our test file is important; make sure that the file starts with `test_`. This file will be called `test_cli.py`.

*~/code/pgbackup/tests/test_cli.py*

```python
import pytest

from pgbackup import cli

url = "postgres://bob:password@example.com:5432/db_one"

def test_parser_without_driver():
    """
    Without a specified driver the parser will exit
    """
    with pytest.raises(SystemExit):
        parser = cli.create_parser()
        parser.parse_args([url])

def test_parser_with_driver():
    """
    The parser will exit if it receives a driver
    without a destination
    """
    parser = cli.create_parser()
    with pytest.raises(SystemExit):
        parser.parse_args([url, "--driver", "local"])

def test_parser_with_driver_and_destination():
    """
    The parser will not exit if it receives a driver
    with a destination
    """
    parser = cli.create_parser()

    args = parser.parse_args([url, "--driver", "local", "/some/path"])

    assert args.url == url
    assert args.driver == "local"
    assert args.destination == "/some/path"

```

## Running Tests

Now that we've written a few tests, it's time to run them. We've created our `Makefile` already, so let's make sure our virtualenv is active and run them:

```
$ pipenv shell
(pgbackup-E7nj_BsO) $ make
PYTHONPATH=./src pytest
======================================= test session starts =======================================
platform linux -- Python 3.6.4, pytest-3.3.2, py-1.5.2, pluggy-0.6.0
rootdir: /home/user/code/pgbackup, inifile:
collected 0 items / 1 errors

============================================= ERRORS ==============================================
___ ERROR collecting tests/test_cli.py ____
ImportError while importing test module '/home/user/code/pgbackup/tests/test_cli.py'.
Hint: make sure your test modules/packages have valid Python names.
Traceback:
tests/test_cli.py:3: in 
    from pgbackup import cli
    E   ImportError: cannot import name 'cli'
    !!!!!!!!!!!!!!!!!!!!!!!!!!!!! Interrupted: 1 errors during collection !!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    ===================================== 1 error in 0.11 seconds =====================================
    make: *** [test] Error 2
```

We get an `ImportError` from our test file because there is no module in `pgbackup` named `cli`. This is awesome because it tells us what our next step is. We need to create that file.

- - -
&nbsp;

# Implementing CLI Guided by Tests

We now have some breaking tests to help guide us to the implementation of our `client` module. Let's follow the errors that we see to get our tests passing.

## Documentation For This Video

-   [The `argparse` package](https://docs.python.org/3/library/argparse.html)
-   [The `argparse.Action` class](https://docs.python.org/3/library/argparse.html#argparse.Action)
-   [The `pytest` package](https://docs.pytest.org/en/latest/)
-   [The `pytest.fixture` function](https://docs.pytest.org/en/latest/fixture.html)
-   [Python decorators](https://docs.python.org/3/glossary.html#term-decorator)

## Moving Through Failing Tests

Our current test failure is from there not being a `cli.py` file within the `src/pgbackup` directory. Let's do just enough to move onto the next error:

*(partial `make` output)*

```
(pgbackup-E7nj_BsO) $ touch src/pgbackup/cli.py
(pgbackup-E7nj_BsO) $ make
PYTHONPATH=./src pytest
======================================= test session starts =======================================
platform linux -- Python 3.6.4, pytest-3.3.2, py-1.5.2, pluggy-0.6.0
rootdir: /home/user/code/pgbackup, inifile:
collected 3 items

tests/test_cli.py FFF                                                                       [100%]
============================================ FAILURES =============================================
___ test_parser_without_driver ____
def test_parser_without_driver():
    """
    Without a specified driver the parser will exit
    """
    with pytest.raises(SystemExit):

      parser = cli.create_parser()
E           AttributeError: module 'pgbackup.cli' has no attribute 'create_parser'

```

Now we're getting an `AttributeError` because there is not an attribute/function called `create_parser`. Let's implement a version of that function that creates an `ArgumentParser` that hasn't been customized:

*~/code/pgbackup/src/pgbackup/cli.py*

```python
from argparse import ArgumentParser

def create_parser():
    parser = ArgumentParser()
    return parser
```

Once again, let's run our tests:

*(partial `make` output)*

```
(pgbackup-E7nj_BsO) $ make
...
self = ArgumentParser(prog='pytest', usage=None, description=None, formatter_class=, conflict_handler='error', add_help=True)
status = 2
message = 'pytest: error: unrecognized arguments: postgres://bob:password@example.com:5432/db_one --driver local /some/path\n'

def exit(self, status=0, message=None):
    if message:
        self._print_message(message, _sys.stderr)

  _sys.exit(status)
E       SystemExit: 2

/usr/local/lib/python3.6/argparse.py:2376: SystemExit
-------------------------------------- Captured stderr call ---------------------------------------
usage: pytest [-h]
pytest: error: unrecognized arguments: postgres://bob:password@example.com:5432/db_one --driver local /some/path
=============================== 1 failed, 2 passed in 0.14 seconds ================================
```

Interestingly, two of the tests succeeded. Those two tests were the ones that expected there to be a `SystemExit` error. Our tests sent unexpected output to the parser (since it wasn't configured to accept arguments), and that caused the parser to error. This demonstrates why it's important to write tests that cover a wide variety of use cases. If we hadn't implemented the third test to ensure that we get the expected output on success, then our test suite would be green!

## Creating Our First Class

For this course, we haven't created any custom classes because it's not something that we'll do all the time, but in the case of our CLI, we need to. Our idea of having a flag of `--driver` that takes two distinct values isn't something that any existing [`argparse.Action`](https://docs.python.org/3/library/argparse.html#argparse.Action) can do. Because of this, we're going to follow along with the documentation and implement our own custom `DriverAction` class. We can put our custom class in our `cli.py` file and use it in our [`add_argument`](https://docs.python.org/3/library/argparse.html#argparse.ArgumentParser.add_argument) call.

*src/pgbackup/cli.py*

```python
from argparse import Action, ArgumentParser

class DriverAction(Action):
    def __call__(self, parser, namespace, values, option_string=None):
        driver, destination = values
        namespace.driver = driver.lower()
        namespace.destination = destination

def create_parser():
    parser = ArgumentParser(description="""
    Back up PostgreSQL databases locally or to AWS S3.
    """)
    parser.add_argument("url", help="URL of database to backup")
    parser.add_argument("--driver",
            help="how & where to store backup",
            nargs=2,
            action=DriverAction,
            required=True)
    return parser
```

## Adding More Tests

Our CLI is coming along, but we probably want to raise an error if the end-user tries to use a driver that we don't understand. Let's add a few more tests that do the following:

1.  Ensure that you can't use a driver that is unknown, like `azure`.
2.  Ensure that the drivers for `s3` and `local` don't cause errors.

*test/test_cli.py* (partial)

```python
def test_parser_with_unknown_drivers():
    """
    The parser will exit if the driver name is unknown.
    """

parser = cli.create_parser()

with pytest.raises(SystemExit):
    parser.parse_args([url, "--driver", "azure", "destination"])
def test_parser_with_known_drivers():
    """
    The parser will not exit if the driver name is known.
    """
parser = cli.create_parser()

for driver in ['local', 's3']:
    assert parser.parse_args([url, "--driver", driver, "destination"])</code></pre>
```

## Adding Driver Type Validation

Since we already have a custom DriverAction, we can feel free to customize this to make our CLI a little more intelligent. The only drivers that we are going to support (for now) are s3 and local, so let's add some logic to our action to ensure that the driver given is one that we can work with:

```python
known_drivers = ['local', 's3']

class DriverAction(Action):
    def call(self, parser, namespace, values, option_string=None):
        driver, destination = values
        if driver.lower() not in known_drivers:
            parser.error("Unknown driver. Available drivers are 'local' & 's3'")
        namespace.driver = driver.lower()
        namespace.destination = destination
```

## Removing Test Duplication Using `pytest.fixture`

Before we consider this unit of our application complete, we should consider cleaning up some of the duplication in our tests. We create the parser using create_parser in every test but using pytest.fixture we can extract that into a separate function and inject the parser value into each test that needs it.
Here's what our parser function will look like:

*tests/test_cli.py* (partial)

```python
import pytest

@pytest.fixture
def parser():
    return cli.create_parser()
```

We haven't run into this yet, but the @pytest.fixture on top of our function definition is what's known as a "decorator". A "decorator" is a function that returns a modified version of the function. We've seen that if we don't use parentheses that our functions aren't called, and because of that we're able to pass functions into other functions as arguments. This particular decorator will register our function in the list of fixtures that can be injected into a pytest test. To inject our fixture, we will add an argument to our test function definition that has the same name as our fixture name, in this case, parser. Here's the final test file:

*tests/test_cli.py*

```python
import pytest

from pgbackup import cli

url = "postgres://bob@example.com:5432/db_one"

@pytest.fixture()

def parser():
    return cli.create_parser()

def test_parser_without_driver(parser):
    """
    Without a specified driver the parser will exit
    """
    with pytest.raises(SystemExit):
        parser.parse_args([url])

def test_parser_with_driver(parser):
    """
    The parser will exit if it receives a driver
    without a destination
    """
    with pytest.raises(SystemExit):
        parser.parse_args([url, "--driver", "local"])

def test_parser_with_driver_and_destination(parser):
    """
    The parser will not exit if it receives a driver
    with a destination
    """
    args = parser.parse_args([url, "--driver", "local", "/some/path"])

assert args.driver == "local"
assert args.destination == "/some/path"

def test_parser_with_unknown_drivers(parser):
    """
    The parser will exit if the driver name is unknown.
    """
    with pytest.raises(SystemExit):
        parser.parse_args([url, "--driver", "azure", "destination"])

def test_parser_with_known_drivers(parser):
    """
    The parser will not exit if the driver name is known.
    """
    for driver in ['local', 's3']:
        assert parser.parse_args([url, "--driver", driver, "destination"])
```

Now, all of our tests should pass, and we're in a good spot to make a commit.

- - -
&nbsp;

# Introduction to Mocking in Tests

Mocking is when we need to test stuff that has side effects, or modify code that is not our own to ensure it's called correctly. We are introducing mocking because we are interfacing with a tool outside of python: pg_dump from psql. We don't want to call pg_dump in our tests, because we don't always have a database to work with and our tests should just be contrained to things inside of python; we shouldn't have to spin up dependent servers to test these things.

With mocking, our unit tests will be constrained to just python things, and since we know that if we give the right command to subprocess that it should do the right thing, so we can make assertions based on that.

The simplest way that we can get all of the information that we need out of a PostgreSQL is to use the `pg_dump` utility that Postgres itself provides. Since that code exists outside of our codebase, it's not our job to ensure that the `pg_dump` tool itself works, but we do need to write tests that can run without an actual Postgres server running. For this, we will need to "stub" our interaction with `pg_dump`.

## Documentation For This Video

-   [The `pytest-mock` package](https://github.com/pytest-dev/pytest-mock/#usage)
-   [The `subprocess` package](https://docs.python.org/3/library/subprocess.html)
-   [The `subprocess.Popen` class](https://docs.python.org/3/library/subprocess.html#subprocess.Popen)

## Install pytest-mock

Before we can learn how to use mocking in our tests, we need to install the [`pytest-mock` package](https://github.com/pytest-dev/pytest-mock/#usage). This will pull in a few packages for us, and mainly provide us with a `mocker` fixture that we can inject into our tests:

```
(pgbackup-E7nj_BsO) $ pipenv install --dev pytest-mock
```

## Writing Tests With Mocking

We're going to put all of the Postgres related logic into its own module called `pgdump`, and we're going to begin by writing our tests. We want this module to do the following:

1.  Make a call out to `pg_dump` using [`subprocess.Popen`](https://docs.python.org/3/library/subprocess.html#subprocess.Popen).
2.  Returns the subprocess that STDOUT can be read from.

We know how to use the [`subprocess`](https://docs.python.org/3/library/subprocess.html) module, but we haven't used [`subprocess.Popen`](https://docs.python.org/3/library/subprocess.html#subprocess.Popen) yet. Behind the scenes, the functions that we already know use [`Popen`](https://docs.python.org/3/library/subprocess.html#subprocess.Popen), and wait for it to finish. We're going to use this instead of run, because we want to continue running code instead of waiting, right until we need to write the contents of `proc.stdout` to a file or S3.

To ensure that our code runs the proper third-party utilities, we're going to use [`mocker.patch`](http://www.voidspace.org.uk/python/mock/patch.html#mock.patch) on the `subprocess.Popen` constructor. This will substitute in a different implementation that holds onto information like the number of times the function is called and with what arguments. Let's see what this looks like in practice:

*tests/test_pgdump.py*

```python
import pytest
import subprocess

from pgbackup import pgdump

url = "postgres://bob:password@example.com:5432/db_one"

def test_dump_calls_pg_dump(mocker):
    """
    Utilize pg_dump with the database URL
    """
    mocker.patch('subprocess.Popen')
    assert pgdump.dump(url)
    subprocess.Popen.assert_called_with(['pg_dump', url], stdout=subprocess.PIPE)
```

The arguments that we're passing to `assert_called_with` will need to match what is being passed to `subprocess.Popen` when we exercise `pgdump.dump(url)`.

- - -
&nbsp;

# Implementing PostgreSQL Interaction

We now have tests for our `pgdump` implementation, and we have a basic understanding of mocking. Let's start following the errors to completion.

## Documentation For This Video

-   [The `pytest-mock` package](https://github.com/pytest-dev/pytest-mock/#usage)
-   [The `subprocess` package](https://docs.python.org/3/library/subprocess.html)
-   [The `subprocess.Popen` class](https://docs.python.org/3/library/subprocess.html#subprocess.Popen)
-   [The `mocker.patch` function](http://www.voidspace.org.uk/python/mock/patch.html#mock.patch)
-   [The `pytest.raises` function](https://docs.pytest.org/en/latest/assert.html#assertions-about-expected-exceptions)
-   [The `sys.exit` function](https://docs.python.org/3/library/subprocess.html#sys.exit)

## Initial Implementation

Our first error is from not having a `src/pgbackup/pgdump.py` file, so let's be sure to create that. We can guess that we'll also have an error for the missing function, so let's skip ahead a little and implement that:

*src/pgbackup/pgdump.py*

```python
import subprocess

def dump(url):
      return subprocess.Popen(['pg_dump', url], stdout=subprocess.PIPE)
```

This will get our tests to passing, but what happens when the `pg_dump` utility isn't installed?

## Adding Tests For Missing PostgreSQL Client

Let's add another test that tells our [`subprocess.Popen`](https://docs.python.org/3/library/subprocess.html#subprocess.Popen) to raise an `OSError` instead of succeeding. This is the kind of error that we will receive if the end-user of our package doesn't have the `pg_dump` utility installed. To cause our stub to raise this error we need to set the `side_effect` attribute when we call [`mocker.patch`](http://www.voidspace.org.uk/python/mock/patch.html#mock.patch). We'll pass in an `OSError` to this attribute. Finally, we'll want to exit with a status code of 1 if we catch this error and pass the error message through. That means we'll need to use [`pytest.raises`](https://docs.pytest.org/en/latest/assert.html#assertions-about-expected-exceptions) again to ensure we receive a `SystemExit` error. Here's what the final tests look like for our `pgdump` module:

*tests/test_pgdump.py*

```python
import pytest
import subprocess

from pgbackup import pgdump

url = "postgres://bob:password@example.com:5432/db_one"

def test_dump_calls_pg_dump(mocker):
    """
    Utilize pg_dump with the database URL
    """
    mocker.patch('subprocess.Popen')
    assert pgdump.dump(url)
    subprocess.Popen.assert_called_with(['pg_dump', url], stdout=subprocess.PIPE)

def test_dump_handles_oserror(mocker):
    """
    pgdump.dump returns a reasonable error if pg_dump isn't installed.
    """
    mocker.patch('subprocess.Popen', side_effect=OSError("no such file"))
    with pytest.raises(SystemExit):
        pgdump.dump(url)
```

## Implementing Error Handling

Since we know that [`subprocess.Popen`](https://docs.python.org/3/library/subprocess.html#subprocess.Popen) can raise an `OSError`, we're going to wrap that call in a `try` block, print the error message, and use [`sys.exit`](https://docs.python.org/3/library/subprocess.html#sys.exit) to set the error code:

*src/pgbackup/pgdump.py*

```python
import sys
import subprocess

def dump(url):
    try:
        return subprocess.Popen(['pg_dump', url], stdout=subprocess.PIPE)
    except OSError as err:
        print(f"Error: {err}")
        sys.exit(1)
```

## Manual Testing

We can have a certain amount of confidence in our code because we've written tests that cover our expected cases, but since we used patching, we don't know that it works. Let's manually load our code into the python REPL to test it out:

```python
(pgbackup-E7nj_BsO) $ PYTHONPATH=./src python
>>> from pgbackup import pgdump
>>> dump = pgdump.dump('postgres://demo:password@54.245.63.9:80/sample')
>>> f = open('dump.sql', 'w+b')
>>> f.write(dump.stdout.read())
>>> f.close()
```

*Note:* We needed to open our `dump.sql` file using the `w+b` flag because we know that the `.stdout` value from a subprocess will be a `bytes` object and not a `str`.

If we exit and take a look at the contents of the file using `cat`, we should see the SQL output. With the `pgdump` module implemented, it's now a great time to commit our code.

- - -
&nbsp;

# Implementing Local File Storage

The last few pieces of logic that we need to implement pertain to how we store the database dump. We'll have a strategy for storing locally and on AWS S3, and it makes sense to put both of these in the same module. Let's use TDD to implement the local storage strategy of our `storage` module.

## Documentation For This Video

-   [The `tempfile` package](https://docs.python.org/3/library/tempfile.html)
-   [The `tempfile.TemporaryFile` class](https://docs.python.org/3/library/tempfile.html#tempfile.TemporaryFile)
-   [The `tempfile.NamedTemporaryFile` class](https://docs.python.org/3/library/tempfile.html#tempfile.NamedTemporaryFile)

## Writing Local File Tests

Working with files is something that we already already know how to do, and local storage is no different. If we think about what our local storage driver needs to do, it really needs two things:

1.  Take in one "readable" object and one, local, "writeable" object.
2.  Write the contents of the "readable" object to the "writeable" object.

Notice that we didn't say files, that's because we don't need our inputs to be file objects. They need to implement some of the same methods that a file does, like [`read`](https://docs.python.org/3/library/io.html#io.BufferedWriter.read) and [`write`](https://docs.python.org/3/library/io.html#io.BufferedWriter.write), but they don't have to be file objects.

For our testing purposes, we can use the [`tempfile`](https://docs.python.org/3/library/tempfile.html) package to create a [`TemporaryFile`](https://docs.python.org/3/library/tempfile.html#tempfile.TemporaryFile) to act as our "readable" and another [`NamedTemporaryFile`](https://docs.python.org/3/library/tempfile.html#tempfile.NamedTemporaryFile) to act as our "writeable". We'll pass them both into our function, and assert after the fact that the contents of the "writeable" object match what was in the "readable" object:

*tests/test_storage.py*

```python
import tempfile

from pgbackup import storage
def test_storing_file_locally():
    """
    Writes content from one file-like to another
    """
    infile = tempfile.TemporaryFile('r+b')
    infile.write(b"Testing")
    infile.seek(0)

    outfile = tempfile.NamedTemporaryFile(delete=False)

    storage.local(infile, outfile)

    with open(outfile.name, 'rb') as f:
        assert f.read() == b"Testing"</code></pre>
```

## Implement Local Storage

The requirements we looked at before are close to what we need to do in the code. We want to call close on the "writeable" file to ensure that all of the content gets written (the database backup could be quite large):

*src/pgbackup/storage.py*

```python
def local(infile, outfile):
    outfile.write(infile.read())
    outfile.close()
    infile.close()
```

- - -
&nbsp;

# Implementing AWS Interaction

The last unit that we need to implement before we can combine all of our modules into our final tool is the storage strategy for AWS S3.

## Documentation For This Video

-   [The `boto3` package](https://boto3.readthedocs.io/en/latest/reference/services/s3.html#S3.Client.upload_fileobj)
-   [The `pytest-mock` package](https://github.com/pytest-dev/pytest-mock/#usage)
-   [The `Mock` class](https://docs.python.org/3/library/unittest.mock.html#unittest.mock.Mock)

## Installing boto3

To interface with AWS (S3 specifically), we're going to use the wonderful [`boto3`](https://boto3.readthedocs.io/en/latest/reference/services/s3.html#S3.Client.upload_fileobj) package. We can install this to our virtualenv using `pipenv`:

```
(pgbackup-E7nj_BsO) $ pipenv install boto3
```

## Configuring AWS Client

The [`boto3`](https://boto3.readthedocs.io/en/latest/reference/services/s3.html#S3.Client.upload_fileobj) package works off of the same configuration file that you can use with the official `aws` CLI. To get our configuration right, let's leave our virtualenv and install the `awscli` package for our user. From there, we'll use its `configure` command to set up our config file:

```
(pgbackup-E7nj_BsO) $ exit
$ mkdir ~/.aws
$ pip3.6 install --user awscli
$ aws configure
$ exec $SHELL
```

The `exec $SHELL` portion reload the shell to ensure that the configuration changes are picked up. Before moving on, make sure to reactivate our development virtualenv:

```
$ pipenv shell
```

## Writing S3 test

Following the approach that we've been using, let's write tests for our S3 interaction. To limit the explicit dependencies that we have, we're going to have the following parameters to our `storage.s3` function:

-   A client object that has an `upload_fileobj` method.
-   A `boto3` client meets this requirement, but in testing, we can pass in a "mock" object that implements this method.
-   A file-like object (responds to `read`).
-   An S3 bucket name as a string.
-   The name of the file to create in S3.

We need an `infile` for all of our tests, so let's extract a fixture for that also.

*tests/test_storage.py* (partial)

```python
import tempfile
import pytest

from pgbackup import storage
@pytest.fixture
def infile():
    infile = tempfile.TemporaryFile('r+b')
    infile.write(b"Testing")
    infile.seek(0)
    return infile

# Local storage tests...
def test_storing_file_on_s3(mocker, infile):
    """
    Writes content from one readable to S3
    """
    client = mocker.Mock()
    
    storage.s3(client,
        infile,
        "bucket",
        "file-name")

    client.upload_fileobj.assert_called_with(
        infile,
        "bucket",
        "file-name")

```

## Implementing S3 Strategy

Our test gives a little too much information about how we're going to implement our `storage.s3` function, but it should be pretty simple for us to implement now:

*src/pgbackup/storage.py* (partial)

```python
def s3(client, infile, bucket, name):
    client.upload_fileobj(infile, bucket, name)
```

## Manually Testing S3 Integration

Like we did with our PostgreSQL interaction, let's manually test uploading a file to S3 using our `storage.s3` function. First, we'll create an `example.txt` file, and then we'll load into a Python REPL with our code loaded:

```python
(pgbackup-E7nj_BsO) $ echo "UPLOADED" > example.txt
(pgbackup-E7nj_BsO) $ PYTHONPATH=./src python
>>> import boto3
>>> from pgbackup import storage
>>> client = boto3.client('s3')
>>> infile = open('example.txt', 'rb')
>>> storage.s3(client, infile, 'pyscripting-db-backups', infile.name)
```

When we check our S3 console, we should see the file there.

Lastly, remove the `example.txt` file and then commit these changes:

```
(pgbackup-E7nj_BsO) $ rm example.txt
(pgbackup-E7nj_BsO) $ git add .
(pgbackup-E7nj_BsO) $ git commit -m 'Implement S3 interactions'
```

- - -
&nbsp;

# Wiring everything together

We've successfully written the following:

-   CLI parsing
-   Postgres Interaction
-   Local storage driver
-   AWS S3 storage driver

Now we need to wire up an executable that can integrate these parts. Up to this point we've used TDD to write our code. These have been "unit tests" because we're only ever testing a single unit of code. If we wanted to write tests that ensure our application worked from start to finish, we could do that and they would be "integration" tests. Given that our code does a lot with the network, and we would have to do a lot of mocking to write integration tests, we're not going to write them. Sometimes the tests aren't worth the work that goes into them.

## Documentation For This Video

-   [The `boto3` package](https://boto3.readthedocs.io/en/latest/reference/services/s3.html#S3.Client.upload_fileobj)
-   [The `setuptools` script creation](https://setuptools.readthedocs.io/en/latest/setuptools.html#automatic-script-creation)
-   [The `time.strftime` function](https://docs.python.org/3/library/time.html#time.strftime)

## Add "console_script" to project

We can make our project create a console script for us when a user runs `pip install`. This is similar to the way that we made executables before, except we don't need to manually do the work. To do this, we need to add an entry point in our `setup.py`:

*setup.py* (partial)

```python
    install_requires=['boto3'],
    entry_points={
        'console_scripts': [
            'pgbackup=pgbackup.cli:main',
        ],
    }
```

Notices that we're referencing our `cli` module with a `:` and a `main`. That `main` is the function that we need to create now.

## Wiring The Units Together

Our `main` function is going to go in the `cli` module, and it needs to do the following:

1.  Import the [`boto3`](https://boto3.readthedocs.io/en/latest/reference/services/s3.html#S3.Client.upload_fileobj) package.
2.  Import our `pgdump` and `storage` modules.
3.  Create a parser and parse the arguments.
4.  Fetch the database dump.
5.  Depending on the driver type do one of the following:
    -   create a `boto3` S3 client and use `storage.s3` or
    -   open a local file and use `storage.local`

*src/pgbackup/cli.py*

```python
def main():
    import boto3
    from pgbackup import pgdump, storage

args = create_parser().parse_args()
dump = pgdump.dump(args.url)
if args.driver == 's3':
    client = boto3.client('s3')
    # TODO: create a better name based on the database name and the date
    storage.s3(client, dump.stdout, args.destination, 'example.sql')
else:
    outfile = open(args.destination, 'wb')
    storage.local(dump.stdout, outfile)</code></pre>
```

Let's test it out:

```
$ pipenv shell
(pgbackup-E7nj_BsO) $ pip install -e .
(pgbackup-E7nj_BsO) $ pgbackup --driver local ./local-dump.sql postgres://demo:password@54.245.63.9:80/sample
(pgbackup-E7nj_BsO) $ pgbackup --driver s3 pyscripting-db-backups postgres://demo:password@54.245.63.9:80/sample
```

## Reviewing the Experience

It worked! That doesn't mean there aren't things to improve though. Here are some things we should fix:

- Generate a good file name for S3
- Create some output while the writing is happening
- Create a shorthand switch for `--driver (-d)`

## Generating a Dump File Name

For generating our filename, let's put all database URL interactions in the pgdump module with a function name of `dump_file_name`. This is a pure function that takes an input and produces an output, so it's a prime function for us to unit test. Let's write our tests now:

*tests/test_pgdump.py* (partial)

```python
def test_dump_file_name_without_timestamp():
    """
    pgdump.db_file_name returns the name of the database
    """
    assert pgdump.dump_file_name(url) == "db_one.sql"

def test_dump_file_name_with_timestamp():
    """
    pgdump.dump_file_name returns the name of the database
    """
    timestamp = "2017-12-03T13:14:10"
    assert pgdump.dump_file_name(url, timestamp) == "db_one-2017-12-03T13:14:10.sql"
```

We want the file name returned to be based on the database name, and it should also accept an optional timestamp. Let's work on the implementation now:

*src/pgbackup/pgdump.py* (partial)

```python
def dump_file_name(url, timestamp=None):
    db_name = url.split("/")[-1]
    db_name = db_name.split("?")[0]
    if timestamp:
        return f"{db_name}-{timestamp}.sql"
    else:
        return f"{db_name}.sql"
```
## Improving the CLI and Main Function

We want to add a shorthand -d flag to the driver argument, let's add that to the create_parser function:

*src/pgbackup/cli.py* (partial)

```python
def create_parser():
    parser = argparse.ArgumentParser(description="""
    Back up PostgreSQL databases locally or to AWS S3.
    """)
    parser.add_argument("url", help="URL of database to backup")
    parser.add_argument("--driver", "-d",
            help="how & where to store backup",
            nargs=2,
            metavar=("DRIVER", "DESTINATION"),
            action=DriverAction,
            required=True)
    return parser
```

Lastly, let's print a timestamp with [time.strftime](https://docs.python.org/3/library/time.html#time.strftime), generate a database file name, and print what we're doing as we upload/write files.

*src/pgbackup/cli.py* (partial)

```python
def main():
    import time
    import boto3
    from pgbackup import pgdump, storage

    args = create_parser().parse_args()
    dump = pgdump.dump(args.url)

if args.driver == 's3':
    client = boto3.client('s3')
    timestamp = time.strftime("%Y-%m-%dT%H:%M", time.localtime())
    file_name = pgdump.dump_file_name(args.url, timestamp)
    print(f"Backing database up to {args.destination} in S3 as {file_name}")
    storage.s3(client,
            dump.stdout,
            args.destination,
            file_name)
else:
    outfile = open(args.destination, 'wb')
    print(f"Backing database up locally to {outfile.name}")
    storage.local(dump.stdout, outfile)</code></pre>
```

Feel free to test the CLI's modifications and commit these changes.


- - -
&nbsp;

# Building and sharing a Wheel Distribution

For our internal tools, there's a good chance that we won't be open sourcing every little tool that we write, but we will want it to be distributable. The newest and preferred way to distribute a python tool is to build a 'wheel'.

Let's set up our tool now to be buildable as a wheel so that we can distribute it.

## Documentation For This Video

-   [The `wheel` documentation](https://wheel.readthedocs.io/en/stable/#defining-the-python-version)

## Adding a `setup.cfg`

Before we can generate our [`wheel`](https://wheel.readthedocs.io/en/stable/#defining-the-python-version), we're going to want to configure `setuptools` to not build the wheel for Python 2. We can't build for Python 2 because we used string interpolation. We'll put this configuration in a `setup.cfg`:

*setup.cfg*

```
[bdist_wheel]
python-tag = py36
```

Now we can run the following command to build our wheel:

```
(pgbackup-E7nj_BsO) $ python setup.py bdist_wheel
```

Next, let's uninstall and re-install our package using the wheel file:

```
(pgbackup-E7nj_BsO) $ pip uninstall pgbackup
(pgbackup-E7nj_BsO) $ pip install dist/pgbackup-0.1.0-py36-none-any.whl
```

## Install a Wheel From Remote Source (S3)

We can use `pip` to install wheels from a local path, but it can also install from a remote source over HTTP. Let's upload our wheel to S3 and then install the tool outside of our virtualenv from S3:

```python
(pgbackup-E7nj_BsO) $ python
>>> import boto3
>>> f = open('dist/pgbackup-0.1.0-py36-none-any.whl', 'rb')
>>> client = boto3.client('s3')
>>> client.upload_fileobj(f, 'pyscripting-db-backups', 'pgbackup-0.1.0-py36-none-any.whl')
>>> exit()
```

We'll need to go into the S3 console and make this file public so that we can download it to install.

Let's exit our virtualenv and install `pgbackup` as a user package:

```
(pgbackup-E7nj_BsO) $ exit
$ pip3.6 install --user https://s3.amazonaws.com/pyscripting-db-backups/pgbackup-0.1.0-py36-none-any.whl
$ pgbackup --help
```

- - -
&nbsp;