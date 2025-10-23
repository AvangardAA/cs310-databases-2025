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

con.execute("CREATE INDEX IF NOT EXISTS idx_orders_date ON orders(order_date);")
con.execute("CREATE INDEX IF NOT EXISTS idx_products_category ON products(category);")

with open("DML/queries.sql", "r") as f:
	script = f.read()
	queries = [q.strip() for q in script.split(';') if q.strip()]

non_opt_query = queries[0]
opt_query = queries[1]

def run(l, query):
	print(f"\n{l.upper()}")
	s = time.time()
	result = con.execute(query).fetchdf()
	dur = time.time() - s
	print(f"{l} time: {dur:.3f}s, rows={len(result)}")
	return result, dur

def explain(l, query, analyze=False):
	print(f"\nEXPLAIN {'ANALYZE' if analyze else ''} {l.upper()}")
	explain_q = f"EXPLAIN {'ANALYZE' if analyze else ''} {query}"
	plan = con.execute(explain_q).fetchall()
	for row in plan:
		print(row[0])

explain("Non-opt", non_opt_query)
explain("Optimized", opt_query)

non_opt_res, t1 = run("non-opt", non_opt_query)
opt_res, t2 = run("optimized", opt_query)

if non_opt_res.equals(opt_res):
	print("Result equals")
else:
	print("Result differ")

print(f"Non-opt {t1:.3f}s, Optimized {t2:.3f}s, sped: {t1/t2:.2f}x")

explain("Non-opt", non_opt_query, analyze=True)
explain("Optimized", opt_query, analyze=True)

con.close()

con.close()
