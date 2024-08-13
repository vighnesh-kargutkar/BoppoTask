// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;
contract Storage{
    struct Block  {
        uint256 index;
        uint256 timestamp;
        string data;
        bytes32 previoushah;
        bytes32 currenthash;
    }

    Block[]  blockchain;

    constructor(){
        create();
    }
    function create()internal{
        Block memory geness = Block({
            index : 0,
            timestamp :block.timestamp,
            data:"First block",
            previoushah: bytes32(0),
            currenthash: keccak256(abi.encodePacked(uint256(0),block.timestamp,"First block",bytes32(0)))
        });
        blockchain.push(geness);
    }
    function addblock(string memory data)public{
        Block memory previous = blockchain[blockchain.length - 1];
        uint256 newindex = previous.index + 1;
        uint256 newtimestamp = block.timestamp;
        bytes32 newprev = previous.currenthash;
        bytes32 newhash = keccak256(abi.encodePacked(newindex,newtimestamp,data,newprev));
        Block memory newgen = Block({
            index : newindex,
            timestamp :newtimestamp,
            data:data,
            previoushah: newprev,
            currenthash: newhash
        });
        blockchain.push(newgen);

    }
     function getBlock(uint256 index) public view returns (Block memory) {
        require(index < blockchain.length, "Block does not exist.");
        return blockchain[index];
    }
    function getlatestchain()public view returns(Block memory){
        return blockchain[blockchain.length -1];
    }
}