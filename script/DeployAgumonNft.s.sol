// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script, console} from "forge-std/Script.sol";
import {AgumonNft} from "../src/AgumonNft.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract DeployAgumonNft is Script {
    function run() external returns (AgumonNft) {
        string memory agumonEggSvg = vm.readFile("./img/agumonEgg.svg");
        string memory agumonHatchSvg = vm.readFile("./img/agumonHatch.svg");

        vm.startBroadcast();
        AgumonNft agumonNft = new AgumonNft(
            svgToImageUri(agumonEggSvg),
            svgToImageUri(agumonHatchSvg)
        );
        vm.stopBroadcast();
        return agumonNft;
    }

    function svgToImageUri(
        string memory svg
    ) public pure returns (string memory) {
        string memory baseURL = "data:image/svg+xml;base64,";
        string memory svgBased64Encoded = Base64.encode(
            bytes(string(abi.encodePacked(svg)))
        );
        return string(abi.encodePacked(baseURL, svgBased64Encoded));
    }
}
