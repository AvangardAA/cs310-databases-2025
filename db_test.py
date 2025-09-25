import duckdb

con = duckdb.connect(database=":memory:")
with open("DDL/create_tables.sql", "r") as f:
	con.execute(f.read())

# AN (25/09) Debug
# tables = con.execute("SELECT table_name FROM information_schema.tables WHERE table_schema='main';").fetchall()
#
# for table in tables:
#	print("-", table[0])
#

con.close()
