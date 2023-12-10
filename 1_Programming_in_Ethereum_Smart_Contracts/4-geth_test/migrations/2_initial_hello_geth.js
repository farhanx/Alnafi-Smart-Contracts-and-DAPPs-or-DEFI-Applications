const hello = artifacts.require("hello_geth");

module.exports = function (deployer) {
  deployer.deploy(hello);
};
