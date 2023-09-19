// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.18;

/**
 * @title Inheritance
 * @dev Experiment with sol inheritance
 * 
 */
contract InheritanceSubmission {
    address public salesPerson;
    address public engineeringManager;

    constructor(address _salesPerson, address _engineeringManager) {
        salesPerson = _salesPerson;
        engineeringManager = _engineeringManager;
    }
}

/**
 * @title Employee
 * @dev Experiment with abstract contracts
 * 
 */
 abstract contract Employee {
     uint public idNumber;
     uint public managerId;


     constructor(uint _idNumber, uint _managerId) {
         idNumber = _idNumber;
         managerId = _managerId;
     }

     function getAnnualCost() public virtual returns(uint);
 }

 /**
 * @title Salaried
 * @dev Experiment with inheriting contracts
 * 
 */
contract Salaried is Employee {
    uint public annualSalary;

     constructor(uint _idNumber, uint _managerId, uint _annualSalary) Employee(_idNumber, _managerId) {
         annualSalary = _annualSalary;
     }
    
    function getAnnualCost() public override view returns(uint) {
        return annualSalary;
    }
}

 /**
 * @title Hourly
 * @dev Experiment with inheriting contracts part 2
 * 
 */
contract Hourly is Employee {
    uint public hourlyRate;

     constructor(uint _idNumber, uint _managerId, uint _hourlyRate) Employee(_idNumber, _managerId) {
         hourlyRate = _hourlyRate;
     }
    
    function getAnnualCost() public override view returns(uint) {
        return hourlyRate * 2080;
    }
}

 /**
 * @title Manager
 * @dev Experiment with inheriting contracts 2nd base contract
 * 
 */
contract Manager {
     uint[] public employeeIds;

     function addReport(uint employeeId) public{
         employeeIds.push(employeeId);
     }

     function resetReports() public{
         delete employeeIds;
     }
}

 /**
 * @title Salesperson
 * @dev Experiment with inheriting contracts with multiple layers
 * 
 */
contract Salesperson is Hourly {
     constructor(uint _idNumber, uint _managerId, uint _hourlyRate) Hourly(_idNumber, _managerId, _hourlyRate) {}
}

 /**
 * @title Salesperson
 * @dev Experiment with inheriting contracts with multiple layers
 * 
 */
contract EngineeringManager is Salaried, Manager {
    constructor(uint _idNumber, uint _managerId, uint _annualSalary) Salaried(_idNumber, _managerId, _annualSalary) {}
}

