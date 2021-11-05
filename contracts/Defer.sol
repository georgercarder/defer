//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Deferer {
    
    constructor() {
    }

    modifier defer(
      function(bytes memory) returns(bool) hook
    ) {
      _;
      // want to access returnPtr of calling function
      // then do stuff
    }

}

contract Test is Deferer {

  function testHook(bytes memory input) private returns(bool) {
    (uint256 test) = abi.decode(input, (uint256));
    
    // do something

    return true;
  }

  function subroutine() defer(testHook) private returns(uint256) {
    // TODO make nebulous logical structure

    // possibly try to overwrite return and test in the `test`
    return 123;
  }

  function test() external {
    uint256 expected = 123;
    require(subroutine() == expected, "subroutine() != expected");
  }
}
