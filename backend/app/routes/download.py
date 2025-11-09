import io

import psycopg2, csv, json

from fastapi import APIRouter
from starlette.responses import StreamingResponse


from db import get_db_connection


router = APIRouter(
    prefix="/albums/export"
)


def fetch_albm(search: str = "", attribute: str = ""):
    db = get_db_connection()
    cursor = db.cursor()

    valid_attrs = {"naziv", "izvodjac", "zanr", "format"}

    if not search:
        cursor.execute("SELECT * FROM albums;")
    elif attribute and attribute in valid_attrs:
        pattern = f"%{search}%"
        sql = f"SELECT * FROM albums WHERE {attribute} ILIKE %s;"
        cursor.execute(sql, (pattern,))
    else:
        pattern = f"%{search}%"
        sql = (
            "SELECT * FROM albums "
            "WHERE naziv ILIKE %s OR izvodjac ILIKE %s"
            "   OR zanr ILIKE %s OR format ILIKE %s;"
        )
        cursor.execute(sql, (pattern, pattern, pattern, pattern))
    rows = cursor.fetchall()
    colnames = [desc[0] for desc in cursor.description]
    cursor.close()
    db.close()

    return rows, colnames




@router.get("/csv")
def download_csv(search: str = "", attribute: str = ""):

    rows, colnames = fetch_albm(search, attribute)

    output = io.StringIO()
    writer = csv.writer(output)
    writer.writerow(colnames)
    writer.writerows(rows)

    return StreamingResponse(
        io.StringIO(output.getvalue()),
        media_type="text/csv",
        headers={"Content-Disposition": "attachment; filename=albums.csv"},
    )




@router.get("/json")
def download_json(search: str = "", attribute: str = ""):

   rows, colnames = fetch_albm(search, attribute)
   data = [dict(zip(colnames, row)) for row in rows]

   json_string = json.dumps(data, ensure_ascii=False, indent=2, default=str)

   return StreamingResponse(
      io.StringIO(json_string),
      media_type="application/json",
      headers={"Content-Disposition": "attachment; filename=albums.json"},
   )


