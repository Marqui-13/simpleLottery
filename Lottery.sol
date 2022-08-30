// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Lottery {
    // GLOBAL VARIABLES
    address public owner;
    address payable[] public players;
    uint public lotteryId;
    mapping (uint => address payable) public lotteryHistory;

    constructor() {
        owner = msg.sender;
        lotteryId = 1;
    }

    // FUNCTIONS: enter(), getRandomNumber(), pickWinner(), getPotBalance(), getPlayers(), getWinnerByLottery()

    // Requires the players to have more than .01 ether, This function allows players to enter the lottery
    function enter() public payable {
        require(msg.value > .01 ether);

        // Address of player entering lottery
        players.push(payable(msg.sender));
    }

    // This function gets a random number for the pickWinner() function, no native random number generator in solidity, the blockchain itself is a deterministic state machine which means that if you know the state of the system at any given point in time, any future states are predictible reiterating the lack of randomness in the blockchain
    function getRandomNumber() public view returns (uint) {
        return uint(keccak256(abi.encodePacked(owner, block.timestamp)));
    }

    // This function picks the winner of the lottery
    function pickWinner() public onlyOwner {
        uint index = getRandomNumber() % players.length;
        players[index].transfer(address(this).balance);

        lotteryHistory[lotteryId] = players[index];
        lotteryId++;

        // Reset the state of the contract
        players = new address payable[](0);
    }

    // This function gets the current lottery pot balance
    function getPotBalance() public view returns (uint) {
        return address(this).balance;
    }

    // This function gets the players
    function getPlayers() public view returns (address payable[] memory) {
        return players;
    }

    // This function gets the winner of a specific lottery
    function getWinnerByLottery(uint lottery) public view returns (address payable) {
        return lotteryHistory[lottery];
    }


    // MODIFIER: onlyOwner()
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

}
