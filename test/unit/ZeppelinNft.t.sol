// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.30;

import {Test} from "forge-std/Test.sol";
import {DeployZeppelinNft} from "script/DeployZeppelinNft.s.sol";
import {ZeppelinNft} from "src/ZeppelinNft.sol";

contract ZeppelinNftTest is Test {
    ZeppelinNft private nft;
    address private USER;

    function setUp() public {
        DeployZeppelinNft deployer = new DeployZeppelinNft();
        nft = deployer.run();
        USER = msg.sender;
    }

    function testNameIsCorrect() public view {
        string memory expected = "ZeppelinNft";
        string memory actualName = nft.name();
        assertEq(actualName, expected);
    }

    function testSymbolIsCorrect() public view {
        string memory expected = "ZNFT";
        string memory actualSymbol = nft.symbol();
        assertEq(actualSymbol, expected);
    }

    function testMintUpdatesBalance() public {
        uint256 expectedBalance = 1;

        vm.prank(USER);
        nft.mint("some_uri");
        uint256 actualBalance = nft.balanceOf(USER);

        assertEq(actualBalance, expectedBalance);
    }

    function testMintUpdatesCounter() public {
        uint256 expectedCounter = 1;
        string memory tokenUri = "some_uri";

        vm.prank(USER);
        nft.mint(tokenUri);
        uint256 actualCounter = nft.getTokenCounter();

        assertEq(actualCounter, expectedCounter);
    }

    function testTokenUriIsSetCorrectly() public {
        string memory expectedTokenUri = "some_uri";
        uint256 initialTokenId = 0;

        vm.prank(USER);
        nft.mint(expectedTokenUri);
        string memory actualTokenUri = nft.tokenURI(initialTokenId);

        assertEq(actualTokenUri, expectedTokenUri);
    }
}
