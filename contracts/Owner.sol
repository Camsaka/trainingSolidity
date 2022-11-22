// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;


//SC import in 'modifiers.sol'
contract Owner{

    address owner;

    constructor(){
        owner =  msg.sender;
    }

    //Only the owner of the SC can modify and apply fucntion
    modifier isOwner(){
        require(msg.sender == owner, "Not the owner");
        _;
    }

}

