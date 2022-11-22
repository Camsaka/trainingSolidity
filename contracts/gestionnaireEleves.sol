// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "@openzeppelin/contracts/utils/Strings.sol";

contract gestionnaireEleves{

    address owner;

    struct Grade{
        string subject;
        uint grade;
    }

    struct Student{
        string name;
        string firstName;
        uint nbGrades;
        //mapping less gas than array
        mapping(uint => Grade) grades;
    }

    mapping(address => Student) listStudents;

    constructor(){
        owner = msg.sender;
    }

    function studentExist(address _studentAddress) public view returns(bool){
        //bytes cost less gas than string (online research required)
        bytes memory nameOfAddress = bytes(listStudents[_studentAddress].name);
        uint lengthOfName = nameOfAddress.length;
        if(lengthOfName > 0){
            return true;
        }
        else return false;
    }

    function addEleve(address _studentAddress, string memory _name, string memory _firstname) public{
        //check the owner of the contract
        require(msg.sender == owner, "Not the owner");

        require(!studentExist(_studentAddress), "Student already exist");

        listStudents[_studentAddress].name = _name;
        listStudents[_studentAddress].firstName = _firstname;
    }

    function getNbGrades(address _studentAddress) public view returns(uint){
        return listStudents[_studentAddress].nbGrades;
    }

    function addGrade(address _studentAddress, string memory _subject, uint _grade) public{

        //check the owner of the contract
        require(msg.sender == owner, "Not the owner");

        //check student exist
        require(studentExist(_studentAddress), "Student does not exist");

        //get the number of notes
        uint nbGrades = getNbGrades(_studentAddress);

        //add grade in the mapping
        listStudents[_studentAddress].grades[nbGrades].subject = _subject;
        listStudents[_studentAddress].grades[nbGrades].grade = _grade;
        //increment nbNotes
        listStudents[_studentAddress].nbGrades++;
    }

    function getStudent(address _studentAddress) public view returns(string memory){
        string memory name = listStudents[_studentAddress].name;
        string memory firstName = listStudents[_studentAddress].firstName;
        return string(abi.encodePacked(name," ",firstName));
    }

    /*    function getGrades(address _studentAddress) public view returns(string memory){
            uint nbGrades = getNbGrades(_studentAddress);
            string memory results;
            for(uint i = 0 ; i<nbGrades ; i++){
                string memory _subject = listStudents[_studentAddress].grades[i].subject;
                string memory _grade = Strings.toString(listStudents[_studentAddress].grades[i].grade);
                results = string .concat(results, _subject, " : ", _grade, ", ");
            }
            return results;
        }*/

    function getGrades(address _studentAddress) public view returns(uint[] memory){
        uint nbGrades = getNbGrades(_studentAddress);
        uint[] memory results = new uint[](nbGrades);
        for(uint i = 0 ; i<nbGrades ; i++){
            uint _grade = listStudents[_studentAddress].grades[i].grade;
            results[i] = _grade;
        }
        return results;
    }
}