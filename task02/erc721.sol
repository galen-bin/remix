pragma solidity ^0.8;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract  erc721 is ERC721{

    address owner;

  constructor() ERC721("MYNFT", "MFT") {
    owner=msg.sender;
  }

  modifier is_owner(){
    require(owner!=msg.sender,"not owner");
    _;
  }


  function mint(address owner,uint256 tikenid) external is_owner{

    super._mint(owner, tikenid);

  }





}
