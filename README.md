## Database Migration in GO
- using **goose** (https://github.com/pressly/goose)

### Working with goose

#### Create a new migration file
> goose -dir=migrations create file_name sql

The new migration file gets created inside migrations folder with provided file_name and the current timestamp.

#### Other aviable commands:
    up                   Migrate the DB to the most recent version available
    up-by-one            Migrate the DB up by 1
    up-to VERSION        Migrate the DB to a specific VERSION
    down                 Roll back the version by 1
    down-to VERSION      Roll back to a specific VERSION
    redo                 Re-run the latest migration
    reset                Roll back all migrations
    status               Dump the migration status for the current DB
    version              Print the current version of the database
    create NAME [sql|go] Creates new migration file 
    fix                  Apply sequential ordering to migrations


#### Some Examples showing how to run above commands:

**up**
Apply all available migrations.
> goose -dir=migrations mysql "db_user:db_password@/db_name?parseTime=true" up

**up-to**
Migrate up to a specific version.
> goose -dir=migrations mysql "db_user:db_password@/db_name?parseTime=true" up-to 2021081111382

**up-by-one**
Migrate up a single migration from the current version
> goose -dir=migrations mysql "db_user:db_password@/db_name?parseTime=true" up-by-one


### Issues with goose
**Up command don't run all pending migrations**
If there is a migration that is older than the current version then those pending migration will not gets migrated when up.

##### How to run pending migration?
1. Down the migration to the version number before the pending migration and then up migration.
But this will cause loss of data from database.
2. From the `goose_db_version` table, delete all the versions data after the pending migration file and then up migration.