pragma solidity ^0.8.0;

contract SMEHcoin {
    mapping (address => uint256) public balances;
    uint256 public totalSupply;

    constructor(uint256 _totalSupply) {
        totalSupply = _totalSupply;
        balances[msg.sender] = _totalSupply;
    }

    function transfer(address _to, uint256 _value) public returns (bool) {
        require(balances[msg.sender] >= _value, "Insufficient balance.");
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        return true;
    }

    function balanceOf(address _owner) public view returns (uint256) {
        return balances[_owner];
    }
}

//  SMEHcoin smart contract defines a mapping that associates addresses with balances, as well as a total supply of coins. The constructor function is called when the contract is deployed, and initializes the total supply of coins and assigns them all to the address that deploys the contract.

// The transfer function allows an address to transfer coins to another address, as long as the sender has a sufficient balance. The balanceOf function allows an address to query its current balance.