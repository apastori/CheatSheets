# JSON Web Tokens (JWT) Explained

## What is a JSON Web Token (JWT)?

A **JSON Web Token (JWT)** is an open standard (RFC 7519) used to securely transmit information between two parties as a JSON object. The information inside the token can be verified and trusted because it is digitally signed. JWTs are commonly used for authentication and authorization in web applications.

## Structure of a JWT

A JWT consists of three parts, separated by dots (`.`):

### 1. Header

The header typically contains two parts:
- **`alg`**: The signing algorithm (e.g., `HS256`, `RS256`).
- **`typ`**: The type of the token (which is typically `"JWT"`).

**Example header:**
```json
{
  "alg": "HS256",
  "typ": "JWT"
}
