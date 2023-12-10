
function getCandidateProfile()
{

    var params = new URLSearchParams(location.search);
    var partyname = params.get('v');
    console.log(params.get('v'));

    candidate_contract.methods.getCandidateDataByPartyName(partyname).call().then((result)=>
    {
        console.log(result[0]);

        $("#mytable").append("<tr><td>"+ result[0]+"</td><td>"+result[1]+"</td><td>"+ result[2]+"</td><td> <img src='' id='canimage'> </td><td>"+ result[4]+"</td>");

        loadImageFromCid(result[3]);

    }).catch(error=>{
        console.log(error)
    })

}

async function loadImageFromCid(validCID) {

    console.log("Valid CID: "+validCID);

    content = [];

    for await (const chunk of ipfs.cat(validCID)) {
       // content = [...content,...chunk];

       content.push(chunk);

    }

    document.getElementById("canimage").src = URL.createObjectURL(
        new Blob(content, {type: 'image/jpeg'})
    );


}


function loadPage()
{
    getCandidateProfile();
}


