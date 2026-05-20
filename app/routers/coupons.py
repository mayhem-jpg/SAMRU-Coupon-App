from fastapi import APIRouter

router = APIRouter(
    prefix="/coupons",
    tags=["coupons"]
)


@router.get("")
async def get_coupons():
    return {"message": "Get coupons"}

@router.post("")
async def all_coupons():
    return {"message": "See all Coupons"}

@router.get("/{coupon_id}")
async def get_coupon(coupon_id: int):
    return {"message": f"Get coupon with ID {coupon_id}"}

@router.post("/{coupon_id}/redemption")
async def redeem_coupon(coupon_id: int):
    return {"message": f"Redeem coupon with ID {coupon_id}"}