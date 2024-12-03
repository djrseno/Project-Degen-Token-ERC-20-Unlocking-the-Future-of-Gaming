// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "hardhat/console.sol";

contract DegenGamingToken is ERC20, Ownable {
    struct Item {
        string name;
        uint256 price;
        uint256 stock;
    }

    mapping(uint256 => Item) private storeItems;
    uint256 private itemCounter;

    event ItemAdded(uint256 indexed itemId, string name, uint256 price, uint256 stock);
    event ItemRedeemed(address indexed player, uint256 indexed itemId, string itemName);
    event TokensBurned(address indexed account, uint256 amount);

    constructor() ERC20("DegenGaming Token", "DGT") Ownable(msg.sender) {
        _addItem("DegenGaming Golden Ticket", 1000, 100);
        _addItem("DegenGaming Mystery Box", 200, 200);
        _addItem("DegenGaming XP Boost", 100, 300);
    }

    // Mint new tokens to a specified address
    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    // Burn tokens from the caller's account
    function burn(uint256 amount) external {
        uint256 burnAmount = amount;
        _burn(msg.sender, burnAmount);
        emit TokensBurned(msg.sender, burnAmount);
    }

    // Redeem an item using tokens
    function redeemItem(uint256 itemId) external {
        require(itemId < itemCounter, "Invalid item ID");
        Item storage item = storeItems[itemId];
        require(item.stock > 0, "Item out of stock");
        uint256 price = item.price;
        require(balanceOf(msg.sender) >= price, "Insufficient token balance");

        _burn(msg.sender, price);
        item.stock -= 1;

        emit ItemRedeemed(msg.sender, itemId, item.name);
    }

    // Transfer tokens to another address
    function transferTokens(address to, uint256 amount) external returns (bool) {
        return transfer(to, amount);
    }

    // Get the token balance of an account
    function checkBalance(address account) external view returns (uint256) {
        return balanceOf(account);
    }

    // Internal function to add a new item to the store
    function _addItem(string memory name, uint256 price, uint256 stock) internal {
        storeItems[itemCounter] = Item(name, price, stock);
        emit ItemAdded(itemCounter, name, price, stock);
        itemCounter++;
    }
}