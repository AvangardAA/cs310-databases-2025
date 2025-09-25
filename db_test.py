import duckdb

con = duckdb.connect(database=":memory:")
with open("DDL/create_tables.sql", "r") as f:
	con.execute(f.read())

with open("DML/insert_data.sql", "r") as f:
	con.execute(f.read())


# AN (25/09) Debug
tables = con.execute("SELECT table_name FROM information_schema.tables WHERE table_schema='main';").fetchall()

for (table,) in tables:
	print(table)
	rows = con.execute(f"SELECT * FROM {table}").fetchall()
	columns = [d[0] for d in con.description]
	print(" | ".join(columns))

	for row in rows:
		print(" | ".join(str(v) for v in row))
	print(f"\n{"=" * 40}\n")


con.close()
