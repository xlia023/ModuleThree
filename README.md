# Types of Functions Project: Create and Mint Token

## Overview
FlowerToken is a Solidity smart contract that implements an ERC20 token. It extends the functionality of the ERC20 standard token by providing additional features such as minting, burning, and ownership control.

## Getting Started

### To interact with the smart contract, you'll need:
An Ethereum smart contract development environment (such as Remix, Truffle, or Hardhat). An Ethereum wallet or client (like MetaMask) for testnet or mainnet deployment and communication with the contract. 

### Executing program
You can use Remix, an online Solidity IDE to run this program. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., FlowerToken.sol). Copy and paste the following code into the file:
 ```
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract FLowerToken is ERC20 {
    address private owner;
    
    constructor(string memory Name, string memory Symbol) ERC20(Name, Symbol) {
        owner = msg.sender;
        }
        
        modifier onlyOwner() {
            require(msg.sender == owner, "Only program owner can call this function");
            _;
        }

    //Mint function is restricted to the owner, allowing them to create new tokens for customer
    function mint(address account, uint256 amount) public onlyOwner {
        _mint(account, amount);
    }

    //Burn function used by customer to burn tokens
    function burn(uint amount) external {
        _burn(msg.sender, amount);
    }

    //Transfer function to alloww customer to transfer tokens
    function transfer(address to, uint256 amount) public override returns (bool) {
        return super.transfer(to, amount);
    }
    
    //transferfrom function to allow customer to approve spending tokens
    function transferFrom(address from, address to, uint256 amount) public override returns (bool) {
        return super.transferFrom(from, to, amount);
    } 
}
```

## Code Explanation
1. **Minting:**
   - The contract owner can call the `mint` function and supply the recipient account along with the quantity of tokens to be minted in order to mint new tokens.
2. **Burning:**
   - Token holders have the ability to burn their own tokens by invoking the `burn` function and providing the desired burn quantity.
3. **Transfers:**
   - Token holders can use the `transfer` function to send tokens to another address by giving it the recipient address and the quantity of tokens to send.
4. **Allowance and TransferFrom:**
- The `approve` function allows token holders to authorize another address to transfer tokens on their behalf.
- Using the `transferFrom` function, the authorized address can then move tokens from the token holder's account to another address.
