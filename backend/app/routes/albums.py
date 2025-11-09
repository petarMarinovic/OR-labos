from fastapi import APIRouter

from db import get_db_connection

router = APIRouter(prefix="/albums")


@router.get("/")
def get_albums(search: str = "", attribute: str = ""):

    valid_attrs = {"naziv", "izvodjac", "zanr", "format"}

    db = get_db_connection()
    cursor = db.cursor()


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
                "WHERE naziv ILIKE %s "
                "   OR izvodjac ILIKE %s "
                "   OR zanr ILIKE %s "
                "   OR format ILIKE %s;"
                )
        cursor.execute(sql, (pattern, pattern, pattern, pattern))

    rows = cursor.fetchall()
    colnames = [desc[0] for desc in cursor.description]

    albums = []

    for row in rows:
        album =  dict(zip(colnames, row))
        album_id = album["album_id"]

        cursor.execute("""
            SELECT naziv_pjesme, trajanje_minute, redni_broj
            FROM songs
            WHERE album_id = %s
            ORDER BY redni_broj;""", (album_id,))

        songs_rows = cursor.fetchall()
        album["songs"] = [
             {
            'naziv_pjesme': s[0],
            'trajanje_minute':float(s[1]),
            'redni_broj': s[2]
             }
            for s in songs_rows
        ]

        albums.append(album)


    cursor.close()
    db.close()
    return albums

