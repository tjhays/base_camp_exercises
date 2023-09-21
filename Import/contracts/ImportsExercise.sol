// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.18;

import "./SillyStringUtils.sol";

/**
 * @title ImportsExercise
 * @dev Experiment with sol imports
 * 
 */
contract ImportsExercise {
    SillyStringUtils.Haiku public haiku;

    function saveHaiku(string memory _line1, string memory _line2, string memory _line3) public {
        haiku.line1 = _line1;
        haiku.line2 = _line2;
        haiku.line3 = _line3;
    }

    function getHaiku() public view returns (SillyStringUtils.Haiku memory)  {
        return haiku;
    }

    function shruggieHaiku() public view returns (SillyStringUtils.Haiku memory) {
        return SillyStringUtils.Haiku({
            line1: haiku.line1,
            line2: haiku.line2,
            line3: SillyStringUtils.shruggie(haiku.line3)
        });
    }
}