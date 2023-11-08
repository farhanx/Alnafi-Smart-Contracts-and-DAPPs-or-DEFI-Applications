function verifyMyVote()
{

    var partyname = $("#parties").val();

    voter_contract.methods.verifyMyVote(partyname).call().then((result)=>{
    
        if(result)
        {
            console.log(result);
        }
    
    }).catch(error=>{
        console.log(error)
    })


    
}


function getParties()
{
    candidate_contract.methods.getPartiesList().call().then((result) => {

        console.log(result);

        result.forEach(element => { $("#parties").append("<option value='"+element+"'>"+element+"</option>");
            
        });

    }).catch(error=>{
        console.log(error)
    })


}


function loadPage()
{
    $("#account").val(myaccount[0]);

    getParties();
}