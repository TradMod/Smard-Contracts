# Gas Optimizations:

## I. Use `Custom Errors` instead of `Require` Statements

The benefit of using [Custom Errors](https://blog.soliditylang.org/2021/04/21/custom-errors/)  is that they significantly reduce gas costs especially deployment costs because unlike `require`, `Custom Errors` do not store a dynamic `string` of Error Message to revert when an operation fails.

**Examlple**: Execution Cost: 232904
```solidity
contract Ownable {
  
    address public owner = msg.sender;

    // `require` Not Optimized:
    function newOwner(address _newOwner) public {
        require(owner == msg.sender, "Only Owner Allowed");
        owner = _newOwner;
    }
}
```
**Examlple**: Execution Cost: 232904
```solidity
error Only_Owner_Allowed(); //Custom errors are defined using the error statement

contract Ownable_SmardWay {
  
    address public owner = msg.sender;

    // `Custom Error` Gas Optimized:
    function newOwner_SmardWay(address _newOwner) public {
        if(owner != msg.sender) { revert Only_Owner_Allowed(); }
        owner = _newOwner;
    }
}
```
References: https://tinyurl.com/3yaj4u8n & https://tinyurl.com/2k3wv67m


## II. Use `++i` instead `i++` inside loops

`++i` returns the incremented value, `i++` returns the non-incremented value, which costs a little bit extra gas.

**Examlple**: Execution Cost: 182005
```solidity
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
```
**Examlple**: Execution Cost: 181573
```solidity
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
```
References: https://tinyurl.com/mr4b4jcd & https://tinyurl.com/mr2xtn2r 