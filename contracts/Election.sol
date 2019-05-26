pragma solidity ^0.5.0;

contract Election {
	// Model a Candidate
	struct Candidate {
		uint id;
		string name;
		uint voteCount;
	}
	// Store Candidates
	// Fetch Candidate
	mapping(uint => Candidate) public candidates; // List of Candidates
	// Store Candidates Count
	uint public candidatesCount; // in a uint the default value is 0

	constructor () public {
		addCandidate("Candidate 1");
		addCandidate("Candidate 2");
	}

	function addCandidate (string memory _name) private {
		// This Function is private because We only need our Contract to add Candidates
		candidatesCount ++;
		candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
	}
}