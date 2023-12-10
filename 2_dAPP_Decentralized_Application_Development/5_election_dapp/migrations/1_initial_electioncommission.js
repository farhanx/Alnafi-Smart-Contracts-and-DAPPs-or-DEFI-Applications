const ec = artifacts.require("ElectionCommission");

module.exports = function (deployer) {
  deployer.deploy(ec);
};
