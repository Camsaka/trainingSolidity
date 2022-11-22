// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

interface interfaceB {

    //copier uniquement la déclaration des fonctions à exporter
    function getNombre() external view returns(uint);
    function setNombre(uint _nombre) external;
}

contract B{

    uint nombre;

    function getNombre() external view returns(uint){
        return nombre;
    }

    function setNombre(uint _nombre) external{
        nombre = _nombre;
    }
}