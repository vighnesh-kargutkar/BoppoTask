// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Election {
    // Owner of the contract
    address public owner;

    // Election states
    enum ElectionState { Created, Voting, Ended }
    ElectionState public state;

    // Candidate struct
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    // Voter struct
    struct Voter {
        bool authorized;
        bool voted;
        uint vote;
    }

    // Candidates
    mapping(uint => Candidate) public candidates;
    uint public candidatesCount;

    // Voters
    mapping(address => Voter) public voters;
    uint public totalVotes;

    // Events
    event ElectionStarted();
    event ElectionEnded();
    event VoterAuthorized(address voter);
    event VoteCast(address voter, uint candidateId);

    // Modifiers
    modifier ownerOnly() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    modifier inState(ElectionState _state) {
        require(state == _state, "Invalid state for this action");
        _;
    }

    constructor() {
        owner = msg.sender;
        state = ElectionState.Created;
    }

    // Function to add a candidate
    function addCandidate(string memory _name) public ownerOnly inState(ElectionState.Created) {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    // Function to authorize a voter
    function authorizeVoter(address _voter) public ownerOnly inState(ElectionState.Created) {
        voters[_voter].authorized = true;
        emit VoterAuthorized(_voter);
    }

    // Function to start the election
    function startElection() public ownerOnly inState(ElectionState.Created) {
        state = ElectionState.Voting;
        emit ElectionStarted();
    }

    // Function to end the election
    function endElection() public ownerOnly inState(ElectionState.Voting) {
        state = ElectionState.Ended;
        emit ElectionEnded();
    }

    // Function to vote
    function vote(uint _candidateId) public inState(ElectionState.Voting) {
        require(voters[msg.sender].authorized, "You are not authorized to vote");
        require(!voters[msg.sender].voted, "You have already voted");
        require(_candidateId > 0 && _candidateId <= candidatesCount, "Invalid candidate ID");

        voters[msg.sender].voted = true;
        voters[msg.sender].vote = _candidateId;
        candidates[_candidateId].voteCount++;
        totalVotes++;

        emit VoteCast(msg.sender, _candidateId);
    }

    // Function to get the winner
    function getWinner() public view inState(ElectionState.Ended) returns (string memory winnerName) {
        uint maxVotes = 0;
        uint winningCandidateId = 0;

        for (uint i = 1; i <= candidatesCount; i++) {
            if (candidates[i].voteCount > maxVotes) {
                maxVotes = candidates[i].voteCount;
                winningCandidateId = i;
            }
        }

        winnerName = candidates[winningCandidateId].name;
    }
}
