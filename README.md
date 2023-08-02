# Platformatic Demo Runtime API

The Platformatic demo runtime API used to practice and test various options and setups.

Consists of - 

- Platformatic Runtime
- Platformatic Composer service
- Platformatic DB website service (PostgreSQL)
- Platformatic DB membership service (PostgreSQL)

## Setup

1. Install dependencies:

```bash
pnpm install
```

2. Create `.env` files for each service:

```bash
pnpm run -r configure
```

3. Start the RDBMS for the PostgreSQL database using the docker provided script.

```bash
docker compose -f docker-compose-apple-silicon.yml up
````

4. Create a database for each service that has a database. Remember to update the `.env` to use the name of the database you created for each service.

```console
DATABASE_URL=postgres://postgres:postgres@127.0.0.1:5432/<YOUR_DB_NAME>
```

5. Apply migrations for all database services:

```bash
pnpm run -r migrate
```

6. Seed the data for the website-service. Run the file in your SQL Admin console e.g. TablePlus

```
./services/website-service/001-seed-data.sql
```

7. Seed the data for the membership-service. Run the file in your SQL Admin console e.g. TablePlus

```
./services/membership-service/001-seed-data.sql
```

8. Run the Runtime app with:

```bash
pnpm start
```
## Contributors

- [Wayne Gibson](https://github.com/waynegibson)
