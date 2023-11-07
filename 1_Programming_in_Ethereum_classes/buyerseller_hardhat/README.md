# Hardhat Project and Commands


This guide will help you how to work on hardhat easily without giving extra details. 

The comprehensive guide is available on the official hardhat documentations : https://hardhat.org/hardhat-runner/docs/getting-started#overview 

Pre-requisites: Make sure you have the latest version of NodeJS / NPM 

## Initialize Hardhat Project 

1. Open VSCode and create a workspace folder.
2. Install hardhat by calling 
>  npm install --save-dev  hardhat 
3. Then call the new command to initialize a project
> npx hardhat 
4. Select "Create a Javascript Project" 
5. Say yes for required questions and enter
6. It will create contract , scripts, hardhat.config.js and test etc folders.
7. Now install the hardhat toolbox package 
> npm install --save-dev "@nomicfoundation/hardhat-toolbox@^3.0.0"
8. now again write a command
> npx hardhat 
9. Now you can see usage of hardhat and help etc.
10. Now you are ready to compile and test your work.

## Compile and Test a Contract
1. Write a command to compile the contract it will create artifacts folder. Also it will download the solidity compiler.
> npx hardhat compile
2. Now write a test command to unit test your contracts
> npx hardhat test



## Deploy the contract on the local network and run a Node
1. Write a deployment command as below
>  npx hardhat run scripts/deploy.js 
2. It will returns a contract address (This is just written in cache)
3. Now lets run a local hardhat node and use the same command
> npx hardhat node
4. You will see accounts and RPC address now your node is working.
5. Now open another commandline 
6. Now we will deploy same contract on the hardhat node by mentioning localhost 
> npx hardhat run scripts/deploy.js --network localhost
3. This will return a contract address.
4. If you go back to the node which is running; you will see something like below details;


```shell
Contract deployment: Lock
  Contract address:    0x5fbdb2315678afecb367f032d93f642f64180aa3
  Transaction:         0x53c6caa0055d23aac52f2e281f471b404b52c2f5d28b311d559558c7118e10e5
  From:                0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266
  Value:               0.001 ETH
  Gas used:            326112 of 30000000
  Block #1:            0xd92cb9e101162d5a9f63912d607e3ff49bb896c30b3395b1c9349d3c24df4a0e
  ```

## Add Network to the Metamask 
0. In the config file add the following code

```shell
networks: {
    hardhat: {
      initialBaseFeePerGas: 0
    },
  },
  ```
1. Check the node starting point on the cmd
2. It will show you the JSON RPC server url.
3. It will also show you the list of accounts with private keys.
4. Now copy the url and add it in Metamask "manually add network"
5. Now copy the private key of any account and import that account on the metamask.
6. You will see 10,000 ETH. 
7. Repeat with another account
8. Transfer balance between each other

## Sepolia Network Setup and Deploy

1. Add network details inside hardhat.config.js 
2. Go to infura.io , create a new project key
3. Click endpoints then select Ethereum 
4. From the ethereum list select Sepolia
5. Copy the endpoint url
6. Paste the url under sepolia as below
7. Connect your metamask with sepolia network.
8. Make sure you have some Sepolia Ethers inside

```shell
 networks: {
    hardhat: {
    },
    sepolia: {
      url: "https://sepolia.infura.io/v3/<project key>",
      accounts: ['<secretkey>']
    }
  },
```
9. Open the terminal 
10. call the deployment script

```shell
npx hardhat run scripts/deploy.js --network sepolia
```
11. you will see the result like below with the contract address.

> Lock with 0.001ETH and unlock timestamp 1698593041 deployed to 0x9D39B3ea8fA6b67974B6214dDb28c6282cED3ff4

12. Check your contract deployment details on the > https://sepolia.etherscan.io/

13. Search the address of your contract e.g. 0x9D39B3ea8fA6b67974B6214dDb28c6282cED3ff4

## Verify the contract on Sepolia Network 
1. If you call verify command directly like below , you will find an error that your API Key for etherscan is missing.
> e.g. npx hardhat verify --network sepolia 0x5FbDB2315678afecb367f032d93F642f64180aa
2. Make sure to signup an account on the etherscan.io and then create an API key
3. Use that key inside the config file as below
> etherscan: {
    apiKey:  '<key>'
  },

