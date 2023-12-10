
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



function insertVote()
{

    console.log($("#parties").val());

    var partyname = $("#parties").val();
    var nicop = $("#nicop").val();

   voter_contract.methods.insertVoteByParty(nicop,partyname).send({from: myaccount[0],gasPrice: web3.utils.toWei("4.1","Gwei")},
   (error,result) => {

        if(result)
        {
            $("#resultdiv").text(result);
        }
   }); 

}

function loadPage()
{
    $("#account").val(myaccount[0]);
    console.log(" test");

    getParties();
}