// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.18;

/**
 * @title ControlStructures
 * @dev Experiment with sol control structures
 */
contract ControlStructures {
    function fizzBuzz(uint256 _number) external pure returns (string memory) {
        if (_number % 3 == 0) {
            if (_number % 5 == 0) {
                return "FizzBuzz";
            } else {
                return "Fizz";
            }
        } else if (_number % 5 == 0) {
            return "Buzz";
        } else {
            return "Splat";
        }
    }

    error AfterHours(uint256 _time);

    function doNotDisturb(uint256 _time) external pure returns (string memory) {
        // Must be in a 24H period
        assert(_time < 2400);
        // Only supporting office hours 8am - 10 pm
        if (_time > 2200 || _time < 800) {
            revert AfterHours(_time);
        }
        // Morning hours - 8am inclusive - 12pm exclusive
        if (_time >= 800 && _time < 1200) {
            return "Morning!";
        }
        // Lunch Hour - 12pm inclusive - 1pm exclusive
        if (_time >= 1200 && _time < 1300) {
            revert("At Lunch!");
        }
        // Afternoon hours = 1pm inclusive - 6pm exclusive
        if (_time >= 1300 && _time < 1800) {
            return "Afternoon!";
        }
        // Evening hours = 6pm inclusive - 10pm exclusive
        if (_time >= 1800 && _time <= 2200) {
            return "Evening!";
        }
        // Should never be reachable
        return "";
    }
}
