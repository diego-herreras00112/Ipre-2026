# Ipre-2026

nose porque mi computador no encuentra el path de psql debe usar psqlf


## Preparar archivos

0. Tener los archivos correctos en los lugares correctos

1. correr script.py

2. correr add_references.py


## Poblar la base de datos
0. Ir a la carpeta del proyecto:
```powershell
cd "C:\Users\Lenovo\Desktop\Universidad 5to año\9no semestre\ipre\Ipre-2026\sql"
```

1. Crear la base de datos:
```powershell
psql -U postgres -c "CREATE DATABASE ppi_bdd;"
```

2. Generar los CSV normalizados:
```powershell
python normalizar_csv.py
```

3. Crear las tablas:
```powershell
psql -U postgres -d ppi_bdd -f crear_base_datos.sql
```

4. Poblar la base de datos:
```powershell
psql -U postgres -d ppi_bdd -f poblar_base_datos.sql
```

5. Verificar los datos:
```powershell
psql -U postgres -d ppi_bdd -f verificar_base_datos.sql
```


