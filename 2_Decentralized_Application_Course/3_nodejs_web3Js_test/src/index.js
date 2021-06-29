const web3 = new Web3(window.ethereum);
console.log(web3);
const accounts =  web3.eth.getAccounts();
console.log(accounts);