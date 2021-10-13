const Migrations = artifacts.require("FHKTokens");

module.exports = function (deployer) {
  deployer.deploy(Migrations);
};
