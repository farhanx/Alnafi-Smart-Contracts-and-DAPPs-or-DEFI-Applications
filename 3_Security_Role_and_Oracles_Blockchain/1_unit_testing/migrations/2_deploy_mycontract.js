const mycontract = artifacts.require("mycontract");

module.exports = function (deployer) {
  deployer.deploy(mycontract);
};
