#!/bin/bash

echo "Starting FastAPI backend on port 8000..."
uvicorn app.app:app --host 0.0.0.0 --port 8000 &

echo "Waiting for FastAPI to start..."
sleep 15

echo "Starting Streamlit frontend..."
streamlit run frontend.py
