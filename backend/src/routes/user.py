from fastapi import APIRouter,status,Depends
from src.schemas.user import UserCreateSchema,UserOutputSchema
from sqlalchemy.ext.asyncio import AsyncSession
from src.utils.db import get_db
from src.controllers import user

user_router = APIRouter(prefix="/users")

@user_router.post("/register",response_model=UserOutputSchema,status_code=status.HTTP_201_CREATED)
async def register(body:UserCreateSchema,db:AsyncSession=Depends(get_db)):
    return await user.register(body,db)