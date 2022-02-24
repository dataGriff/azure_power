- [Description](#description)
  - [Requirements](#requirements)
  - [Products](#products)
    - [Event Hub Namespace Power Down](#event-hub-namespace-power-down)
  - [Acknowledgements](#acknowledgements)

# Description

Suite of power down and cost saving functions for azure.

## Requirements

- Must created managed identity
- Must give managed identity permissions on resources its going to interact with

## Products

### Event Hub Namespace Power Down

This will trigger on a schedule.
It will gather all event hub namespaces in the subscription.
It will add a tag of "MinPower:1" to evernt hub namespaces if the tag is not present.
It will then scale down the event hub namespace to the value in the MinPower tag.

## Acknowledgements

- [Event Hub Namespace Scale Link TJ Adisson](https://tjaddison.com/blog/2019/02/auto-scale-down-all-event-hub-namespaces-with-azure-functions/)
