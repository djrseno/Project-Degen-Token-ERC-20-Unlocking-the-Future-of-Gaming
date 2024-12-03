# DegenGaming Token (DGT) - Smart Contract

This is a smart contract for the DegenGaming Token (DGT) built on Ethereum-compatible blockchains using Solidity. The token is designed for in-game usage in Degen Gaming's ecosystem, where players can earn tokens, redeem them for in-game items, transfer tokens between players, and burn tokens when no longer needed.

## Description

The DegenGaming Token (DGT) contract is a custom ERC-20 token designed for use in the Degen Gaming ecosystem. Players can earn tokens by participating in the game and then use them for in-game purchases, such as items and boosts. The contract includes several key features:
* Minting: The owner can mint new tokens to players' addresses.
* Burning: Players can burn their tokens when they no longer need them.
* Redeeming: Players can redeem tokens for in-game items.
* Transfers: Tokens can be transferred between players.
The contract also features a simple item store where players can use their tokens to redeem various in-game items.

## Getting Started

### Installing

1. Download the project:
* You can copy the Solidity code and paste it into any Solidity-compatible IDE, such as Remix.
* Alternatively, if you are working with a local setup, download the project and place it in your Solidity workspace.

2. Set up a development environment:
* Install Node.js for managing dependencies.
* Install the Hardhat framework for local Ethereum development.
* Use Solidity version ^0.8.26 (or compatible versions).
  
3. Modifications:
* Modify the token name, abbreviation, item prices, or stocks by adjusting the contract variables.

### Executing program

1. Deploy the contract:
* Compile the smart contract using a Solidity IDE or your local compiler.
* Deploy the contract to a blockchain (either a testnet or a live network like Avalanche).

2. Mint tokens:
* The owner can mint tokens to any address by calling the mint(address to, uint256 amount) function.

3. Burn tokens:
* Players can burn tokens from their own account by calling the burn(uint256 amount) function. This reduces their token balance.

4. Redeem items:
* Players can redeem items using tokens by calling the redeemItem(uint256 itemId) function.

5. Transfer tokens:
* Players can transfer tokens to other players by calling the transferTokens(address to, uint256 amount) function.

6. Check token balance:
* Players can check their token balance using the checkBalance(address account) function.

## Help

Common issues:
* Insufficient balance: When trying to burn tokens, ensure that the address has enough balance to burn. 
The burn function will execute but will fail to change the balance if the balance is less than the burn amount.
* Correct contract version: Ensure you are using the Solidity compiler version ^0.8.26 to avoid compatibility issues.
  
If your program contains helper functions or error-handling mechanisms, you can check the documentation within the IDE for more information.

## Authors

Daniel Jude Seno - Contact via [GitHub](https://github.com/djrseno)
