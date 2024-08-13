// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;
contract parent{
        uint sum;
        function set()external {
            uint a = 10;
            uint b = 10;
            sum = a + b;
        }
}
contract child is parent{
    function get()external view returns(uint){
        return sum;
    }
}
contract cal{
    child cc = new child();
    uint res;
    function inth()public{
        cc.set();
        res = cc.get();
    }
    function result()public view returns(uint){
        return res;
    }
}