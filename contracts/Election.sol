pragma solidity >= 0.4.2;

contract Election {
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    mapping(address => bool) public voters;
    mapping(uint => Candidate) public candidates;

    uint public cnt;

    event votedEvent (
        uint indexed _candidateId
    );

    constructor () public {
        addCandidate("chirag");
        addCandidate("tony");
    }

    function addCandidate(string memory _name) private {
        ++cnt;
        candidates[cnt] = Candidate(cnt, _name, 0);
    }

    function vote(uint _candidateId) public {
        require(!voters[msg.sender], "voting twice!");
        require((_candidateId > 0 && _candidateId <= cnt), "invalid id!");

        voters[msg.sender] = true;
        ++candidates[_candidateId].voteCount;

        emit votedEvent(_candidateId);
    }
}