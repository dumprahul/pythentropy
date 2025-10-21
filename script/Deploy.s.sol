// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/CoinFlip.sol";

contract DeployScript is Script {
    function run() external {
        // Get environment variables
        address entropyAddress = vm.envAddress("ENTROPY_ADDRESS");
        
        // Start broadcasting transactions
        vm.startBroadcast();
        
        // Deploy CoinFlip contract with entropy address
        CoinFlip coinFlip = new CoinFlip(entropyAddress);
        
        // Stop broadcasting
        vm.stopBroadcast();
        
        // Log deployment information
        console.log("CoinFlip deployed at:", address(coinFlip));
        console.log("Entropy address:", entropyAddress);
    }
}
