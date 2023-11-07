require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */9
module.exports = {
  solidity: "0.8.19",
  networks: {
    hardhat: {
      initialBaseFeePerGas: 0
    },
    sepolia: {
      url: "https://sepolia.infura.io/v3/[project key]",
      accounts: ['..your private key of your sepolia account ']
    }
  },
  
};
