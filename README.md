[![codebeat badge](https://codebeat.co/badges/fc671989-7aeb-4b3b-a5fb-9d918fcd0e54)](https://codebeat.co/projects/github-com-descorp-funda-api-master)

<img src="https://assets.fstatic.nl/master_2282/assets/components/logo/fundawonen-logo.svg" alt="logo" width="250"/>

# funda-API
API for Funda.nl

Client fot Funda Partner API

## Structure

Solution spited into 2 projects + Swift Playground :

### ApiProvider (iOS and Mac)
Library to work with Json API's. Providers convenient and secure way to access HTTP APIs

### FundaApi (iOS and Mac)
Wrapper based on ApiProvider to implement Funda API. 
Contains DTO, Endpoint and Tests. 
DTOs are generated via https://app.quicktype.io/. 
URL and API_KEY are set via the configuration file in FundaConsole app.

### FundaConsole
Mac Console application to complete the basic searching scenarios.
Both assignments executed sequencialy
Uses Promises under the hood

## How to run

* clone solution
* replace {API_KEY} in config.info with your API Key
* Run the console app

Execution time ~3 minutes
