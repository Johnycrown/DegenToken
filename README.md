# DegenToken
**Project Overview**

**DegenToken** is an ERC20 token designed to reward players in Degen Gaming's in-game ecosystem. Players can earn these tokens through gameplay and exchange them for various in-game rewards. Built on the Avalanche blockchain, the token offers fast, low-fee transactions, enabling seamless trading and item purchases among players.


## Description

The DegenToken smart contract powers the in-game economy for Degen Gaming. Players can accumulate tokens through gameplay and redeem them for items in the in-game store, such as NFTs and merchandise. The token also facilitates peer-to-peer trading, enhancing player interaction and game retention. Built on the Avalanche blockchain, the contract utilizes OpenZeppelin’s ERC20 standard to ensure robust and secure functionality.

**Key Features**:

  * Mint and burn tokens
  * Trade tokens between players
  * Redeem tokens for in-game rewards
  * View available store items and their prices

## Getting Started

**Installing**
1. Clone this repository:
bash
Copy code
git clone https://github.com/your-repo/DegenToken.git
2. cd DegenToken
**Install dependencies**:

type this on your terminal to install the necessary dependencies:   npm install
Ensure you have a valid Avalanche blockchain setup or use a testnet like Fuji.
Modifications
Modify the store items and prices by editing the store mapping in the DegenToken.sol file.


### Installing

* How/where to download your program
* Any modifications needed to be made to files/folders

### Executing program

**Deploy the contract**

 **Compile the smart contract:**
run the following command
1. npx hardhat compile
Deploy the contract to Avalanche or another supported blockchain:

2. npx hardhat run scripts/deploy.js --network fuji


## Help

If you encounter gas limit issues, you may need to increase the gas limit for specific transactions. This can be done in your deployment settings or when interacting with the contract.

Example error: MCOPY opcode invalid Fix: Ensure correct memory allocation when dealing with dynamic arrays.

Run this for more info 
* npx hardhat help


## Authors

Name: Johnycrown
Email: oladejijohn60@gmail.com

## License

This project is licensed under the [NAME HERE] License - see the LICENSE.md file for details
