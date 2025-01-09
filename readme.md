## Using with PostgreSQL 16

1 - Install PostgreSQL: Version 16 or newer is required.

2 - Install python3

3 - Install pip (python package manager)

4 - Install PL/Python PostgreSQL extension.

5 - Install pgvector PostgreSQL extension.

6 - Add OPENAI_API_KEY environment variable.

7 - Then finnaly, install pgai PostgreSQL extension.

8 - Run following commands on PostgreSQL database


```sql
create extension if not exists plpython3u;
create extension if not exists vector;
create extension if not exists ai;
```

## Using with TimescaleDB

1 - Instal TimescaleDB.

2 - Add OPENAI_API_KEY environment variable.

3 - Run following commands on TimescaleDB database


```sql
create extension if not exists ai cascade;
```