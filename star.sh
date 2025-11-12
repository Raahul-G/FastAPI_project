#!/bin/bash

# This script starts the FastAPI backend in the background 
# and then runs the Streamlit frontend.

# 1. Start FastAPI Backend
# NOTE: Replace 'main:app' with the actual path to your FastAPI instance 
# (e.g., 'backend.server:app' if your instance is named 'app' in 'backend/server.py')
echo "Starting FastAPI backend on port 8000..."
uvicorn main:app --host 0.0.0.0 --port 8000 &

# Wait for the FastAPI server to start up. This is CRUCIAL.
sleep 30 

# 2. Start Streamlit Frontend
echo "Starting Streamlit frontend..."
# API_BASE_URL is not explicitly needed here because Streamlit Cloud defaults
# to connecting processes via localhost. However, if your API is deployed 
# externally, you would set the variable here or as a Streamlit secret.
streamlit run frontend.py