// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

//contrat montrant comment créer des contrats à partir d'un autre contrat

contract contractsFactory{
    //creation d'un tableau de contrats de type Number
    Number[] numbersContracts;

    function createNumberContract() external returns(address){
        //Creation du nouveau contrat
        Number n = new Number(100);
        //push dans le tableau
        numbersContracts.push(n);
        //retourner l'adresse du contrat crée
        return address(n);
    }

    function getNumberByContract(Number _Contract) external view returns(uint){
        return _Contract.getNumber();
    }

    function setNumberByContract(Number _Contract, uint _number) external{
        _Contract.setNumber(_number);
    }
}

contract Number{
    uint number;

    constructor(uint _number){
        number = _number;
    }

    function getNumber() external view returns(uint){
        return number;
    }

    function setNumber(uint _number) external{
        number = _number;
    }
}