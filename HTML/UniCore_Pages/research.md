# Research Questions

## 1. GET vs POST
In the `<form>` tag, we have an attribute `method`. Explain the critical security and functional difference between `method="GET"` and `method="POST"`. Which one would you use for the `register.html` page and why?

**Answer:**  
- **GET**: Data appears in the URL, anyone can see it. Not suitable for sensitive data like passwords.  
- **POST**: Data is sent in the request body, more secure, does not appear in the URL, suitable for sensitive information.  
- For `register.html`, use **POST** because it handles sensitive data like email and password.

---

## 2. Semantic HTML
We could build the whole website using only `<div>` tags. Why is it "better" to use tags like `<header>`, `<main>`, `<section>`, and `<footer>`?

**Answer:**  
- Using semantic tags gives meaning to the content.  
- It makes the code clearer and easier to understand.  
- It helps search engines and screen readers understand the page.  
- It makes code maintenance easier.

---

## 3. The Request/Response Cycle
When you type google.com and hit Enter, briefly explain the steps your browser takes to fetch the page (mention DNS and IP).

**Answer:**  
1. The browser sends a request to the DNS server to get the IP address of the site.  
2. After obtaining the IP, the browser sends an HTTP or HTTPS request to the server.  
3. The server receives the request and sends back the web page (HTML, CSS, JS) as a response.  
4. The browser receives the data and renders the page for the user.