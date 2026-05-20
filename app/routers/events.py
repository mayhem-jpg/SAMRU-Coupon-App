from fastapi import APIRouter

router = APIRouter(
    prefix="/events",
    tags=["events"]
)

@router.get("")
async def read_events():
    return {"message": "Welcome to the Events Page!"}

@router.get("/{event_id}")
async def read_upcoming_events(event_id: int):
    return {"message": f"Here is event {event_id}!"}