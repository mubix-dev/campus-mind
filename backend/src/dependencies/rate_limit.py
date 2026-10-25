from src.utils.redis import redis_client
from fastapi import Request,HTTPException,status


async def rate_limiter(request:Request):
    key = f"ip:{request.client.host}"
    requests = await redis_client.incr(key)

    if requests == 1:
        await redis_client.expire(key,60)
    if requests > 5:
        raise HTTPException(status_code=status.HTTP_429_TOO_MANY_REQUESTS,detail="Too many Requests")
