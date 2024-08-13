// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;
import "hardhat/console.sol";
contract OperatorExample {
    function comparison(uint a, uint b) public pure returns (bool, bool, bool, bool, bool, bool) {
        return (a == b, a != b, a > b, a < b, a >= b, a <= b);
    }

    function logical(bool a, bool b) public pure returns (bool, bool, bool, bool) {
        return (a && b, a || b, !a, !b);
    }

    function assignment() public pure returns (uint) {
        uint a = 10;
        a += 5;
        a -= 3;
        a *= 2;
        a /= 4;
        a %= 5;
        return a;
    }

    function ternary(uint a, uint b) public pure returns (uint) {
        return (a > b) ? a : b;
    }
}
