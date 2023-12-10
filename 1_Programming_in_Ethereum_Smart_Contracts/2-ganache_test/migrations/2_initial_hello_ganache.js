const hello = artifacts.require("hello_ganache");

module.exports = function (deployer) {
  deployer.deploy(hello);
};
