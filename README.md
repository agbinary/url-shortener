# Url Shortener

Short a url given.

**Note:** I recommend use `localhost:3000` as main port, as it is configured this way in the environment files.

## Setup

```
git clone git@github.com:angela4713/content-indexer.git
```

## Run bundle

```
bundle install
```

## Tests

Run all the tests

```
bundle exec rspec
```

## Usage

Run the application

```
rails s
```

## Methods

### create short url

Saves the original Url and creates a short url.

** Endpoint: **

`POST /api/v1/urls/shorten`

** Request example: **

```rb
{
  "url": {
    "original": "https://github.com/rspec/rspec-rails"
  }
}
```

** Response example: **

```
{
  "url": {
    "original": "https://github.com/rspec/rspec-rails",
    "shortened": "http://localhost:3000/DfHQoDV"
  }
}
```

### open short url

Receive the short url and open the original one.
** Endpoint: **

`GET :shortened_url`

** Response: **

Original Website.
