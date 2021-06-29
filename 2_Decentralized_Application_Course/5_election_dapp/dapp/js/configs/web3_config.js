let web3;
let myaccount;
let network_id;

const getWeb3 = () => {
    return new Promise((resolve, reject) => {
      window.addEventListener("load", async () => {
        if (window.ethereum) {
          const web3 = new Web3(window.ethereum);
          console.log("webe object is initialized successfully");
          try {
            // ask user permission to access his accounts
            await window.ethereum.request({ method: "eth_requestAccounts" });
            resolve(web3);

          } catch (error) {
            reject(error);
          }
        } else {
          reject("must install MetaMask");
        }
      });
    });
  };


  async function  initializeApp()
  {
      web3 = await getWeb3();
      console.log(web3);

      myaccount = await web3.eth.getAccounts();
      console.log(myaccount);

      network_id = await web3.eth.net.getId();
      console.log(network_id);

      window.ethereum.on("accountsChanged",logAccounts);
  }


  const logAccounts = (accounts) => {
    console.log(`Accounts:\n${accounts.join('\n')}`);
    myaccount[0] = `${accounts.join('\n')}`;
  };
  

  initializeApp();