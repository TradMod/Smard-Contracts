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
**SmardWay**: Execution Cost: 204163
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