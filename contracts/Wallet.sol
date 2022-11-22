// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import './Owner.sol';

contract Wallet is Owner{

    struct Balance{
        uint totalBalance;
        uint nbPayments;
        mapping(uint => Payment) payments;
    }

    struct Payment{
        uint amount;
        uint timestamp;
    }

    mapping(address => Balance) Wallets;

    receive() external payable{
        Payment memory p = Payment(msg.value, block.timestamp);
        Wallets[msg.sender].totalBalance += msg.value;
        Wallets[msg.sender].payments[Wallets[msg.sender].nbPayments] = p;
        Wallets[msg.sender].nbPayments++;
    }

    function getTotalBalance() public isOwner view returns(uint){
        //here balance is a native function to get total amount available on this contract
        return address(this).balance;
    }

    function withdrawAllMoney(address payable _to) public{
        require(Wallets[msg.sender].totalBalance > 0, "No funds available");
        uint amount = Wallets[msg.sender].totalBalance;
        Wallets[msg.sender].totalBalance = 0;
        _to.transfer(amount);
    }

    function withdraw(address payable _to, uint _amount) public{
        require(_amount <= Wallets[msg.sender].totalBalance, "Unsuffisant funds");
        Wallets[msg.sender].totalBalance -= _amount;
        _to.transfer(_amount);
    }

}