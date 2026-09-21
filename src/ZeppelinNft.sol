// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract ZeppelinNft is ERC721 {
    string private constant _name = "ZeppelinNft";
    string private constant _symbol = "ZNFT";
    uint256 private sTokenCounter;
    mapping(uint256 => string) private sTokenIdToUri;

    constructor() ERC721(_name, _symbol) {
        sTokenCounter = 0;
    }

    function mint(string memory tokenUri) public {
        sTokenIdToUri[sTokenCounter] = tokenUri;
        _safeMint(msg.sender, sTokenCounter);
        sTokenCounter++;
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        return sTokenIdToUri[tokenId];
    }
}
