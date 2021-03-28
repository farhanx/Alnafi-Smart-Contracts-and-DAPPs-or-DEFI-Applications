const helloworldObj = artifacts.require("HelloWorld");

module.exports = function (deployer) {
  deployer.deploy(helloworldObj);
};
