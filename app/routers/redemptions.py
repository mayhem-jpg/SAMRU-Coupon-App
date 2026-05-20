from fastapi import APIRouter

router = APIRouter(
    prefix="/redemptions",
    tags=["redemptions"]
)

@router.get("{redemption_id}")
async def get_redemption(redemption_id: int):
    return {"message": f"Get redemption with ID {redemption_id}"}

@router.get("/history")
async def redemption_history():
    return {"message": "Get redemption history"}

@router.post("/{redemption_id}/cancel")
async def cancel_redemption(redemption_id: int):
    return {"message": f"Cancel redemption with ID {redemption_id}"}