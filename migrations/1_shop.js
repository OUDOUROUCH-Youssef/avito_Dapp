const MyContract = artifacts.require("shop");

module.exports = function (deployer) {
  deployer.deploy(MyContract);
};
