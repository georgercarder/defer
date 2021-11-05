const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Test", function () {
  it("Should return the new greeting once it's changed", async function () {
    const Test = await ethers.getContractFactory("Test");
    const tester = await Test.deploy();
    await tester.deployed();

    await tester.test();
  });
});
