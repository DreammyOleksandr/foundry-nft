// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import {Script} from "forge-std/Script.sol";
import {ZeppelinNft} from "src/ZeppelinNft.sol";

contract DeployZeppelinNft is Script {
    function run() external returns (ZeppelinNft) {
        vm.startBroadcast();
        ZeppelinNft zeppelinNft = new ZeppelinNft();
        vm.stopBroadcast();

        return zeppelinNft;
    }
}
