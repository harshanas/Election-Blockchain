pragma solidity ^0.5.0;

contract Election {
	// Model a Candidate
	struct Candidate {
		uint id;
		string name;
		uint voteCount;
	}
	// Store accounts that have voted
	mapping(address => bool) public voters;
	// Store Candidates
	// Fetch Candidate
	mapping(uint => Candidate) public candidates; // List of Candidates
	// Store Candidates Count
	uint public candidatesCount; // in a uint the default value is 0

	event votedEvent(
		uint indexed _candidateId
	);
	constructor () public {
		addCandidate("Candidate 1");
		addCandidate("Candidate 2");
	}

	function addCandidate (string memory _name) private {
		// This Function is private because We only need our Contract to add Candidates
		candidatesCount ++;
		candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
	}

	function vote(uint _candidateId) public {
		// require that they haven't voted before
		require(!voters[msg.sender]);
		
		// require a valid candidate
		require(_candidateId > 0 && _candidateId <= candidatesCount);

		// record that voter has voted
		voters[msg.sender] = true;

		// update candidates vote count
		candidates[_candidateId].voteCount ++;

		emit votedEvent(_candidateId);
	}
}