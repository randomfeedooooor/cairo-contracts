# cairo-contracts

Contracts for the randomfeedooooor verifier

## Local Development

### Prerequisites

1. Install [Python](https://www.python.org/downloads/)
1. Install [Poetry](https://python-poetry.org/)
1. Clone this repo

### Helpful Commands

```shell
# Activate a Poetry virtual environment
poetry shell

# Install dependencies
poetry install

# Optional update openzeppelein contracts
poetry update openzeppelin-cairo-contracts

# Compile all contracts
nile compile

# Deploy proxy
nile deploy proxy --alias proxy --network goerli
```
