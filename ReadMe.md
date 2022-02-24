- [Description](#description)
  - [Requirements](#requirements)
  - [Products](#products)
    - [Event Hub Namespace Power Down](#event-hub-namespace-power-down)
  - [Useful Code](#useful-code)
  - [Links](#links)
  - [Acknowledgements](#acknowledgements)

# Description

Suite of power down and cost saving functions for azure.

## Requirements

- Must created managed identity
- Must give managed identity permissions on resources its going to interact with
- [Dot Net Core for local dev](https://dotnet.microsoft.com/en-us/download/dotnet/3.1)

## Products

### Event Hub Namespace Power Down

This will trigger on a schedule.
It will gather all event hub namespaces in the subscription.
It will add a tag of "MinPower:1" to evernt hub namespaces if the tag is not present.
It will then scale down the event hub namespace to the value in the MinPower tag.

## Useful Code

```ps1
Import-Module Az.Functions
(find-module Az.Functions).dependencies
Get-Command -Module Az.Functions
Get-AzFunctionApp
Get-Help  New-AzFunctionApp  
```

Using core tools to create and run function.

```ps1
npm install -g azure-functions-core-tool
mkdir test
func init
func new
func start
## get the below from output of func start
http://localhost:7071/api/testtrig?name=griff
```

## Links

- [Nodist](https://github.com/nullivex/nodist)

## Acknowledgements

- [Event Hub Namespace Scale Link TJ Adisson](https://tjaddison.com/blog/2019/02/auto-scale-down-all-event-hub-namespaces-with-azure-functions/)
