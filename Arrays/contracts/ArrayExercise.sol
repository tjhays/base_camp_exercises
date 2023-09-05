// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.18;

/**
 * @title ArraysExercise
 * @dev Experiment with sol arrays
 */
contract ArraysExercise {
    uint[] public numbers = [1,2,3,4,5,6,7,8,9,10];
    address[] public senders;
    uint[] public timestamps;

    function getNumbers() public view returns (uint[] memory) {
        return numbers;
    }

    function resetNumbers() public {
        delete numbers;
        numbers = [uint(1),2,3,4,5,6,7,8,9,10];
    }

    function addNumber(uint _newNumber) public returns (uint length) {
        numbers.push(_newNumber);
        length = numbers.length;
    }

    function appendToNumbers(uint[] calldata _toAppend) public returns (uint length) {
        for(uint i = 0; i < _toAppend.length; i++) {
            numbers.push(_toAppend[i]);
        }
        length = numbers.length;
    }

    function saveTimestamp(uint _unixTimestamp) external {
        senders.push(msg.sender);
        timestamps.push(_unixTimestamp);
    }

    function getTimestamps() public view returns (uint[] memory) {
        return timestamps;
    }

    function getSenders() public view returns (address[] memory) {
        return senders;
    }

    function afterY2K() public view returns (uint[] memory afterTimes, address[] memory matchingAddrs) {
        uint y2k = 946702800;
        uint count = _countAfterTime(y2k);
        afterTimes = new uint[](count);
        matchingAddrs = new address[](count);
        uint currentPos = 0;
        for(uint i = 0; i < timestamps.length; i++) {
            if(timestamps[i] > y2k) {
                afterTimes[currentPos] = timestamps[i];
                matchingAddrs[currentPos] = senders[i];
                currentPos++;
            }
        }

    }

    function _countAfterTime(uint afterTime) internal view returns (uint count) {
        count = 0;
        for(uint i = 0; i < timestamps.length; i++) {
            if(timestamps[i] > afterTime) {
                count++;
            }
        }
    }

    function resetSenders() public {
        delete senders;
    }

    function resetTimestamps() public {
        delete timestamps;
    }

}