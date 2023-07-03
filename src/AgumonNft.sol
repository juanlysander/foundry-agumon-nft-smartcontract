// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract AgumonNft is ERC721 {
    error AgumonNft__CantFlipIfNotOwner();

    uint256 private s_tokenCounter;
    string private s_agumonEggSvgImageUri;
    string private s_agumonHatchSvgImageUri;

    enum State {
        EGG,
        HATCH
    }
    mapping(uint256 => State) private s_tokenIdToState;

    constructor(
        string memory agumonEggSvgImageUri,
        string memory agumonHatchSvgImageUri
    ) ERC721("Agumon Nft", "AGUM") {
        s_tokenCounter = 0;
        s_agumonEggSvgImageUri = agumonEggSvgImageUri;
        s_agumonHatchSvgImageUri = agumonHatchSvgImageUri;
    }

    function mintNft() public {
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
        s_tokenIdToState[s_tokenCounter] = State.EGG;
    }

    function flipState(uint256 tokenId) public view {
        if (!_isApprovedOrOwner(msg.sender, tokenId)) {
            revert AgumonNft__CantFlipIfNotOwner();
        }
        if (s_tokenIdToState[tokenId] == State.EGG) {
            s_tokenIdToState[tokenId] == State.HATCH;
        } else {
            s_tokenIdToState[tokenId] == State.EGG;
        }
    }

    function _baseURI() internal pure override returns (string memory) {
        return "data:application/json;base64,";
    }

    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        string memory imageURI;

        if (s_tokenIdToState[tokenId] == State.EGG) {
            imageURI = s_agumonHatchSvgImageUri;
        } else {
            imageURI = s_agumonEggSvgImageUri;
        }

        return
            string(
                abi.encodePacked(
                    _baseURI(),
                    Base64.encode(
                        bytes(
                            abi.encodePacked(
                                '{"name": "',
                                name(),
                                '", "description": "An NFT of Agumon life state.", "attributes": [{"trait_type": "Strength", "value": 85},{"trait_type": "Agility","value": 73},{"trait_type": "Intelligent","value": 68}], "image": "',
                                imageURI,
                                '"}'
                            )
                        )
                    )
                )
            );
    }
}
