// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Token {
    string public name;
    string public symbol;
    uint256 public decimals;
    uint256 public totalSupply;
    
    mapping(address => uint256) public balenceOf;
    
    event Transfer(address indexed from, address indexed to, uint256 value);
    
    constructor(string memory _name, string memory _symbol, uint _decimals, uint _totalSupply) {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        totalSupply = _totalSupply;
        balenceOf[msg.sender] = totalSupply;
    }
    
    function transfer(address _to, uint256 _value) external returns(bool success) {
        require(balenceOf[msg.sender] >= _value);
        balenceOf[msg.sender] = balenceOf[msg.sender] - (_value);
        balenceOf[_to] = balenceOf[_to] + (_value);
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
}