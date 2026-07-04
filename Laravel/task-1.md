# Task 1 - Laravel Research

# Blade Templates

Blade is Laravel’s templating engine.
It helps developers write dynamic HTML in a cleaner and more organized way.

Instead of mixing a lot of PHP code with HTML, Blade provides simple and readable syntax.

---

## Why Blade is Useful

- Cleaner code structure
- Easier to read and maintain
- Reusable layouts and components
- Faster development
- Built-in directives for loops and conditions

---

## Example

### Without Blade

```php
<?php if($isAdmin): ?>
    <h1>Welcome Admin</h1>
<?php endif; ?>
```

---

### With Blade

```php
@if($isAdmin)
    <h1>Welcome Admin</h1>
@endif
```

Blade makes the code shorter and easier to understand.

---

## Blade Loops

```php
@foreach($users as $user)
    <p>{{ $user }}</p>
@endforeach
```

---

## Blade Layouts

One of the strongest Blade features is layout reusability.

### Main Layout

```php
<!-- layout.blade.php -->

<html>
<head>
    <title>@yield('title')</title>
</head>

<body>
    @yield('content')
</body>
</html>
```

---

### Child Page

```php
@extends('layout')

@section('title', 'Home')

@section('content')
    <h1>Welcome</h1>
@endsection
```

This prevents repeating the same HTML code in every page.

<hr style="border: 2px solid red; margin: 20px 0;">

# ORM (Object Relational Mapping)

ORM is a technique that allows developers to interact with databases using objects instead of writing raw SQL queries.

Laravel uses **Eloquent ORM**.

---

## Example

Instead of writing SQL manually:

```sql
SELECT * FROM users;
```

Laravel allows us to write:

```php
User::all();
```

The code becomes simpler and more readable.

---

# Why ORM is Useful

## 1. Cleaner Syntax

Developers write PHP instead of complex SQL queries.

---

## 2. Faster Development

Less repetitive code and easier database operations.

---

## 3. Better Readability

The code is easier to understand and maintain.

---

## 4. Security

ORM helps protect applications from SQL Injection attacks.

---

## 5. Easy Relationships

Eloquent makes relationships between tables very simple.

Example:

```php
$user->posts;
```

Instead of writing complex JOIN queries manually.

<hr style="border: 2px solid red; margin: 20px 0;">

# Facade Design Pattern

Facade is a design pattern that provides a simple interface to a complex system.

Laravel uses facades heavily to simplify development.

Examples of facades in Laravel:

- Route
- DB
- Cache
- Auth
- File

---

## Example of Facade Usage

```php
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return "Hello Laravel";
});
```

---

Another example:

```php
use Illuminate\Support\Facades\Cache;

Cache::put('name', 'Abdullah', 60);

echo Cache::get('name');
```

Facades hide complicated backend logic and provide a clean interface for developers.

<hr style="border: 2px solid red; margin: 20px 0;">

# Factory Design Pattern

Factory Pattern is used to create objects without exposing the object creation logic directly.

Instead of creating objects manually every time, a factory class handles the creation process.

This makes the code:

- More organized
- Easier to maintain
- More flexible

---

## Example

```php
class Car
{
    public function brand()
    {
        return "BMW";
    }
}

class CarFactory
{
    public static function make()
    {
        return new Car();
    }
}

$car = CarFactory::make();

echo $car->brand();
```

<hr style="border: 2px solid red; margin: 20px 0;">

# SOLID Principles

SOLID is a group of five principles that help developers write clean, maintainable, and scalable code.

---

# 1. Single Responsibility Principle (SRP)

A class should have only one responsibility.

---

## Bad Example

```php
class User
{
    public function saveUser() {}

    public function sendEmail() {}
}
```

This class handles both database operations and email functionality.

---

## Good Example

```php
class User
{
    public function saveUser() {}
}

class EmailService
{
    public function sendEmail() {}
}
```

Now each class has a single responsibility.

---

# 2. Open/Closed Principle (OCP)

Classes should be:

- Open for extension
- Closed for modification

This means we can add new functionality without changing existing code.

---

## Example

```php
interface Shape
{
    public function area();
}

class Circle implements Shape
{
    public function area()
    {
        return 50;
    }
}

class Square implements Shape
{
    public function area()
    {
        return 100;
    }
}
```

New shapes can be added without modifying old classes.

---

# 3. Liskov Substitution Principle (LSP)

Child classes should be replaceable with parent classes without breaking the application.

---

## Example

```php
class Bird
{
    public function move() {}
}

class FlyingBird extends Bird
{
    public function fly() {}
}
```

The child class should behave correctly as the parent class expects.

---

# 4. Interface Segregation Principle (ISP)

A class should not be forced to implement methods it does not use.

---

## Bad Example

```php
interface Worker
{
    public function work();

    public function eat();
}
```

A robot can work but does not eat.

---

## Good Example

```php
interface Workable
{
    public function work();
}

interface Eatable
{
    public function eat();
}
```

Now each class implements only the methods it needs.

---

# 5. Dependency Inversion Principle (DIP)

High-level modules should depend on abstractions, not concrete classes.

---

## Bad Example

```php
class MySQLDatabase
{
    public function connect() {}
}

class UserService
{
    private $db = new MySQLDatabase();
}
```

This creates tight coupling with MySQL.

---

## Good Example

```php
interface Database
{
    public function connect();
}

class MySQLDatabase implements Database
{
    public function connect() {}
}

class UserService
{
    private $db;

    public function __construct(Database $db)
    {
        $this->db = $db;
    }
}
```

Now the database can be changed easily without modifying the service class.

---

# Conclusion

Laravel provides powerful tools such as:

- Blade Templates
- Eloquent ORM
- Facades
- Design Patterns

These features help developers build clean, scalable, and maintainable web applications efficiently.
