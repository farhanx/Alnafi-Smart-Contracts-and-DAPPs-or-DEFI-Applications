// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract MarketpriceFromChainlink {
    AggregatorV3Interface internal dataFeed;
    int public price;

     /**
     * Network: Sepolia79
     * Aggregator: BTC/USD
     * Address: 0x1b44F3514812d835EB1BDB0acB33d3fA3351Ee43
     */
    constructor() {
        dataFeed = AggregatorV3Interface(
            0x1a81afB8146aeFfCFc5E50e8479e826E7D55b910
        );
    }


      /**
     * Returns the latest answer.
     */
    function getChainlinkDataFeedLatestAnswer() public  returns (int) {
        // prettier-ignore
        (
            /* uint80 roundID */,
            int answer,
            /*uint startedAt*/,
            /*uint timeStamp*/,
            /*uint80 answeredInRound*/
        ) = dataFeed.latestRoundData();

        price = answer;
        return answer;
    }
}