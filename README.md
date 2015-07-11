# API for California State Code

This is an API for the California state code. More info on setup coming soon.

## Database setup

### Locally

There is a MySQL database of California state codes available through FTP at ftp://www.leginfo.ca.gov/pub/bill/. There are [instructions on importing the tables](https://s3.amazonaws.com/cali-laws/pubinfo_Readme.pdf) in the zip.

### Heroku

The database can be converted to Postgres for easy installation on Heroku. One option is to dump the database and convert with [Lanyrd's MySQL to PostgreSQL conversion script](https://github.com/lanyrd/mysql-postgresql-converter) and upload to S3.

- `mysqldump --compatible=postgresql --default-character-set=utf8 -r calaws.mysql -u root capublic`
- `python dbconverter.py calaws.mysql calaws.psql`


