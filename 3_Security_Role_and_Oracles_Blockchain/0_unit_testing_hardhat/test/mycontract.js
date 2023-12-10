const {expect} = require("chai");
const { ethers } = require("hardhat");

describe("Initialization", function(){

    it("The values in constructor supposed to be same as hardcoded", async function(){
        const [owner] = await ethers.getSigners();
        const _mycontract = await ethers.deployContract("MyContract");

        const jsonret = await _mycontract.getDetails();

        expect(jsonret[0]).to.equal("Arbaz");
        expect(jsonret[1]).to.equal(34);
        expect(jsonret[2]).to.equal(true);

    }),

    it("The admin supposed to be the owner address or first account address", async function(){
        const [owner] = await ethers.getSigners();
        const _mycontract = await ethers.deployContract("MyContract");
     
        const _admin = await _mycontract.returnAdmin();

        expect(owner.address).to.equal(_admin);
    })

}),

describe("Post Deployment", function(){

    it("Test if setDetail function is working", async function(){
        const [owner] = await ethers.getSigners();
        const _mycontract = await ethers.deployContract("MyContract");


        const _age = 99;
        const _name = "Jamshed"; 
        const _is_student = false;

        const tx = await _mycontract.setDetails(_name,_age,_is_student);

        const jsonret = await _mycontract.getDetails();

        expect(jsonret[0]).to.equal("Jamshed");
        expect(jsonret[1]).to.equal(99);
        expect(jsonret[2]).to.equal(false);

    }),

    it("Non-admin user should not to get the secret values", async function(){
        const [owner,account1,account2] = await ethers.getSigners();
        const _mycontract = await ethers.deployContract("MyContract");

         await expect(_mycontract.connect(account1).returnSecretValue()).to.be.revertedWith("You are not an admin, please go away!");

    }),

    it("admin user should get the secret values without revert", async function(){
        const [owner,account1,account2] = await ethers.getSigners();
        const _mycontract = await ethers.deployContract("MyContract");

         const jsonobj = await _mycontract.connect(owner).returnSecretValue();
         
         expect(jsonobj).to.not.be.reverted;
         expect(jsonobj).to.equal(5572);

    })


})
