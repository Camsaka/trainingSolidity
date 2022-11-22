// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

//interet pouvoir transmettre des infos, variables vers l'exterieur (front end)
//les events ne peuvent pas etre lu depuis les contrats intelligents
//stocker des éléments dans les events coutent moins de gas qu'en mode storage

contract testEvents{
    uint[] numbers;
    event numberAdded(address _by, uint _num);

    function addNumber(uint _number) external{
        numbers.push(_number);

        //emmettre l'evenement pour transmettre les infos voulu
        emit numberAdded(msg.sender, _number);
    }
}