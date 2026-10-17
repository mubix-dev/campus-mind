from contextlib import asynccontextmanager
from fastapi import FastAPI
from src.utils.db import Base,engine


@asynccontextmanager
async def lifespan(app: FastAPI):
    async with engine.begin() as conn:
        await conn.run_sync(Base.metadata.create_all)
    yield
    await engine.dispose()


app = FastAPI(title="CampusMind", lifespan=lifespan)


@app.get("/")
def read_root():
    return {
        "message":"Server is running..."
    }