# 🔐 Firebase ID Token Verification Service

Microservice for verifying **Firebase ID tokens** obtained after authentication via Firebase Authentication. Used as a separate component for other services that need to verify the user's authenticity.

---

## Installation

1. Clone repository:

```bash
git clone https://github.com/printHelloworldd/jwt_verification.git
cd jwt_verification
```

3. Install dependencies:

```bash
dart pub get
```

4. Run:

```bash
dart run bin/server.dart
```

---

## Configuration
### 📄 `.env` file
In the root of the project, create a `.env` file and set the following variables

```
WEB_API_KEY = your_web_api_key
```

### Description of variables:

- WEB_API_KEY — It can be found in the Firebase console.

> ⚠️ **Important:**
> 
> - Never commit `.env` to repository.
>     
> - Make sure `.env` is in `.gitignore`.


---

### 📬 Example of request using `curl`

```bash
curl -X POST http://localhost:8080/verify-jwt \
  -H "Content-Type: application/json" \
  -d '{
    "idToken": "sender id token"
    "senderUserId": "sender user id"
  }'
```

### 📝 Explanation of parameters:
  
- **`idToken`** - The user ID token obtained via Firebase Authentication is passed here.
    
- **`senderUserId`** — Sender user ID, for validation
    
---

## ⚙️ Dependencies

- **`dotenv`** — for configuration from `.env`
- **`http`** - a package for making HTTP requests to external services.
- **`shelf`** - A web server and middleware framework for Dart that processes incoming HTTP requests and generates responses.
- **`shelf_router`** - a router on top of `shelf` that simplifies routing and handling of different HTTP endpoints.

---

## 🧑‍💻 Contribution to the project

Contribution to the development of the project is welcome!
If you want to make changes:

1. Fork the repository;
    
2. Create a branch named `feature/feature-name`;
    
3. Make your changes;
    
4. Open a Pull Request.
    

We recommend discussing the idea via Issues beforehand.

---

## Author(s)
Danylo Silin
[Email](mailto:danilsilin76@gmail.com)
