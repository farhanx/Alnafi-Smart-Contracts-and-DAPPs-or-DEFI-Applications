
function getCandidateProfile()
{

    var params = new URLSearchParams(location.search);
    var partyname = params.get('v');
    console.log(params.get('v'));

    candidate_contract.methods.getCandidateDataByPartyName(partyname).call((error,result)=>
    {
        console.log(result[0]);

        $("#mytable").append("<tr><td>"+ result[0]+"</td><td>"+result[1]+"</td><td>"+ result[2]+"</td><td> <img id='myimage' width='100' height='100'> </td><td>"+ result[4]+"</td>");

        const cid =result[3];

        loadImage(cid);

    });

}

async function loadImage(validCID)
{

  // https://github.com/ipfs/js-ipfs/blob/master/docs/core-api/FILES.md

  for await (const file of ipfs.get(validCID)) {
    console.log(file.path)
    console.log(file);
  
    //files.forEach((file) => {
      console.log(file.path);

      const content = []

      for await (const chunk of file.content) {
        content.push(chunk)
      }
      
      document.getElementById('myimage').src = URL.createObjectURL(
        new Blob(content, { type: 'image/jpeg' } /* (1) */)
      );
  
  }


}

function loadPage()
{
    getCandidateProfile();7
}


