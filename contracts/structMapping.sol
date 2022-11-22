// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract testMappingStruct{

    struct balance{
        uint cash;
        uint nbTransactions;
    }

    mapping(address => balance) Balances;

    receive() external payable{
        Balances[msg.sender].cash += msg.value;
        Balances[msg.sender].nbTransactions += 1;
    }

    function getCash(address _adress) public view returns(uint){
        return Balances[_adress].cash;
    }

    function getNbTransactions(address _adress) public view returns(uint){
        return Balances[_adress].nbTransactions;
    }
}