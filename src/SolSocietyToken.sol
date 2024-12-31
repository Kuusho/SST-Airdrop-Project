// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract SolSocietyToken is ERC20, Ownable {
    uint256 public constant MAX_SUPPLY = 1000000000 * 10 ** 18;

    /*
    * @param _name: The name of the token
    * @param _symbol: The symbol of the token
    * @param _decimals: The number of decimals for the token
    * @dev: The constructor initializes the token with a maximum supply of 1000000000 tokens
    */
    constructor(string memory _name, string memory _symbol, uint8 _decimals) ERC20("SolSocietyToken", "SST") Ownable(msg.sender) {
        _mint(msg.sender, 1000000000 * 10 ** _decimals);
    }

    /*
    * @param to: The address to mint the tokens to
    * @param amount: The amount of tokens to mint
    * @dev: The function allows the owner to mint tokens to an address
    */
    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    /*
    * @param from: The address to burn the tokens from
    * @param amount: The amount of tokens to burn
    * @dev: The function allows the owner to burn tokens from an address
    */
    function burn(address from, uint256 amount) external onlyOwner {
        _burn(from, amount);
    }
}

