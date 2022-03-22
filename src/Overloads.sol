// SPDX-License-Identifier: Unlicense
pragma solidity 0.8.10;

contract Overloads {
  event Overloads(string message);

  function payableButNot (address toWho) public payable {
    emit Overloads("The payable version");
  }

  function payableButNot (address toWho, address token, uint256 amount) public {
    emit Overloads("ERC20 version");
  }
}
