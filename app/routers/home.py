from fastapi import APIRouter

router = APIRouter(
    prefix="/home",
    tags=["home"]
)

@router.get("")
async def read_home():
    return {"message": "Welcome to the Home Page!"}

@router.get("/popular_coupons")
async def read_popular_coupons():
    return {"message": "Here are some popular coupons!"}

@router.get("/upcoming_events")
async def read_upcoming_events():
    return {"message": "Here are some upcoming events!"}