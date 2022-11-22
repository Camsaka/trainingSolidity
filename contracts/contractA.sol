// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import './contratBInterface.sol';

contract A {

    //addresse du contrat B 
    address _addressB;

    function setAddressB(address addressB) external{
        _addressB = addressB;
    }

    function appelGetNombre() external view returns(uint){
        //On crée une variable b de type "contrat B"
        interfaceB b = interfaceB(_addressB);
        return b.getNombre();
    }

    function appelSetNombre(uint _number) external{
        interfaceB b = interfaceB(_addressB);
        b.setNombre(_number);
    }

}