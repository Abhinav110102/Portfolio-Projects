import pypyodbc as odbc # pip install pypyodbc
import pandas as pd


DRIVER_NAME = 'ODBC Driver 17 for SQL Server'
SERVER_NAME = 'LAPTOP-OUFF8IEA'
DATABASE_NAME ='SQLtoPowerbi'

connection_string = f"""
    DRIVER={{{DRIVER_NAME}}};
    SERVER={SERVER_NAME};
    DATABASE={DATABASE_NAME};
    Trusted_Connection=yes;
"""

conn = odbc.connect(connection_string)
print("✅ Connection successful:", conn)
# Print data from connection in sql server
# cursor = conn.cursor()
# cursor.execute("SELECT TOP 100 * FROM Raw_Data_GDP")

# for row in cursor.fetchall():
#     print(row)

# cursor.close()
# conn.close()

# Makes a Data Frame
query = "SELECT TOP 100 * FROM Raw_Data_GDP"
df = pd.read_sql(query, conn)
print(df.head())