import os

from fastapi import APIRouter
from starlette.responses import FileResponse

router = APIRouter(
    prefix="/albums/static"

)


@router.get("/csv")
def serve_static_csv():
    csv_path = os.path.join(os.path.dirname(__file__), "..", "data", "muzicki_albumi.csv")

    return FileResponse(
        path=csv_path,
        media_type="text/csv",
        filename="muzicki_albumi.csv"
    )


@router.get("/json")
def serve_static_json():
    json_path = os.path.join(os.path.dirname(__file__), "..", "data", "muzicki_albumi.json")

    return FileResponse(
        path=json_path,
        media_type="application/json",
        filename="muzicki_albumi.json"
    )


