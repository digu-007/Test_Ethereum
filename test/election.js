var Election = artifacts.require("./Election.sol");

contract("Eletion", function(accounts) {
    it("two candidates", function() {
        return Election.deployed().then(function(instance) {
            return instance.cnt();
        }).then(function(count) {
            assert.equal(count, 2);
        });
    });

    it("check bot", function() {
        return Election.deployed().then(function(instance) {
            return instance.candidates(1);
        }).then(function(c) {
            assert.equal(c[0], 1);
            assert.equal(c[1], "chirag");
            assert.equal(c[2], 0);
        });
    });
});