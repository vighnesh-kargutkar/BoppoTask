// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;
import "hardhat/console.sol";
contract prac10{
    uint[] arr;
    uint andd;
    uint orr;
    uint product;
    function Add(uint num)public{
        arr.push(num);
    }
    function DisplayArr()public view returns(uint[] memory){
        return arr;
    }
    function Sum()public view returns(uint){
        uint sum=0;
        for (uint i =0; i < arr.length; i++) 
        {
            sum += arr[i];
        }
        return sum;
    }
    function EvenOdd()public{
        andd=arr[0];
        orr=arr[1];
        for (uint i =0; i < arr.length; i++) 
        {
            if(i %2 == 0){
                andd |= arr[i];
            }else{
                orr |= arr[i];
            }
        }
        product = andd*orr;
    }
    function pro()public view returns(bool){
        for (uint i =0; i < arr.length; i++) 
        {
            if(product == arr[i])return true;
        }
        return false;
    }


}