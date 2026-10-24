from src.schemas.user import UserCreateSchema,UserLoginSchema,UserOutputSchema
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select
from src.models.user import UserModel
from fastapi import HTTPException,status,Response
from pwdlib import PasswordHash

password_hash = PasswordHash.recommended()

def get_hashed_password(password):
    return password_hash.hash(password)

def verify_password(plain_password,hashed_password):
    return password_hash.verify(plain_password,hashed_password)

async def register(body:UserCreateSchema,db:AsyncSession):

    result = await db.execute(
        select(UserModel).where(
            UserModel.email == body.email
        )
    )

    is_user_exist = result.scalars().first()

    if is_user_exist:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="User already exists!"
        )

    if len(body.name) < 4:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Username must be at least 4 characters long!"
        )

    if len(body.password) < 8:
        raise HTTPException(
            status_code=status.HTTP_422_UNPROCESSABLE_CONTENT,
            detail="Password must be atleast 8 characters long!"
        )


    hashed_password = get_hashed_password(body.password)

    try:
        new_user = UserModel(
            name = body.name,
            email = body.email,
            password = hashed_password
        )

        db.add(new_user)
        await db.commit()
        await db.refresh(new_user)


    except Exception:
        await db.rollback()
        raise

    return new_user


async def login(body:UserLoginSchema,response:Response,db:AsyncSession):

    result = await db.execute(
        select(UserModel).where(
            UserModel.email == body.email
        )
    )

    user = result.scalars().first()

    if not user or not verify_password(body.password,user.password):
        raise HTTPException(
            status_code= status.HTTP_401_UNAUTHORIZED,
            detail="Invalid Credentials"
        )

    return user
