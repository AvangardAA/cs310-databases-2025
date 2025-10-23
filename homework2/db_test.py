import duckdb
import time

con = duckdb.connect(database=":memory:")

with open("DDL/create_tables.sql", "r") as f:
	con.execute(f.read())

with open("DML/insert_data.sql", "r") as f:
	con.execute(f.read())

tables = con.execute("SELECT table_name FROM information_schema.tables WHERE table_schema='main';").fetchall()
for (table,) in tables:
	cnt = con.execute(f"SELECT COUNT(*) FROM {table};").fetchone()[0]
	print(f"{table}: {cnt:,}")

con.close()
