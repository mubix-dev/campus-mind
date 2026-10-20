from sqlalchemy import String,Integer,Column,DateTime,CheckConstraint
from src.utils.db import Base
from datetime import datetime

class UserModel(Base):
    __tablename__ = "users"

    id = Column(Integer,primary_key=True)
    name = Column(String,nullable=False)
    email=Column(String,unique=True,nullable=False)
    password=Column(String,nullable=False)
    created_at= Column(DateTime,default=datetime.now)

    __table_args__ = (
        CheckConstraint("email LIKE '%@%' ",name="check_valid_email"),
    )