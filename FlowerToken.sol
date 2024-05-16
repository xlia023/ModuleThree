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