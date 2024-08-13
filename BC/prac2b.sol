// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;
contract Calculater{
    uint256 number1;
    uint256 number2;
    function EnterNumber(uint256 num1,uint256 num2)public{
        number1 = num1;
        number2 = num2;
    }
    function Add()public view returns(uint256){
        return number1 + number2;
    }
    function Sub()public view returns(uint256){
        return number1 - number2;
    }
    function Div()public view returns(uint256){
        return number1 / number2;
    }
    function Mul()public view returns(uint256){
        return number1 * number2;
    }
}