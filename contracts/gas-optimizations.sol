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

contract Ownable_SmardWay {
    
    error Only_Owner_Allowed(); 
  
    address public owner = msg.sender;

    function newOwner_SmardWay(address _newOwner) public {
        if(owner != msg.sender) { revert Only_Owner_Allowed(); }
        owner = _newOwner;
    }
}

///// 2
contract PrimeCheck {
    function primeChecker(uint n) public pure returns (bool) {
        for (uint i = 2; i < n; i++) {
            if (n % i == 0) {
                return true;
            }
        }
        return false;
    }
}
contract PrimeCheck_SmardWay {
    function primeChecker_SmardWay(uint n) public pure returns (bool) {
        for (uint i = 2; i < n; ++i) {
            if (n % i == 0) {
                return true;
            }
        }
        return false;
    }
}