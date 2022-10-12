// SPDX-License-Identifier: DevABDee
pragma solidity 0.8.8;

///// 1
contract Ownable {
  
    address public owner = msg.sender;

    function newOwner(address _newOwner) public {
        require(owner == msg.sender, "Only Owner Allowed");
        owner = _newOwner;
    }
}

contract Ownable_GasGolfed {
    
    error Only_Owner_Allowed(); 
  
    address public owner = msg.sender;

    function newOwner_GasGolfed(address _newOwner) public {
        if(owner != msg.sender) { revert Only_Owner_Allowed(); }
        owner = _newOwner;
    }
}