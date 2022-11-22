// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import './Owner.sol';

contract test is Owner{
    uint nombre;

    function setNombre(uint _nombre) public isOwner {
        nombre = _nombre;
    }

    function getNombre() public view isOwner returns(uint){
        return nombre;
    }
}