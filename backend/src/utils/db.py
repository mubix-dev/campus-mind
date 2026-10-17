from src.utils.settings import settings
from sqlalchemy.ext.asyncio import create_async_engine,async_sessionmaker
from sqlalchemy.orm import declarative_base

Base = declarative_base()

engine = create_async_engine(
    url=settings.DB_URI,
    pool_pre_ping=True
)

AsyncLocalSession = async_sessionmaker(
    bind=engine,
)

async def get_db():
    async with AsyncLocalSession() as session:
        yield session

