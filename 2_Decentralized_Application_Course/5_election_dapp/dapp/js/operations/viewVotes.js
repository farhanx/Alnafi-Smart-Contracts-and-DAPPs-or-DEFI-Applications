
function viewAllVotes()
{
    candidate_contract.methods.getPartiesList().call((error,result) => {
    
        if(result)
        {
            for(var loop=0; loop<result.length;loop++)
            {
                getCount(result[loop]);
            }
        }

    });
} 


function getCount(partyname)
{
    voter_contract.methods.getVotesByParty(partyname).call((error,result)=>{

        console.log(partyname+" has "+result+" votes");

        $("ul").append("<li> "+partyname+" has "+result+" votes </li>");
    });
}