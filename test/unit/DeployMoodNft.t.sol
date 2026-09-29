// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.30;

import {Test} from "forge-std/Test.sol";
import {MoodNft} from "src/MoodNft.sol";
import {DeployMoodNft} from "script/DeployMoodNft.s.sol";

contract DeployMoodNftTest is Test {
    DeployMoodNft private deployer;
    address private USER;
    MoodNft private nft;

    function setUp() public {
        deployer = new DeployMoodNft();
    }

    function testConvertSvgToBase64() public view {
        string memory expectedResult =
            "data:image/svg+xml;base64,PHN2ZyBpZD0iTGF5ZXJfMSIgZGF0YS1uYW1lPSJMYXllciAxIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAxMjIuODggMTIyLjg4Ij48ZGVmcz48c3R5bGU+LmNscy0xe2ZpbGw6I2ZiZDQzMzt9LmNscy0xLC5jbHMtMntmaWxsLXJ1bGU6ZXZlbm9kZDt9LmNscy0ye2ZpbGw6IzE0MTUxODt9PC9zdHlsZT48L2RlZnM+PHRpdGxlPnNtaWxleTwvdGl0bGU+PHBhdGggY2xhc3M9ImNscy0xIiBkPSJNNDUuNTQsMi4xMUE2MS40Miw2MS40MiwwLDEsMSwyLjExLDc3LjM0LDYxLjQyLDYxLjQyLDAsMCwxLDQ1LjU0LDIuMTFaIi8+PHBhdGggY2xhc3M9ImNscy0yIiBkPSJNNDUuNzgsMzIuMjdjNC4zLDAsNy43OSw1LDcuNzksMTEuMjdzLTMuNDksMTEuMjctNy43OSwxMS4yN1MzOCw0OS43NywzOCw0My41NHMzLjQ4LTExLjI3LDcuNzgtMTEuMjdaIi8+PHBhdGggY2xhc3M9ImNscy0yIiBkPSJNNzcuMSwzMi4yN2M0LjMsMCw3Ljc4LDUsNy43OCwxMS4yN1M4MS40LDU0LjgxLDc3LjEsNTQuODFzLTcuNzktNS03Ljc5LTExLjI3UzcyLjgsMzIuMjcsNzcuMSwzMi4yN1oiLz48cGF0aCBkPSJNMjguOCw3MC44MmEzOS42NSwzOS42NSwwLDAsMCw4LjgzLDguNDEsNDIuNzIsNDIuNzIsMCwwLDAsMjUsNy41Myw0MC40NCw0MC40NCwwLDAsMCwyNC4xMi04LjEyLDM1Ljc1LDM1Ljc1LDAsMCwwLDcuNDktNy44Ny4yMi4yMiwwLDAsMSwuMzEsMEw5Nyw3My4xNGEuMjEuMjEsMCwwLDEsMCwuMjlBNDUuODcsNDUuODcsMCwwLDEsODIuODksODguNTgsMzcuNjcsMzcuNjcsMCwwLDEsNjIuODMsOTVhMzksMzksMCwwLDEtMjAuNjgtNS41NUE1MC41Miw1MC41MiwwLDAsMSwyNS45LDczLjU3YS4yMy4yMywwLDAsMSwwLS4yOGwyLjUyLTIuNWEuMjIuMjIsMCwwLDEsLjMyLDBsMCwwWiIvPjwvc3ZnPg==";
        string memory svg =
            '<svg id="Layer_1" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 122.88 122.88"><defs><style>.cls-1{fill:#fbd433;}.cls-1,.cls-2{fill-rule:evenodd;}.cls-2{fill:#141518;}</style></defs><title>smiley</title><path class="cls-1" d="M45.54,2.11A61.42,61.42,0,1,1,2.11,77.34,61.42,61.42,0,0,1,45.54,2.11Z"/><path class="cls-2" d="M45.78,32.27c4.3,0,7.79,5,7.79,11.27s-3.49,11.27-7.79,11.27S38,49.77,38,43.54s3.48-11.27,7.78-11.27Z"/><path class="cls-2" d="M77.1,32.27c4.3,0,7.78,5,7.78,11.27S81.4,54.81,77.1,54.81s-7.79-5-7.79-11.27S72.8,32.27,77.1,32.27Z"/><path d="M28.8,70.82a39.65,39.65,0,0,0,8.83,8.41,42.72,42.72,0,0,0,25,7.53,40.44,40.44,0,0,0,24.12-8.12,35.75,35.75,0,0,0,7.49-7.87.22.22,0,0,1,.31,0L97,73.14a.21.21,0,0,1,0,.29A45.87,45.87,0,0,1,82.89,88.58,37.67,37.67,0,0,1,62.83,95a39,39,0,0,1-20.68-5.55A50.52,50.52,0,0,1,25.9,73.57a.23.23,0,0,1,0-.28l2.52-2.5a.22.22,0,0,1,.32,0l0,0Z"/></svg>';

        string memory result = deployer.convertSvgToBase64(svg);
        assertEq(result, expectedResult);
    }
}
