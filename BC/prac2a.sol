// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;
contract Increment{
    uint256 number;
    function AddNumber(uint256 num)public{
        number=num;
    }
    function increment()public{
        number++;
    }
    function res()public view returns(uint256){
        return number;
    }
}