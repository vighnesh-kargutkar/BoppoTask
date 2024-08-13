// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;
import "hardhat/console.sol";
contract prac9{
    uint[] arr;
    uint date;
    function AddRoll(uint num)public {
        arr.push(num);
    }
    function AddDate(uint num)public{
        date= num;
    }
    function result()public view{
        for (uint i = 0; i < arr.length; i++) 
        {
            uint res = arr[i] & date;
            if(res %2 == 0){
                console.log("student is allowed" , arr[i] , "cal",res);
            }else{
                console.log("student is not allowed", arr[i], "cal",res);
            }
        }
    }

}