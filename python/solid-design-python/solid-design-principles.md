# SOLID Design Principles in Python

## Single Responsibility Principle

Things like classes and modules should have only a single reason to change.

If you have a class with functionality A and B inside, you might break B by changing A just from the fac taht they share the same class.

### 1. TooManyThingsNameProblem:
- Classes get big when they have many resposibilities
- Naming classes is hard and finding  is hard

Basically having a class that does too many things. 

### 2. Mixing Responsibilities
- Dangerous to change code around other unrelated code

### 3. Dependencies on Libraries
- Harmless dependency in one class starts to invade another unrelated class.

## Open-Closed Principle

## Liskov Substitution Principle

## Interface Segregation Principle

## Dependency Inversion Principle

