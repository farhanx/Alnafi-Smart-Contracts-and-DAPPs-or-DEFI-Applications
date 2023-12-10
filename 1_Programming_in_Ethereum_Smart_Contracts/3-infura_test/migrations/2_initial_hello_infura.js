const hello = artifacts.require("hello_infura");

module.exports = function (deployer) {
  deployer.deploy(hello);
};
