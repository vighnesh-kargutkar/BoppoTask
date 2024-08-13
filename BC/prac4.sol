// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;
import "hardhat/console.sol";
contract Array{
    uint[] arr;
    function AddNum(uint num)public{
        arr.push(num);
    }
    function Res()public view returns (uint[] memory){
        return arr;
    }
}