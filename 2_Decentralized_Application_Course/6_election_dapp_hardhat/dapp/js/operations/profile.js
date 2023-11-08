
function getCandidateProfile()
{

    var params = new URLSearchParams(location.search);
    var partyname = params.get('v');
    console.log(params.get('v'));

    candidate_contract.methods.getCandidateDataByPartyName(partyname).call().then((result)=>
    {
        console.log(result[0]);

        $("#mytable").append("<tr><td>"+ result[0]+"</td><td>"+result[1]+"</td><td>"+ result[2]+"</td><td>"+ result[3]+"</td><td>"+ result[4]+"</td>");

    }).catch(error=>{
        console.log(error)
    })

}

function loadPage()
{
    getCandidateProfile();
}


