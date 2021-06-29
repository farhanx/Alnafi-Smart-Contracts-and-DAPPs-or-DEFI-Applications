
function getAllParties() 
{

    candidate_contract.methods.getPartiesList().call((error,result) => {

        console.log(result);

        result.forEach(element => { $("#ul1").append("<li> <a href='profile.html?v="+element+"'>"+element+" (version 1) </a></li>");
            
        });

    });

    candidate_contract.methods.getPartiesList().call((error,result) => {

        console.log(result);

        result.forEach(element => { $("#ul2").append("<li> <a href='profileIPFS.html?v="+element+"'>"+element+" (version 2)</a></li>");
            
        });

    });

}