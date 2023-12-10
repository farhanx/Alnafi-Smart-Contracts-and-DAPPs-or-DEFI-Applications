var mycontract = artifacts.require('mycontract');

contract("mycontract", async(accounts) => {

    it("the values in constructor must be same as hardcoded", ()=>{

        return mycontract.deployed().then(instance=>{
            
           return instance.getDetails.call().then(function(jasonret){

                assert.equal(jasonret[0],"Javed","The name should be same as what was fixed at the time of constructor");
                assert.equal(jasonret[1],11,"The age should be same as what was fixed at the time of constructor");
                assert.equal(jasonret[2],true,"The student must be true which is setup in constructor");
                
            });
        });
    
    }),

    it("test if setDetail function is working", ()=>{

        return mycontract.deployed().then(instance=>{

            const _age = 99;
            const _name = "Farhan Khan";
            const _is_student = false;
            
           return instance.setDetails(_name,_age,_is_student,{from:accounts[0]}).then(function(){return instance.getDetails.call().then(function(jasonret){

                assert.equal(jasonret[0],"Farhan Khan","The setDetail function must properly set the name variable");
                assert.equal(jasonret[1],99,"The setDetail function must properly set the age variable");
                assert.equal(jasonret[2],false,"The setDetail function must properly set the boolean variable");
                
               });
            });
        });
    }),

    it("Style 2: Set new input values ", async ()=>{
    
        var instance = await mycontract.deployed();

        const _age = 55;
        const _name = "Shahzaib ABC";
        const _is_student = true;

        var jsonret = await instance.setDetails(_name,_age,_is_student,{from:accounts[0]});

       // assert.equal(jsonret[0],"Javed","The name should be same as what was fixed at the time of constructor");
       // assert.equal(jsonret[1],11,"The age should be same as what was fixed at the time of constructor");
       // assert.equal(jsonret[2],true,"The student must be true which is setup in constructor");

    }),


    it("Style 2: check if input values are correctly stored", async ()=>{
    
        var instance = await mycontract.deployed();

        var jsonret = await instance.getDetails.call();

        assert.equal(jsonret[0],"Shahzaib ABC","The name should be same as what was fixed at the time of constructor");
        assert.equal(jsonret[1],55,"The age should be same as what was fixed at the time of constructor");
        assert.equal(jsonret[2],true,"The student must be true which is setup in constructor");

    }),

    it("test if non-admin is not able to get secret value", async ()=>{
    
        var instance = await mycontract.deployed();

        var jsonret 
        var conditionpassed = false;
        
        try {

            jsonret = await instance.returnSecretValue.call({from:accounts[0]});
            
        } catch ({error}) {
            
            conditionpassed = true;
        }

         assert.equal(conditionpassed,true,"The  function caller should only be the admin ");
        // assert.equal(jsonret[1],55,"The age should be same as what was fixed at the time of constructor");
        // assert.equal(jsonret[2],true,"The student must be true which is setup in constructor");

    });

});