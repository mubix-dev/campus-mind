from pydantic import BaseModel,Field,field_validator,EmailStr
from datetime import datetime

class UserCreateSchema(BaseModel):

    name :str 
    email:EmailStr
    password:str

    
class UserLoginSchema(BaseModel):
    email:EmailStr
    password:str

class UserOutputSchema(BaseModel):
    id: int
    name:str
    email:EmailStr
    created_at:datetime