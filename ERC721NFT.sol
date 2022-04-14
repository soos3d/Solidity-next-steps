// contracts/GameItem.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract CoolCars is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;             // make public to see the token IDs created

    constructor() ERC721("Cool Cars", "CARS") {}

    function mintNFT(address player, string memory tokenURI)    //tokenURI are attributes, usually imported from a JSON 
        public
        returns (uint256)
    {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(player, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }
}