function verifyMyVote()
{

    var partyname = $("#parties").val();

    voter_contract.methods.verifyMyVote(partyname).call((error,result)=>{
    
        if(result)
        {
            console.log(result);
        }
    
    });

    
}


function getParties()
{
    candidate_contract.methods.getPartiesList().call((error,result) => {

        console.log(result);

        result.forEach(element => { $("#parties").append("<option value='"+element+"'>"+element+"</option>");
            
        });

    });

}


function loadPage()
{
    $("#account").val(myaccount[0]);

    getParties();
}