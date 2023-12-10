
function onSubmitForm()
{
    var fname =  $("#fname").val();
    var lname =  $("#lname").val();
    var party =  $("#party").val();
    var symbol =  $("#symbol").val();
    var ecaddress =  $("#ec_address").val();

    console.log("fname = "+fname+" lname="+lname+" party = "+party+" symbol="+symbol+" ec_address="+ecaddress);

    ec_contract.methods.insertNewCandidate(fname,lname,party,symbol,ecaddress).send({from: myaccount[0],gasPrice: web3.utils.toWei("4.1","Gwei")},
    (error,result) => 
    {
        if(result) 
        {
            console.log(result);

            $("#resultdiv").text(result);
        }
        else
            console.log(error);
    });
    

}

