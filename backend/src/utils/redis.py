from redis.asyncio import Redis
from src.utils.settings import settings


redis_client = Redis.from_url(
    settings.REDIS_URL,
)

async def get_redis() -> Redis:
    return redis_client