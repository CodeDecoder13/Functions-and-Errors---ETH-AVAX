// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.3 <0.9.0;
// Functions and Errors - ETH + AVAX

contract UniqueModifier {

    uint privateBalance;
    address privateOwner;

    constructor(){
        privateOwner = msg.sender;
    }

    modifier onlyUniqueOwner {
        require(privateOwner == msg.sender, "Only the unique owner can access");
        _;
    }

    function setUniqueBalance(uint _balance) public onlyUniqueOwner {
        privateBalance = _balance;
    }
    
    function checkUniqueInput() public view onlyUniqueOwner {
        assert(privateBalance > 0);
    }

    function getUnique() public view onlyUniqueOwner returns (uint) {
        if (privateBalance <= 0) {
            revert("Balance must be greater than 0!");
        } else {
            return privateBalance;
        }
    }
}
// coded by Rhuzzel Paramio
