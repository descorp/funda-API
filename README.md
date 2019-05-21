[![codebeat badge](https://codebeat.co/badges/fc671989-7aeb-4b3b-a5fb-9d918fcd0e54)](https://codebeat.co/projects/github-com-descorp-funda-api-master)

<img src="https://assets.fstatic.nl/master_2282/assets/components/logo/fundawonen-logo.svg" alt="logo" width="250"/>

# funda-API
API for Funda.nl

Client fot Funda Partner API

## Structure

Solution spited into 2 projects + Mac Consol app :

### ApiProvider (iOS and Mac)
Library to work with Json API's. Providers convenient and secure way to access HTTP APIs

### FundaApi (iOS and Mac)
Wrapper based on ApiProvider to implement Funda API. 
Contains DTO, Endpoint and Tests. 
DTOs are generated via https://app.quicktype.io/. 
URL and API_KEY are set via the configuration file in FundaConsole app.

### FundaConsole
Mac Console application to performe search and statistic analysis.
Consis of two assignments executed sequencialy
Uses Promises under the hood

#### Output example
      
       = = = = = 
      Top makelaars by objects listed for sale (Amsterdam):
      #1 Broersma Makelaardij - 111
      #2 Makelaardij Van der Linden Amsterdam - 87
      #3 ERA Van De Steege - 84
      #4 Eefje Voogd Makelaardij - 84
      #5 Hallie & Van Klooster Makelaardij - 81
      #6 Makelaarsland - 75
      #7 Hoekstra en van Eck Amsterdam West - 68
      #8 Ramón Mossel Makelaardij o.g. B.V. - 60
      #9 Hoekstra en van Eck Amsterdam Noord - 52
      #10 De Graaf & Groot Makelaars - 45

## How to run

* clone solution
* replace {API_KEY} in config.info with your API Key
* Run the console app

Execution time ~3 minutes

## Known bugs:

Console App does not mitigate the first request, so if the very first request didn't pass throttling it will fail the whole assignment
