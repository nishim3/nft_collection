// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract SampleToken is ERC721, ERC721URIStorage, ERC721Burnable, Ownable{
    uint256 private _nextTokenId;

    constructor(address initialOwner)
        ERC721("SampleToken", "STK")
        Ownable(initialOwner)
    {}
    //wtf is happening
    function _baseURI() internal pure override returns (string memory) {
        return "ipfs://bafybeicpuy3exjgynk5g2oeckoymvyoxqwydwpnaj3xj4nwdsnkpf6ggri/";
    }

    function safeMint(address to) public onlyOwner {
        uint256 tokenId = _nextTokenId++;
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, string.concat(Strings.toString(tokenId+1),".json") );
    }

    // The following functions are overrides required by Solidity.

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}