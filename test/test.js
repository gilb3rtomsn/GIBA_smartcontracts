const { expect } = require("chai");

describe("GIBAToken", function () {
  it("Should mint tokens", async function () {
    const [owner, addr1] = await ethers.getSigners();
    const Token = await ethers.getContractFactory("GIBAToken");
    const token = await Token.deploy();
    await token.mint(addr1.address, 1000);
    expect(await token.balanceOf(addr1.address)).to.equal(1000);
  });
});
