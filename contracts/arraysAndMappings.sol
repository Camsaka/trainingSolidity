// SPDX-License-Identifier: MIT
pragma solidity 0.8.12;

contract exercice{

    struct eleve{
        string name;
        string firstname;
        uint[] notes;
    }

    mapping(address => eleve) Eleves;

    function addNote(address _eleve, uint _note) public{
        Eleves[_eleve].notes.push(_note);
    }

    function getNotes(address _eleve) public view returns(uint[] memory){
        return Eleves[_eleve].notes;
    }

    function setName(address _eleve, string memory _name) public{
        Eleves[_eleve].name = _name;
    }

    function setFirstname(address _eleve, string memory _firstname) public{
        Eleves[_eleve].firstname = _firstname;
    }

    function getEleve(address _eleve) public view returns(string memory){
        string memory _name = Eleves[_eleve].name;
        string memory _firstname = Eleves[_eleve].firstname;

        //string.concat à partir 0.8.12
        //string memory _entireName = string.concat(_name," ", _firstname);
        //return _entireName;
        //less gas with abi concat
        return string(abi.encodePacked(_name," ",_firstname));
    }

}