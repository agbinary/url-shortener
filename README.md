# Url Shortener

Short a url given.

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
    "original": "fgfdshdffsdfg"
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
