pragma solidity ^0.4.17;

contract Migrations {
  address public owner;
  uint public last_completed_migration;


  mapping (address => uint) balances;

  modifier restricted() {
    if (msg.sender == owner) _;
  }

  function Migrations() public {
    balances[msg.sender] = 10000;
    owner = msg.sender;
  }

  function setCompleted(uint completed) public restricted {
    last_completed_migration = completed;
  }

  function upgrade(address new_address) public restricted {
    Migrations upgraded = Migrations(new_address);
    upgraded.setCompleted(last_completed_migration);
  }

  function sendCoin(address receiver, uint amount) returns(bool sufficient) {
	if (balances[msg.sender] < amount) return false;
	balances[msg.sender] -= amount;
	balances[receiver] += amount;
	return true;
  }

}
