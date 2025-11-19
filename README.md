## FastAPI Project Starter

This repository contains a lightweight FastAPI project created as a hands-on way to understand how FastAPI works end to end.

---

## Getting Started

Follow the steps below to set up the project locally using [`uv`](https://docs.astral.sh/uv/).

1. **Initialize the environment**
   ```bash
   uv init .
   ```
2. **Install dependencies**
   ```bash
   uv pip install -r requirements.txt
   ```
3. **Grant Execute Permissions: Use the chmod (change mode) command to add execute permissions.**
   ```bash
   chmod +x start.sh
   ```
4. **Run the start.sh**
   ```bash
   ./start.sh
   ```
   

Once the server starts, open your browser at http://127.0.0.1:8000 to check the API. The interactive API docs are available at http://127.0.0.1:8000/docs.

---

![Login Page](https://github.com/Raahul-G/FastAPI_project/blob/main/Images/Simple%20Social%20Login%20Page.jpeg?raw=true)

---

![Upload Page](https://github.com/Raahul-G/FastAPI_project/blob/main/Images/Simple%20Social%20Upload%20Page.jpeg?raw=true)

---

![Feed](https://github.com/Raahul-G/FastAPI_project/blob/main/Images/Simple%20Social%20Feed.jpeg?raw=true)

---

## Project Overview

This project demonstrates:

- Structuring a FastAPI application with routers and dependency injection
- Serving endpoints that respond with JSON payloads
- Using Pydantic models for validation
- Exploring FastAPI's automatic documentation generation
- Experimenting with async request handling and background tasks

The focus is purely educational: working through this codebase is intended to build intuition about FastAPI’s ergonomics, patterns, and tooling by doing rather than just reading theory.



