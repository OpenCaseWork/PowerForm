# PowerForm

A powershell-based framework for managing cloud infrastructure, initially targeting Azure but with flexibility to support additional cloud providers.

## Why?
* Enormous population of experienced powershell developers
* Existing frameworks use custom definition languages, or traditional programming languages, which for various reasons are not ideally suited to the domain of cloud infrastructure management
* Absence of a way to easily apply standards and best practices
* We'd prefer not for everyone to need to re-invent the wheel

### Azure Specific
* AzModule provides the raw materials, but not a cohesive framework for working with resources
* PowerShell represents least-worst option among available alternatives (ARM, CLI, and PS)

## Design Goals
* Minimal overhead for simple scenarios, but provide tools to handle complex scenarios
* Provide default best-practice implementations that can be incorporated as-is
* Ability to store, retrieve, and analyze state, both deployment-defined and current "cloud state"

## Getting Started

TODO -
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

TODO -
What things you need to install the software and how to install them

```
Give examples
```

### Installing

TODO -
A step by step series of examples that tell you how to get a development env running

Say what the step will be

```
Give the example
```

And repeat

```
until finished
```

End with an example of getting some data out of the system or using it for a little demo

## Running the tests

Explain how to run the automated tests for this system

### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

## Deployment

TODO -
Add additional notes about how to deploy this on a live system

## Built With

* [PowerShell](https://docs.microsoft.com/en-us/powershell/scripting/overview?view=powershell-7)  

## Contributing

TODO

## Versioning

TODO

## Authors

* **Zach Harris** - [zharris23](https://github.com/zharris23)
* **Keith Katsma** - [kmkatsma](https://github.com/kmkatsma)

See also the list of [contributors](https://github.com/OpenCasework/PowerForm/contributors) who participated in this project.

## License

This project is licensed under the Apache 2.0 License - see the [LICENSE](LICENSE) file for details

## Acknowledgments

* TerraForm and Pulumi, for concepts of what cloud infrastructure management can be
