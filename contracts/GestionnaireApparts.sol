// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;


//SC import in 'modifiers.sol'
contract Owner{

    address owner;

    constructor(){
        owner =  msg.sender;
    }

    //Only the owner of the SC can modify and apply fucntion
    modifier isOwner(){
        require(msg.sender == owner, "Not the owner");
        _;
    }

}


contract gestureAppartments is Owner{

    enum typeBien {terrain, appartementn, maison}

    struct bien{
        uint id;
        string name;
        uint price;
        typeBien _typeBien;
    }

    uint nbBiens;

    mapping(address => bien[]) pocessions;

    function addBien(address _addressClient, string memory _name, uint _price, typeBien _typeB) public isOwner{
        require(_price > 1000, "The price have to be bigger than 1000 wei");
        require(uint(_typeB) <= 2, "Le type du bien doit etre compris entre 0 et 2");
        require(uint(_typeB) >= 0, "Le type du bien doit etre compris entre 0 et 2");
        pocessions[_addressClient].push(bien(nbBiens,_name,_price,_typeB));
        nbBiens++;
    }

    function getBiens(address _addressClient) public view returns(bien[] memory){
        return pocessions[_addressClient];
    }

    function getNbBiens(address _addressClient) public view returns(uint){
        return pocessions[_addressClient].length;
    }

    function getMyBiens() public view returns(bien[] memory){
        return pocessions[msg.sender];
    }
}

//Visibilité des fonctions

//public : function executable inside and outside of the contract
//private : only in the contract (bonne pratique : précéder le nom de la fonction par un underscore)
//internal : only in the contract and in inherited contract
//external : only from outside

//Visibilité des variables

//par défaut une variable est private
//private : ce nombre peut juste être appeler depuis l'intérieur du contrat sauf si on crée un getter
//toujours possible de vérifier les private via des outils d'analyse comme mitril (ATTENTION à ne pas mettre trop de secret)
//internal : variable lisible dans le contrat et dans les contrats qui en héritent
//public : peut etre lut dans le contrat, les herités et depuis l'exterieur

//