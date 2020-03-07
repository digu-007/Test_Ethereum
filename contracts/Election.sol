pragma solidity >= 0.4.2;

contract Election {
    struct Candidate {
        uint id;
        string name;
        uint votes;
    }

    mapping(uint => Candidate) public candidates;

    uint public cnt;

    constructor () public {
        add("chirag");
        add("tony");
    }

    function add(string memory _name) private {
        ++cnt;
        candidates[cnt] = Candidate(cnt, _name, 0);
    }
}