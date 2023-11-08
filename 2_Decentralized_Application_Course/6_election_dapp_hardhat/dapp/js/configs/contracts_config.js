let EcContractAddress = "0x5fbdb2315678afecb367f032d93f642f64180aa3";
let candidateContractAddress ="";
let voterContractAddress ="";

//contract objects
let ec_contract= null;
let candidate_contract;
let voter_contract;


const getElectionCommissionContract = async(web3) => {

    const ec_data = await $.getJSON("./js/contracts/ElectionCommission.json");

    ec_contract = await new web3.eth.Contract(ec_data.abi,EcContractAddress);
    
    console.log("Loaded ElectionCommission Contract Object: "+ec_contract)

    return ec_contract;
}

const getCandidateContract = async(web3) => {

    const ec_data = await $.getJSON("./js/contracts/Candidate.json");

    await ec_contract.methods.getCandidateContractAddress().call().then((result)=>{

            candidateContractAddress = result;
            console.log("Loaded Candidate Contract Address: "+result);

            candidate_contract =  new web3.eth.Contract(ec_data.abi,candidateContractAddress);
            return candidate_contract;

    }).catch((error=>{
        console.log(error)
    }))
}


const getVoterContract = async(web3) => {

    const ec_data = await $.getJSON("./js/contracts/Voter.json");

    await ec_contract.methods.getVoterContractAddress().call().then((result)=>{

        if(result)
        {
            voterContractAddress = result;
            console.log("Loaded Voter Contract Address: "+ result);

            voter_contract =  new web3.eth.Contract(ec_data.abi,voterContractAddress);
            return voter_contract;
        }

    }).catch(error=>{
        console.log(error)
    });

}

async function initSetup()
{
    web3 = await getWeb3();

     await getElectionCommissionContract(web3);

     await getCandidateContract(web3);

     await getVoterContract(web3);

     try
     {
         loadPage();
     }
     catch(error)
     {
         console.log("Load page is not defined by child page :"+error);
     }

}

initSetup();

