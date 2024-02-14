# Lottery Smart Contract

This Lottery smart contract, written in Solidity, enables a decentralized and transparent way to run a lottery. Participants can enter the lottery by sending ETH, and the contract automatically selects a random winner to receive the entire pot. This project demonstrates the use of smart contracts for creating trustless, automated systems for financial games.

## Features

- Decentralized Lottery System: Allows users to participate in a lottery without a central authority.
- Automated Winner Selection: Utilizes blockchain data to generate a pseudo-random winner.
- Transparent Lottery History: Stores the winners of each lottery, providing transparency and trust in the lottery process.
- Owner-Only Functions: Includes security measures to ensure that only the contract owner can pick winners.

## Technology Stack

- Solidity ^0.8.13: For writing the smart contract.
- Ethereum Blockchain: To deploy and run the smart contract.

## Smart Contract Functions

- `enter()`: Allows players to enter the lottery with a minimum payment.
- `getRandomNumber()`: Generates a pseudo-random number based on blockchain data.
- `pickWinner()`: Selects the lottery winner based on the random number and transfers the pot balance.
- `getPotBalance()`: Returns the current balance of the lottery pot.
- `getPlayers()`: Returns the list of current lottery participants.
- `getWinnerByLottery(uint lottery)`: Returns the winner of a specific lottery round.

## Deployment

To deploy this contract to the Ethereum blockchain, you will need:

1. An Ethereum wallet with Ether for deploying the contract.
2. A development environment like [Remix IDE](https://remix.ethereum.org/), [Truffle](https://www.trufflesuite.com/), or [Hardhat](https://hardhat.org/).

### Steps

1. Compile the Contract:: Use a Solidity compiler with version ^0.8.13.
2. Deploy: Through your chosen environment, deploy the contract to your desired Ethereum network (mainnet/testnets).
3. Verify: Optionally, verify the contract on Etherscan for public transparency.

## Interacting with the Contract

After deployment, interact with the contract through web3 libraries such as Web3.js or Ethers.js, or directly through Ethereum wallets that support smart contract interactions.

- Entering the Lottery: Send a transaction with the minimum ETH required to the `enter` function.
- Picking a Winner: If you're the owner, call the `pickWinner` function to select a winner and distribute the pot.

## Security Considerations

- The `pickWinner` function is restricted to the contract owner to prevent unauthorized access.
- The randomness mechanism in `getRandomNumber` is not fully secure and could be susceptible to manipulation by miners. For educational and demonstration purposes only.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE) file for details.

## Acknowledgments

- The Ethereum community for providing extensive resources on Solidity and smart contract development.