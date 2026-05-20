from fastapi import APIRouter
from pydantic import BaseModel
from typing import Optional

router = APIRouter(
    prefix="/feedback",
    tags=["feedback"]
)

class feedback(BaseModel):
    email: Optional[str] = None
    description: str
    category: str
    allow_contact: bool


@router.post("")
async def submit_feedback(feedback_data: feedback):
    return {"message": "Feedback submitted successfully", 
            "data": feedback_data}
