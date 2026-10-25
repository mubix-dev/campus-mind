from contextlib import asynccontextmanager
from fastapi import FastAPI
from src.utils.db import Base,engine
from src.routes.user import user_router
from src.utils.redis import redis_client

@asynccontextmanager
async def lifespan(app: FastAPI):
    await redis_client.ping()
    async with engine.begin() as conn:
        await conn.run_sync(Base.metadata.create_all)
    yield
    await redis_client.aclose()
    await engine.dispose()



app = FastAPI(title="CampusMind", lifespan=lifespan)

app.include_router(user_router,prefix="/api/v1")


@app.get("/")
def read_root():
    return {
        "message":"Server is running..."
    }