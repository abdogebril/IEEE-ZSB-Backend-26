# Task 2 - Laravel Research

## 1. Laravel Gates

Gates are simple closure-based authorization checks. They are used to ask, "Can this user perform this action?" and return either true or false.

### Defined in

Usually in AppServiceProvider.php or AuthServiceProvider.php:

```php
use Illuminate\Support\Facades\Gate;

Gate::define('update-post', function ($user, $post) {
    return $user->id === $post->user_id;
});
```

### Usage

```php
Gate::allows('update-post', $post);   // true/false
Gate::denies('update-post', $post);   // opposite check
Gate::authorize('update-post', $post); // throws 403 automatically if denied
```

### In Blade

```blade
@can('update-post', $post)
    <button>Edit</button>
@endcan
```

### How it works

Laravel resolves the current user, finds the named gate, runs its callback with the given arguments such as $user and $post, and returns a boolean. This is handled internally by Laravel’s Authorization Gate Manager.

### When to use

Use Gates for simple, one-off permission checks that are not tied to a specific model. For permissions related to a model and multiple actions such as view, update, or delete, use Policies instead.

<hr style="border: 2px solid red; margin: 20px 0;">

## 2. Sanctum vs Passport

Both are official Laravel authentication packages, but they are designed for different use cases.

| Feature | Sanctum | Passport |
|---|---|---|
| Purpose | Simple token and cookie authentication | Full OAuth2 implementation |
| Best for | SPAs, mobile apps, first-party APIs | Third-party apps, external OAuth clients |
| Setup | Lightweight and minimal | Heavier with more configuration |
| Token storage | DB-stored personal access tokens | OAuth2 access and refresh tokens |
| Supports | API tokens and SPA cookie authentication | Authorization code flow, password grant, client credentials |

### Sanctum example

```php
$user->createToken('mobile')->plainTextToken;
```

### Rule of thumb

- If you own both the frontend and backend, use Sanctum.
- If you need OAuth2 or third-party integrations such as "Login with GitHub", use Passport.

---

## 3. CSRF vs XSRF

CSRF (Cross-Site Request Forgery) and XSRF are the same attack, just different names.

### The attack

A malicious website tricks a logged-in user’s browser into sending an unwanted authenticated request. Since the browser automatically sends cookies, the request may appear legitimate.

### Laravel’s defense for forms

Laravel uses a CSRF token for HTML forms:

```blade
@csrf
```

This renders a hidden _token input. Laravel validates the token on every POST, PUT, PATCH, and DELETE request. If the token is missing or invalid, it returns 419 Page Expired.

### XSRF-TOKEN for AJAX and SPAs

Laravel also sets an XSRF-TOKEN cookie. JavaScript libraries such as Axios can read this cookie and send it back as the X-XSRF-TOKEN header. Laravel verifies it.

### Summary

Both are the same protection mechanism, but they are delivered in different ways:

- _token for forms
- XSRF-TOKEN cookie/header for JavaScript and AJAX requests

<hr style="border: 2px solid red; margin: 20px 0;">

## 4. Eloquent Relationships

| Relationship | Meaning | Example |
|---|---|---|
| hasOne | One-to-one | User → Profile |
| hasMany | One-to-many | User → Posts |
| belongsTo | Inverse of hasOne/hasMany | Post → User |
| belongsToMany | Many-to-many via pivot table | Student ↔ Course |
| hasManyThrough | Access related data through an intermediate model | Country → Users → Posts |
| Polymorphic | One model relates to multiple model types via *_id and *_type columns | Comment on both Post and Video |

### Examples

```php
// One to One
public function profile()
{
    return $this->hasOne(Profile::class);
}

// One to Many
public function posts()
{
    return $this->hasMany(Post::class);
}

// Belongs To (inverse)
public function user()
{
    return $this->belongsTo(User::class);
}

// Many to Many
public function courses()
{
    return $this->belongsToMany(Course::class);
}

// Has Many Through
public function posts()
{
    return $this->hasManyThrough(Post::class, User::class);
}
```

### Polymorphic example

A comments table can store commentable_id and commentable_type, allowing one Comment model to belong to either a Post or a Video without separate pivot tables for each model.
