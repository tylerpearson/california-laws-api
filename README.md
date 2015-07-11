# API for California State Code

This is an API for the California state code that is available as JSON. Currently the state of [California mades it difficult to access the laws programmatically](https://github.com/tylerpearson/state-code-scrapers/blob/master/ca/scrape.rb), so this is an attempt at making that easier.

## Endpoints

### Codes

A list of codes is available at http://www.calilaws.com/api/v1/codes

### Sections

A list of sections of state code is available at http://www.calilaws.com/api/v1/sections.

The laws can be sorted by `code`, `division`, `chapter`, and `article` by passing it along as parameters in the URL. An example would be http://www.calilaws.com/api/v1/sections?code=ELEC&division=1. There is information on pagination in `meta` in the JSON response.

To direct link to the JSON for a law, pass the id in the URL. For example http://www.calilaws.com/api/v1/sections/ELEC1500.20048177

## Database setup

### Locally

There is a MySQL database of California state codes available through FTP at ftp://www.leginfo.ca.gov/pub/bill/. There are [instructions on importing the tables](https://s3.amazonaws.com/cali-laws/pubinfo_Readme.pdf) in the zip.

### Heroku

The database can be converted to Postgres for easy installation on Heroku. One option is to dump the database and convert with [Lanyrd's MySQL to PostgreSQL conversion script](https://github.com/lanyrd/mysql-postgresql-converter).

- `mysqldump --compatible=postgresql --default-character-set=utf8 -r calaws.mysql -u root capublic`
- `python dbconverter.py calaws.mysql calaws.psql`

It can be loaded from a local dump with `heroku pg:psql < db-dumps/calaws.psql`. You'll likely need to comment out the creation of the `schema_migrations` table.


