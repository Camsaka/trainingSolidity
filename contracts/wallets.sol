// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract testMappingStruct{

    struct wallet{
        uint cash;
        uint nbTransactions;
    }

    mapping(address => wallet) Wallets;

    function getTotalBalance() public view returns(uint){
        //here balance is a native function to get total amount available on this contract
        return address(this).balance;
    }

    function getCash() public view returns(uint){
        return Wallets[msg.sender].cash;
    }

    function getNbTransactions() public view returns(uint){
        return Wallets[msg.sender].nbTransactions;
    }

    function withdrawAllMoney(address payable _to) public{
        uint _amount = Wallets[msg.sender].cash;
        Wallets[msg.sender].cash = 0;
        _to.transfer(_amount);
    }

    receive() external payable{
        Wallets[msg.sender].cash += msg.value;
        Wallets[msg.sender].nbTransactions += 1;
    }


}