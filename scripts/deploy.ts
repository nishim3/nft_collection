import { ethers } from "hardhat";

async function main() {

  const nft = await ethers.deployContract("SampleToken",['0x9E3AA97CDda251F6D77648c8176B9ef21Dd532a5']);

  await nft.waitForDeployment();

  console.log(
    `${await nft.getAddress()}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
