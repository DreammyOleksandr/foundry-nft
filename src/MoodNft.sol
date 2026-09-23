// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

enum Mood {
    HAPPY,
    SAD
}

contract MoodNft is ERC721 {
    string private constant _name = "MoodNft";
    string private constant _symbol = "MNFT";
    uint256 private sTokenCounter;
    mapping(uint256 => string) private sTokenIdToUri;
    string private sSadImageUri;
    string private sHappyImageUri;
    mapping(uint256 => Mood) private sTokenIdToMood;

    constructor(string memory happyImageUri, string memory sadImageUri) ERC721(_name, _symbol) {
        sTokenCounter = 0;
        sHappyImageUri = happyImageUri;
        sSadImageUri = sadImageUri;
    }

    function mint() public {
        _safeMint(msg.sender, sTokenCounter);
        sTokenCounter++;
    }

    function _baseURI() internal pure override returns (string memory) {
        return "data:application/json;base64,";
    }

    // I don't like this code with much encodings
    // It works good, but I want to think of cleaner approach.
    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        string memory imageUri;
        if (sTokenIdToMood[tokenId] == Mood.HAPPY) {
            imageUri = sHappyImageUri;
        } else {
            imageUri = sSadImageUri;
        }

        bytes memory encodedBytes = bytes(
            abi.encodePacked(
                '{"name":"',
                name(),
                '", "description":"An NFT that reflects the mood of the owner.", "attributes": [{"trait_type": "moodiness", "value": 100}], "image": "',
                imageUri,
                '"}'
            )
        );

        return string(abi.encodePacked(_baseURI(), Base64.encode(encodedBytes)));
    }

    function getTokenCounter() public view returns (uint256) {
        return sTokenCounter;
    }
}
