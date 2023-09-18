// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.18;

/**
 * @title FavoriteRecords
 * @dev Experiment with sol map datatype
 * 
 */
 contract GarageManager {
     mapping(address => Car[]) garage;

     struct Car {
         string make;
         string model;
         string color;
         uint numberOfDoors;
     }

     function addCar(string calldata _make, string calldata _model, string calldata _color, uint _numberOfDoors) external {
         Car storage newCar = garage[msg.sender].push();
         setCarValues(_make, _model, _color, _numberOfDoors, newCar);
     }

     function getMyCars() external view returns(Car[] memory){
         return garage[msg.sender];
     }

     function getUserCars(address _user) external view returns(Car[] memory){
         return garage[_user];
     }
     
     error BadCarIndex(uint _index);
     function updateCar(uint _index, string calldata _make, string calldata _model, string calldata _color, uint _numberOfDoors) external {
         if(_index >= garage[msg.sender].length) {
             revert BadCarIndex(_index);
         }
         Car storage update = garage[msg.sender][_index];
         setCarValues(_make, _model, _color, _numberOfDoors, update);
     }

     function setCarValues(string calldata _make, string calldata _model, string calldata _color, uint _numberOfDoors, Car storage car) internal {
         car.make = _make;
         car.model = _model;
         car.color = _color;
         car.numberOfDoors = _numberOfDoors;
     }

     function resetMyGarage() public {
         delete garage[msg.sender];
     }


 }