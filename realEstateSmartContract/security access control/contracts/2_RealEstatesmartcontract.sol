// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;


contract RealEstateAggreement {
    address private owner;
    uint256 public price;
    bool public sellerPaysClosingFees;

    constructor(uint256 _price) {
        owner = msg.sender;
        price = _price;
        sellerPaysClosingFees = false;
    }

    function setPrice(uint256 _price) public onlyOwner {
        require(owner == msg.sender, "Only owner can update agrement terms.");
        price = _price;
    }

    // function setPrice(uint256 _price ) public {
    //     price = _price; 

    // }   

    function setClosingFeeAgreement(bool _ownerPays) public onlyOwner{
        sellerPaysClosingFees = _ownerPays;
    }

    modifier onlyOwner() {
        require (owner == msg.sender , "only owner can update agreement terms.");
        _;
    }
}
