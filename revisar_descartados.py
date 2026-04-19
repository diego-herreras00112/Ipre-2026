import pandas as pd

# 1. Leer los datos
all_data = pd.read_csv('data/final_all_data.csv', sep='\t')
clean_data = pd.read_csv('data/final_data.csv', sep='\t')

# 2. Aislar los 31 perdidos
df_perdidos = all_data[~all_data['Slug'].isin(clean_data['Slug'])].copy()

# 3. Ordenarlos alfabéticamente para que sea más fácil leerlos
df_perdidos = df_perdidos.sort_values(by='Name')

# 4. Seleccionar solo las columnas que importan para auditar
columnas_revision = ['Name', 'Explanation', 'Formalization_latex', 'Formalization_fp']
df_auditoria = df_perdidos[columnas_revision]

# 5. MAGIA PARA EXCEL: Guardar separado por punto y coma (;) y con codificación 'utf-8-sig'
ruta_salida = 'data/los_31_descartados.csv'
df_auditoria.to_csv(ruta_salida, sep=';', index=False, encoding='utf-8-sig')

print(f"\n¡Listo! Se ha creado el archivo: {ruta_salida}")
print("Ve a la carpeta 'data' y haz doble clic en 'los_31_descartados.csv'.")
print("Excel lo abrirá perfectamente ordenado en columnas.\n")


