from pydantic.v1 import BaseModel


class Album(BaseModel):
    id: int
    naziv: str
    izvodjac: str
    godina: int
    zanr: str
    broj_pjesama: int
    trajanje_min: float
    izdavacka_kuca:int
    zemlja:int
    is_platinum:bool
    format: str


class Song(BaseModel):
    album_id: int
    naziv_pjesme: str
    trajanje_minute:float
    redni_broj:int

