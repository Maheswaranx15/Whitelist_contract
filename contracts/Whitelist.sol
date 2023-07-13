// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;
import "@openzeppelin/contracts/access/Ownable.sol";
contract Whitelist is Ownable {
    mapping (address => bool) private whitelisAddress ;

    function addWhitelistAddress(address whitelistAddr) public onlyOwner  returns(bool) {
        require( whitelisAddress[whitelistAddr] != true, "Already Whitelisted");
        whitelisAddress[whitelistAddr] = true;
        return true;
    }
    function removeWhitelistAddress(address whitelistAddr) public onlyOwner returns(bool) {
        require( whitelisAddress[whitelistAddr] != false, "Already Removed");
        whitelisAddress[whitelistAddr] = false;
        return false;
    }

    function isWhitelisted(address whitelistAddr) public view returns(bool) {
        return whitelisAddress[whitelistAddr] ;
    }

    function batchWhitelist(address[] calldata whitelistAddr) external onlyOwner  {
        for (uint256 i = 0 ;i< whitelistAddr.length; i++) {
            whitelisAddress[whitelistAddr[i]] = true;
        }
    }

    function removeWhitelist(address[] calldata whitelistAddr) external onlyOwner  {
        for (uint256 i = 0 ;i< whitelistAddr.length; i++) {
            whitelisAddress[whitelistAddr[i]] = false;
        }
    }
}

