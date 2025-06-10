// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NorkToken is ERC20, Ownable {
    constructor() ERC20("NorkToken", "NORK") {
        // Mint 1,000,000,000 tokens al creador
        _mint(msg.sender, 1_000_000_000 * 10 ** decimals());
    }

    // Función para recompensar a clientes (solo el dueño puede ejecutarla)
    function rewardCustomer(address to, uint256 amount) external onlyOwner {
        _transfer(owner(), to, amount * 10 ** decimals());
    }

    // Función para quemar tokens usados
    function burn(uint256 amount) external onlyOwner {
        _burn(owner(), amount * 10 ** decimals());
    }
}
