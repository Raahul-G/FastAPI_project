#!/bin/bash

# --- VIRTUAL ENVIRONMENT ACTIVATION (FIX for "command not found" errors) ---
# This block checks for common venv locations to ensure 'uvicorn' and 'streamlit' are found.

# 1. Check for standard local venv (project root: ./.venv/bin/activate)
# NOTE: Changed from './venv/' to './.venv/' based on your configuration.
if [ -f "./.venv/bin/activate" ]; then
    echo "Activating local virtual environment..."
    source ./.venv/bin/activate

# 2. Check for deployment venv (Streamlit Cloud path: /home/adminuser/venv/bin/activate)
elif [ -f "/home/adminuser/venv/bin/activate" ]; then
    echo "Activating cloud virtual environment..."
    source /home/adminuser/venv/bin/activate

else
    echo "ERROR: Virtual environment not found in expected paths (./.venv/ or /home/adminuser/venv/)."
    echo "Please ensure you have run 'python3 -m venv .venv' and installed dependencies."
    # Exit with error to prevent 'uvicorn: command not found' later
    exit 1 
fi

# This script starts the FastAPI backend in the background 
# and then runs the Streamlit frontend.

# 1. Start FastAPI Backend
echo "Starting FastAPI backend on port 8000..."
# NOTE: Replace 'main:app' with the actual path to your FastAPI instance 
uvicorn app.app:app --host 0.0.0.0 --port 8000 &

# Wait for the FastAPI server to start up. This is CRUCIAL.
sleep 15 

# 2. Start Streamlit Frontend
echo "Starting Streamlit frontend..."
streamlit run frontend.py