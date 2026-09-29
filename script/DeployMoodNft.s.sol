// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import {Script} from "forge-std/Script.sol";
import {MoodNft} from "src/MoodNft.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract DeployMoodNft is Script {
    string private happySvg = vm.readFile("./image/happy.svg");
    string private sadSvg = vm.readFile("./image/sad.svg");

    function run() external returns (MoodNft) {
        string memory happyImageUri = convertSvgToBase64(happySvg);
        string memory sadImageUri = convertSvgToBase64(sadSvg);

        vm.startBroadcast();
        MoodNft moodNft = new MoodNft(happyImageUri, sadImageUri);
        vm.stopBroadcast();

        return moodNft;
    }

    function convertSvgToBase64(string memory svg) public pure returns (string memory) {
        string memory base64 = "data:image/svg+xml;base64,";
        string memory encoded = Base64.encode(bytes(svg));
        return string(abi.encodePacked(base64, encoded));
    }
}
