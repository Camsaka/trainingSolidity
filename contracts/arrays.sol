// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Arrays {
    //A variable declared outside of a function is a storage function (saved and static in the blockchain)
    //In a function a variable is a memory variable, stored just in the function
    uint[] myArray;

    function addValue(uint _value) public{
        myArray.push(_value);
    }

    function updateValue(uint _index, uint _value) public{
        myArray[_index] = _value;
    }

    function deleteValue(uint _index) public{
        delete myArray[_index];
    }

    function getValue(uint _index) public view returns(uint){
        return myArray[_index];
    }

    function getArrayX2() public view returns(uint[] memory){
        uint longueur = myArray.length;
        uint[] memory myArrayX2 = new uint[](longueur);
        for(uint i=0 ; i<longueur ; i++){
            myArrayX2[i] = myArray[i]*2;
        }
        return myArrayX2;
    }

    function somme(uint[] memory _tab) public{

    }
}
