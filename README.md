# FundMe Solidity Foundry Study Project

![FundMe](https://img.shields.io/badge/FundMe-Solidity%20Smart%20Contract-brightgreen)

👋 Welcome to the FundMe Solidity Foundry Study Project GitHub repository! 🚀 This repository contains a smart contract written in Solidity that empowers crowdfunding with Ethereum.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Usage](#usage)
  - [Installation](#installation)
  - [Getting Started](#getting-started)
  - [Commands](#commands)
- [Test Coverage](#test-coverage)

## Introduction

The **FundMe** smart contract facilitates crowdfunding by allowing users to contribute funds and become backers of a project. It enforces a minimum contribution amount, provides currency conversion, and allows the contract owner to manage funds.

## Features

- 🌟 Crowdfunding: Contribute funds to support projects.
- 💰 Minimum Contribution: Requires a minimum contribution of 5 ETH (or equivalent in USD).
- 💱 Currency Conversion: Utilizes the PriceConvertor library for accurate currency conversion.
- 💸 Withdrawal: Contract owner can withdraw funds from the contract.
- 🔐 Access Control: Certain functions can only be executed by the contract owner.
- 📋 Version Information: Get the version of the PriceFeed aggregator.

## Usage

### Installation

Welcome to the documentation for the FundMe Solidity Foundry Study Project! This guide will walk you through various commands and actions you can perform using the Solidity smart contract.

### Getting Started

To begin using the FundMe Solidity Foundry Study Project, make sure you have the necessary tools and dependencies installed.

### Commands

- `forge init`: Initialize a new foundry project.
- `forge fmt`: Auto format the code.
- `forge compile`: Compile a smart contract.
- `anvil`: Start a private chain.
- `forge create SimpleStorage --interactive`: Manually deploy a smart contract.
- `forge script script/DeploySimpleStorage.s.sol --rpc-url $RPC_URL --broadcast --private-key $PRIVATE_KEY`: Deploy a smart contract with a script.
- `cast send smart_contract_address "function_name(data_type)" data_value --rpc-url $RPC_URL --private-key $PRIVATE_KEY`: Send a transaction.
  Example: `cast send 0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0 "store(uint256)" 123 --rpc-url $RPC_URL --private-key $PRIVATE_KEY`
- `cast call smart_contract_address "function_name(data_type)"`: Call a function to retrieve value.
  Example: `cast call 0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0 "retrieve()"`
- `cast --to-base hex_value dec`: Convert hex data to decimal.
  Example: `cast --to-base 0x000000000000000000000000000000000000000000000000000000000000007b dec`
- `forge install package_name@version --no-commit`: Install packages and dependencies.
  Example: `forge install smartcontractkit/chainlink-brownie-contracts@0.6.1 --no-commit`
- `forge test --match-test test_function_name --fork-url url`: Run a particular test.
  Example: `forge test --match-test testPriceFeedVersionIsAccurate --fork-url $SEPOLIA_RPC_URL`
- `forge coverage`: Check test coverage of the smart contract.
- `forge snapshot`: Check gas usage.
- `make deploy`: Deploy this project to the Anvil local chain.

## Test Coverage

Here's the test coverage summary for the FundMe Solidity smart contract:

```plaintext
| File                           | % Lines        | % Statements   | % Branches    | % Funcs       |
|--------------------------------|----------------|----------------|---------------|---------------|
| script/DeployFundMe.s.sol      | 0.00% (0/6)    | 0.00% (0/9)    | 100.00% (0/0) | 0.00% (0/1)   |
| script/HelperConfig.s.sol      | 0.00% (0/11)   | 0.00% (0/16)   | 0.00% (0/2)   | 0.00% (0/3)   |
| script/Interactions.s.sol      | 66.67% (8/12)  | 57.14% (8/14)  | 100.00% (0/0) | 50.00% (2/4)  |
| src/FundMe.sol                 | 94.12% (16/17) | 94.74% (18/19) | 75.00% (3/4)  | 85.71% (6/7)  |
| src/PriceConvertor.sol         | 0.00% (0/5)    | 0.00% (0/9)    | 100.00% (0/0) | 0.00% (0/2)   |
| test/moks/MockV3Aggregator.sol | 6.67% (1/15)   | 6.67% (1/15)   | 100.00% (0/0) | 20.00% (1/5)  |
| Total                          | 37.88% (25/66) | 32.93% (27/82) | 50.00% (3/6)  | 40.91% (9/22) |


Feel free to explore and experiment with the FundMe Solidity Foundry Study Project using these commands. If you have any questions or need assistance, don't hesitate to reach out.

Happy coding! 🚀🛠️