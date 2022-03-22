// SPDX-License-Identifier: Unlicense
pragma solidity 0.8.10;

import "ds-test/test.sol";
import "../Overloads.sol";

contract OverloadsTest is DSTest {
  Overloads public c;

  function setUp() public {
    c = new Overloads();
  }

  function testPayablePayableButNot() public {
    c.payableButNot(0x001d3F1ef827552Ae1114027BD3ECF1f086bA0F9);
  }

  function testErc20PayableButNot() public {
    c.payableButNot(0x001d3F1ef827552Ae1114027BD3ECF1f086bA0F9, 0x001d3F1ef827552Ae1114027BD3ECF1f086bA0F9, 1000);
  }
}
