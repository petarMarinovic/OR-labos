from http.client import HTTPException
from fastapi import status

import psycopg2

def get_db_connection():

    try:
        return  psycopg2.connect(
        host="localhost",
        database="MusicAlbums",
        user="postgres",
        password="bazepodataka"
        )
    except Exception as e:
        raise HTTPException(status.HTTP_400_BAD_REQUEST,
                        detail=f"Database connection failed {e}")


