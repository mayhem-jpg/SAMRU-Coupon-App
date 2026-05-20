from fastapi import APIRouter

router = APIRouter(
    prefix="/vendors",
    tags=["vendors"]
)

@router.get("")
async def get_vendors():
    return {"message": "List of vendors"}

@router.get("/{vendor_id}")
async def get_vendor(vendor_id: int):
    return {"message": f"Here is vendor {vendor_id}!"}

@router.get("/{vendor_id}/coupons")
async def get_vendor_coupons(vendor_id: int):
    return {"message": f"Here are the coupons for vendor {vendor_id}!"}