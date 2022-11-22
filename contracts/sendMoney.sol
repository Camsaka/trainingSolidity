// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract testTransaction{

    //last person who have send money on the contract
    address lastPerson;
    uint balance;

    function getLastPerson() public view returns(address){
        return lastPerson;
    }

    function getBalance() public view returns(uint){
        return balance;
    }

    // a public function can be call from inside and outside of the contract
    // an external function can be call only from outside of the contract
    //payable means that we'll send money

    receive() external payable {
        lastPerson = msg.sender;
        balance += msg.value;
    }

}