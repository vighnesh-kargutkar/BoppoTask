// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;
interface call {
   function add(uint a,uint b)external pure returns (uint);
    function sub(uint a,uint b)external pure returns (uint);    
}
contract cal is call {
      function add(uint a,uint b)external pure override returns (uint){
        return a+b;
      }
    function sub(uint a,uint b)external pure override returns (uint){
        return a+b;
    }
}