// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.18;

/**
 * @title ArrayDemo
 * @dev Experiment with sol arrays
 */
 contract ArrayDemo {
     uint[] public numbers = [1,2,3,4,5,6,7,8,9,10];
     uint public numEven = 5;

     function getEvenNumbers() external view returns(uint[] memory) {
         uint[] memory results = new uint[](numEven);
         uint current = 0;

        for(uint i=0; i < numbers.length; i++) {
            if(numbers[i] % 2 == 0) {
                results[current] = numbers[i];
                current++;
            }
        }
        return results;
     }

    function _countEventNumbers() internal view returns(uint) {
        uint results = 0;
        for(uint i=0; i < numbers.length; i++) {
            if(numbers[i] % 2 == 0) {
                results++;
            }
        }
        return results;
    } 
 }