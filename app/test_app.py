from fastapi import FastAPI, HTTPException
from app.schemas import PostCreate, PostResponse
from app.db import Post, create_db_and_tables, get_async_session
from sqlalchemy.ext.asyncio import AsyncSession
from contextlib import asynccontextmanager

@asynccontextmanager
async def lifespan(app: FastAPI):
    await create_db_and_tables()
    yield

app = FastAPI(lifespan=lifespan)

text_posts = {
    1: {"title": "New Post", "content": "Cool test post"},
    2: {"title": "Test Post 2", "content": "This is the second test post, focusing on Python."},
    3: {"title": "Draft Idea", "content": "Exploring the concept of dynamic content generation."},
    4: {"title": "Quick Thought", "content": "Just a quick thought about AI assistance and efficiency."},
    5: {"title": "Coding Snippet", "content": "A small code snippet demonstrating dictionary manipulation."},
    6: {"title": "Future Feature", "content": "Brainstorming a potential new feature for a blog platform."},
    7: {"title": "Example Content", "content": "This post serves as general example content for layout testing."},
    8: {"title": "Placeholder Title", "content": "The main content here is just filler text to check post length."},
    9: {"title": "System Check", "content": "Performing a system check on the database integration points."},
    10: {"title": "Welcome Back", "content": "A simple 'welcome back' message for user login testing."},
    11: {"title": "Final Test Post", "content": "Post number eleven to round out the requested test set."}
}

@app.get("/posts")
def get_all_post(limit: int = None):
    if limit:
        return list(text_posts.values())[:limit]
    return text_posts

@app.get("/posts/{id}")
def get_post(id: int):
    if id not in text_posts:
        raise HTTPException(status_code=404, detail='Post Not Found')
    
    return text_posts.get(id)

@app.post("/posts")
def create_post(post: PostCreate) -> PostResponse:
    new_post = {"title":post.title, "content":post.content}
    text_posts[max(text_posts.keys())+1] = new_post
    return new_post 