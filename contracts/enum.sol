// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract enumTraining{

    enum etape {commande,expedie,livre}

    struct produit{
        uint _id;
        enumTraining.etape _etape;
    }

    mapping(address => produit) Commandes;

    function commander(address _client, uint _id) public{
        produit memory p = produit(_id, etape.commande);
        Commandes[_client] = p;
    }

    function expedier(address _client) public{
        Commandes[_client]._etape = etape.expedie;
    }

    function getProduit(address _client) public view returns(uint){
        return Commandes[_client]._id;
    }

    function getStatus(address _client) public view returns(etape){
        return Commandes[_client]._etape;
    }

}
