// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;
import "hardhat/console.sol";
contract Array{
    function forloop()public pure{
        for (uint i=0; i < 5; i++) 
        {
            console.log("foor loop", i);
        }
    }
    function whileloop()public pure{
        uint j =0;
        while ( j < 5) 
        {
            console.log("While loop", j);
            j++;
        }
    }
}