// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract GibaNFT is ERC721URIStorage, Ownable {
    IERC20 public paymentToken;
    uint256 public price;
    uint256 public tokenCounter;

    constructor(address tokenAddress, uint256 _price) ERC721("GibaNFT", "GNFT") {
        paymentToken = IERC20(tokenAddress);
        price = _price;
        tokenCounter = 0;
    }

    function setPrice(uint256 _price) public onlyOwner {
        price = _price;
    }

    function mint(string memory tokenURI) public {
        require(paymentToken.transferFrom(msg.sender, owner(), price), "O pagamento falhou");
        _safeMint(msg.sender, tokenCounter);
        _setTokenURI(tokenCounter, tokenURI);
        tokenCounter++;
    }
}
