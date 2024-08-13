// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;
contract func{
    function Add(uint a)public pure returns (uint){
        return a+a;
    }
   function Add(uint a,uint b)public pure returns (uint){
        return a+b;
    }
   function Add(uint a,uint b,uint c)public pure returns (uint){
        return a+b+c;
    }
        function fibb(uint256 num)public pure returns(uint256){
        if( num == 0) return 0;
        if( num == 1) return 1;
        uint256 a = 0;
        uint256 b = 1;
        uint256 c;
        for (uint256 i = 2; i <= num; i++) 
        {
            c= a+b;
            a= b;
            b=c;
        }
        return c;
    }
    function fact(uint256 num)public pure returns(uint256){
        if( num == 0) return 1;
        uint256 res =1;
        for (uint256 i = 1; i <= num; i++) 
        {
            res *=i;
        }
        return res;
    }
}
