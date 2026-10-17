from pydantic import BaseModel,Field,EmailStr
from datetime import datetime

class UserCreateSchema(BaseModel):
    name :str = Field(min_length=3,max_length=50)
    username: str = Field(min_length=3,max_length=50)
    email:EmailStr
    password:str=Field(min_length=8)

class UserLoginSchema(BaseModel):
    username:str
    password:EmailStr

class UserOutputSchema(BaseModel):
    id: int
    name:str
    username:str
    email:EmailStr
    created_at:datetime