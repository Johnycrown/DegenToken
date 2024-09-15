// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {

    mapping(string=> uint256) public store;
    mapping (address => string[]) public redeemedAwards;

    constructor() ERC20("Degen", "DGN") {
        store["NFT"] = 20;
        store["Cup"] = 5;
        store["BasketBall"] = 6;
        store["ARTwork"] = 10;


    }

        function mint(address to, uint256 amount) public onlyOwner {
            _mint(to, amount);
    }


    function mintToken(address recipient, uint256 amount) public onlyOwner {
        _mint(recipient, amount);

    }

    function burnToken(uint amount)public{
        _burn(msg.sender, amount);
    }

    function trasnferToken(address recipient, uint256 amount ) external {
        require(amount <= balanceOf(msg.sender),"Insufficient balance " );
        approve(msg.sender, amount);
        transferFrom(msg.sender, recipient, amount);
      
    }
    function redeemDogenToken(string memory items) public {
       uint256 itemsValue = store[items];
       require(itemsValue < balanceOf(msg.sender), "Insufficient balance to redeem this token");
       burnToken(itemsValue);
       redeemedAwards[msg.sender].push(items);


    }

    function viewStoreItems() external view returns (string[] memory, uint256[] memory) {
    uint256[] memory itemPrices = new uint256[](4);
    string[] memory itemNames = new string[](4);


    itemNames[0] = "NFT";
    itemNames[1] = "Cup";
    itemNames[2] = "BasketBall";
    itemNames[3] = "ARTwork";

    itemPrices[0] = store["NFT"];
    itemPrices[1] = store["Cup"];
    itemPrices[2] = store["BasketBall"];
    itemPrices[3] = store["ARTwork"];

    return (itemNames, itemPrices);
}

//account address:               0xEB7F414e77F55d50822F9FbFFA6781EaA8a26D9f  
//deployed contract address:     0xbCE102F057386E5a24f87b3461b3b634AF8c3080  

   

}
