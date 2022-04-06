// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//Simple Student Attnedence Contract

contract StudentAttendance {

    //Admin Wallet Address

    address admin = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    //Teacher Wallet Address

    address teacher = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;

    //Attendence marking options, by default it's none

    enum AttendanceStatus {none, Present, Absent}

    //Struct including Student's information

    struct Student {
        uint rollNo;
        string name;
        string department;
        uint year;
        uint semester;
        AttendanceStatus status;
    }

    //Mapping the Student struct

    mapping(uint => Student) public student;

    //Modifiers to allow the limited access

    modifier onlyAdmin {
        require(msg.sender == admin, "Sorry, only admin is authorize!");
        _;
    }

    modifier onlyTeacher {
        require(msg.sender == teacher, "Sorry, only teacher is authorize!");
        _;
    }

    //Function to add Student data, only accessible by Admin

    function addStudents(uint _rollNo, string memory _name, string memory _department, uint _year, uint _semester) public onlyAdmin {
        student[_rollNo] = Student(_rollNo, _name, _department, _year, _semester, AttendanceStatus.none);
    }

    //Functions to mark attendance, only accessible by Teacher

    function markPresent(uint _rollNo) public onlyTeacher {
        student[_rollNo].status = AttendanceStatus.Present;
    }

    function markAbsent(uint _rollNo) public onlyTeacher {
        student[_rollNo].status = AttendanceStatus.Absent;
    }

}
