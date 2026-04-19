import pandas as pd

print("Cargando datos...")

# 1. SOLUCIÓN DE MEMORIA: Cargar solo las columnas necesarias del archivo pesado
columnas_all = ['Slug', 'Explanation', 'Formalization_latex', 'Formalization_fp']
all_data = pd.read_csv('data/final_all_data.csv', sep='\t', usecols=columnas_all)

# 2. Cargar el archivo limpio completo
clean_data = pd.read_csv('data/final_data.csv', sep='\t')

print("\n--- RESUMEN DE DATOS ---")
print(f"Indicadores totales encontrados (final_all_data): {len(all_data)}")
print(f"Indicadores 100% limpios y completos (final_data): {len(clean_data)}")
print("------------------------\n")

# Encontrar los indicadores que "se perdieron" en la limpieza
df_perdidos = all_data[~all_data['Slug'].isin(clean_data['Slug'])]

print("\n--- ANALISIS DE DATOS PERDIDOS ---")
print(f"Total de indicadores descartados: {len(df_perdidos)}")

print("\nDe donde viene la falta de informacion de estos descartados")
print(f"1. No se encontro su Explicacion: {df_perdidos['Explanation'].isnull().sum()}")
print(f"2. No se encontro su Formula Formal: {df_perdidos['Formalization_latex'].isnull().sum()}")
print(f"3. No se encontro su Formula para Ingenieros: {df_perdidos['Formalization_fp'].isnull().sum()}")

# Reutilizamos clean_data en lugar de volver a leer el archivo
df = clean_data 

print("\n--- COLUMNAS DEL ARCHIVO LIMPIO ---")
for i, col in enumerate(df.columns, 1):
    print(f"{i}. {col}")
    
print("\n--- ANALISIS DE CALIDAD: BUSCANDO VACIOS EN LOS LIMPIOS ---")

columnas_con_problemas = 0

for col in df.columns:
    # 1. Contar valores Nulos reales (NaN)
    nulos = df[col].isna().sum()
    
    # 2. Contar strings vacíos o que son puros espacios invisibles (" ", "   ")
    espacios = df[col].apply(lambda x: str(x).strip() == "" if pd.notna(x) else False).sum()
    
    # 3. Contar guiones aislados
    guiones = df[col].apply(lambda x: str(x).strip() == "-" if pd.notna(x) else False).sum()
    
    total_vacios = nulos + espacios + guiones
    
    if total_vacios > 0:
        print(f"[ALERTA] {col}: Tiene {total_vacios} datos faltantes (Nulos: {nulos} | Espacios: {espacios} | Guiones: {guiones})")
        columnas_con_problemas += 1
    else:
        print(f"[OK] {col}: 100% completa.")

print(f"\nResumen de calidad: {len(df.columns) - columnas_con_problemas} columnas perfectas, {columnas_con_problemas} con datos faltantes.")
print("---------------------------------------------------------------\n")