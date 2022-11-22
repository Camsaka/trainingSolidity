// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.7;

contract test {
    uint nombre;

    function getNombre() public view returns(uint){
        return nombre;
    }

    function setNombre(uint _nombre) public {
        nombre = _nombre;
    }

    address myAdress;

    function setAdress(address _adress) public {
        myAdress = _adress;
    }

    function getAdress() public view returns(address){
        return myAdress;
    }

    string mySentence;

    function setSentence(string memory _mySentence) public {
        mySentence = _mySentence;
    }

    function getSentence() public view returns(string memory){
        return mySentence;
    }
}