from fastapi import APIRouter

router = APIRouter(
    prefix="/services",
    tags=["services"]
)

@router.get("")
async def read_services():
    return {"message": "Welcome to the Services Page!"}

@router.get("/{service_id}")
async def read_service(service_id: int):
    return {"message": f"Here is service {service_id}!"}


