
function viewAllVotes()
{
    candidate_contract.methods.getPartiesList().call().then((result) => {
    
        if(result)
        {
            for(var loop=0; loop<result.length;loop++)
            {
                getCount(result[loop]);
            }
        }

    }).catch(error=>{
        console.log(error)
    })

} 


function getCount(partyname)
{
    voter_contract.methods.getVotesByParty(partyname).call().then((result)=>{

        console.log(partyname+" has "+result+" votes");

        $("ul").append("<li> "+partyname+" has "+result+" votes </li>");
    }).catch(error=>{
        console.log(error)
    })

}