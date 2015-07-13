# API for California State Code

This is an API for the California state code that is available as JSON. Currently the state of California makes it difficult to access the laws programmatically [(here is a first pass at scraping to get the data)](https://github.com/tylerpearson/state-code-scrapers/blob/master/ca/scrape.rb), so this is an attempt at making that easier.

IANAL, so if you have ideas on adjusting the API structure to better match the structure of state code and make it easier to use, please feel free to add an issue.

## Endpoints

### Codes

A list of codes is available at https://api.calilaws.com/v1/codes

### Sections

A list of sections of state code is available at https://api.calilaws.com/v1/sections.

The laws can be filtered by `code`, `division`, `chapter`, and `article` by passing it along as parameters in the URL. An example would be https://api.calilaws.com/v1/sections?code=ELEC&division=1. There is information on pagination in `meta` in the JSON response.

For a direct link to the JSON for a law, pass the id in the URL. For example https://api.calilaws.com/v1/sections/ELEC1500.20048177

### Search

Search the state code with `https://api.calilaws.com/v1/search/<search term>`. For example https://api.calilaws.com/v1/search/landlord. The search is setup with Elasticsearch.

## Database setup

### Locally

There is a MySQL database of California state codes available through FTP at ftp://www.leginfo.ca.gov/pub/bill/. Inside the directory are [instructions on importing the tables](https://s3.amazonaws.com/cali-laws/pubinfo_Readme.pdf) that are needed.

Here's a [direct link to a dump of the imported and converted MySQL database](https://s3.amazonaws.com/cali-laws/calaws.mysql) that I put up on S3 if you prefer not to deal with that. It's for the 2015 state code with a last modified listed as June 2015.

The Elasticsearch index can be imported with `Section.import`.

### Heroku

The database can be converted to Postgres for easy installation on Heroku. One option is to dump the database and convert with [Lanyrd's MySQL to PostgreSQL conversion script](https://github.com/lanyrd/mysql-postgresql-converter).

- `mysqldump --compatible=postgresql --default-character-set=utf8 -r calaws.mysql -u root capublic`
- `python dbconverter.py calaws.mysql calaws.psql`

It can be loaded from a local dump with `heroku pg:psql < db-dumps/calaws.psql`. You'll likely need to comment out the creation of the `schema_migrations` table.

Populate Elasticsearch with `heroku run bundle exec rake environment elasticsearch:import:model CLASS='Section' FORCE=true`.

## Next steps

Things that can be done next:

- Build a UI so it can be browsed online as an alternative to the official [California Legislative Information](http://leginfo.legislature.ca.gov/faces/codes.xhtml) site.
- Automate updates with the latest laws. This would be downloading from FTP, converting, and uploading.
