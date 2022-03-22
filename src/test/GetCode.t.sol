// SPDX-License-Identifier: Unlicense
pragma solidity 0.8.10;

import "ds-test/test.sol";
import "v3-core/contracts/interfaces/IUniswapV3Factory.sol";

interface CheatCodes {
  function getCode(string calldata) external returns (bytes memory);
}

contract GetCodeTest is DSTest {
  CheatCodes public cheats = CheatCodes(HEVM_ADDRESS);
  IUniswapV3Factory public uniFactory;

  function testDeployOverloads () public {
    bytes memory bytecode = abi.encodePacked(cheats.getCode("./out/Overloads.sol/Overloads.json"));
    address overloads;
    assembly {
      overloads := create(0, add(bytecode, 0x20), mload(bytecode))
    }

    (bool success, bytes memory returnedData) = overloads.call(
      abi.encodeWithSignature(
        "payableButNot(address,address,uint256)",
        HEVM_ADDRESS,
        HEVM_ADDRESS,
        10
    ));

    assertTrue(success);
  }

  function testDeployUniswapV3Factory () public {
    bytes memory bytecode = abi.encodePacked(cheats.getCode("./src/UniswapV3Factory.abi.json"));
    address uni;
    assembly {
      uni := create(0, add(bytecode, 0x20), mload(bytecode))
    }

    uniFactory = IUniswapV3Factory(uni);
  }
}
