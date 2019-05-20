[![codebeat badge](https://codebeat.co/badges/fc671989-7aeb-4b3b-a5fb-9d918fcd0e54)](https://codebeat.co/projects/github-com-descorp-funda-api-master)

# funda-API
API for Funda.nl

Client fot Funda Partner API

## Structure

Solution spited into 2 projects + Swift Playground :

### ApiProvider
Library to work with Json API's. Providers convenient and secure way to access HTTP APIs

### FundaApi
Wrapper based on ApiProvider to implement Funda API. 
Contains DTO, Endpoint and Tests. 
DTOs are generated via https://app.quicktype.io/. 
URL and API_KEY are set via the configuration file.

### FundaPlayground
Swift playground to complete the basic searching scenarios.
Uses Promises under the hood

## How to run

* clone solution
* replace {API_KEY} in config.info with your API Key
* Run the app
