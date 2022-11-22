// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract A {

    //addresse du contrat B 
    address _addressB;

    function setAddressB(address addressB) external{
        _addressB = addressB;
    }

    function appelGetNombre() external view returns(uint){
        //On crée une variable b de type "contrat B"
        B b = B(_addressB);
        return b.getNombre();
    }

    function appelSetNombre(uint _number) external{
        B b = B(_addressB);
        b.setNombre(_number);
    }

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


//Voir contratA.sol et contratB.sol pour l'implémentation propre