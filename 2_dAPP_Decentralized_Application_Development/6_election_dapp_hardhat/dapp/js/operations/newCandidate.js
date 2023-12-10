
async function onSubmitForm()
{
    var fname =  $("#fname").val();
    var lname =  $("#lname").val();
    var party =  $("#party").val();
    var symbol =  $("#symbol").val();
    var ecaddress =  $("#ec_address").val();

    console.log("fname = "+fname+" lname="+lname+" party = "+party+" symbol="+symbol+" ec_address="+ecaddress);

    const account = web3.utils.toChecksumAddress(myaccount[0]);
    const _gasPrice = await web3.eth.getGasPrice();
    const _gasEstimatedCost =  await ec_contract.methods.insertNewCandidate(fname,lname,party,symbol,ecaddress).estimateGas({from:account});

    console.log("estimated Price: "+_gasEstimatedCost+" gas price:"+_gasPrice);

    ec_contract.methods.insertNewCandidate(fname,lname,party,symbol,ecaddress).send({from: myaccount[0],gasPrice: _gasPrice, gas:_gasEstimatedCost},
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

