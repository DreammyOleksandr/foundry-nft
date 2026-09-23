// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import {Script} from "forge-std/Script.sol";
import {ZeppelinNft} from "src/ZeppelinNft.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";

contract MintZeppelinNft is Script {
    string private constant TOKEN_URI = "some_uri";

    function run() external {
        address mostRecentDeployment = DevOpsTools.get_most_recent_deployment("ZeppelinNft", block.chainid);
        mintNft(mostRecentDeployment);
    }

    function mintNft(address mostRecentDeployment) public {
        vm.startBroadcast();
        ZeppelinNft(mostRecentDeployment).mint(TOKEN_URI);
        vm.stopBroadcast();
    }
}
