//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import "./PriceConvertor.sol";
error NotOwner();

contract FundMe {
    uint256 public constant minimumUsd = 5e18;
    address[] public funders;
    mapping(address funder => uint256 amountFunded)
        public addressToAmountFunded;
    using PriceConvertor for uint256;

    address public immutable i_owner;
    AggregatorV3Interface private s_priceFeed;

    constructor(address priceFeed) {
        i_owner = msg.sender;
        s_priceFeed = AggregatorV3Interface(priceFeed);
    }

    function fund() public payable {
        require(
            msg.value.getConversionRate(s_priceFeed) >= minimumUsd,
            "Min value is 1 ETH"
        ); //1 eth = 1 * 10 ** 18
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
    }

    function withdraw() public onlyOwner {
        uint256 fundersLength = funders.length;
        for (
            uint256 indexFunder = 0;
            indexFunder < fundersLength;
            indexFunder++
        ) {
            address funder = funders[indexFunder];
            addressToAmountFunded[funder] = 0;
        }
        funders = new address[](0);

        //transfer
        //payable(msg.sender).transfer(address(this).balance);

        //send
        //bool checkSuccess = payable(msg.sender).send(address(this).balance);
        //require(checkSuccess, "Send failed");

        //call
        (bool callSuccess, ) = payable(msg.sender).call{
            value: address(this).balance
        }("");
        require(callSuccess, "Call failed");
    }

    modifier onlyOwner() {
        //require(msg.sender == i_owner, "You are not the owner!");
        if (msg.sender != i_owner) {
            revert NotOwner();
        }
        _; //execute everything inside the function where the modifier used
    }

    function getVersion() public view returns (uint256) {
        return s_priceFeed.version();
    }

    receive() external payable {
        //executed if the calldata is empty
        fund();
    }

    fallback() external payable {
        //executed if the calldata isn't empty
        fund();
    }

    function getAddressToAmmountFunded(
        address fundingAddress
    ) external view returns (uint256) {
        return addressToAmountFunded[fundingAddress];
    }

    function getFunder(uint256 index) external view returns (address) {
        return funders[index];
    }

    function getOwner() external view returns (address) {
        return i_owner;
    }
}
