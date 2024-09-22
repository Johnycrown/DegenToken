// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {

    mapping(uint256 =>  StoreItem) public store;
    mapping (address => string[]) public redeemedAwards;
    uint256 storeId;
    StoreItem[] storeItems;

    constructor() ERC20("Degen", "DGN") {


    }
    struct StoreItem{
        string itemName;
        uint256 itemPrice;
       

    }
    function createStoreItem(string memory itemName, uint256 amount) external {
                storeId +=1;

        StoreItem storage storeitem = store[storeId];
        storeitem.itemName = itemName;
        storeitem.itemPrice = amount;
        storeItems.push(storeitem);

        
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
    function redeemDogenToken(uint256  itemsId) public {
        
       uint256 itemsValue = store[itemsId].itemPrice;
       require(itemsValue < balanceOf(msg.sender), "Insufficient balance to redeem this token");
       burnToken(itemsValue);
       StoreItem memory storeitem = store[itemsId];
       
      redeemedAwards[msg.sender].push(storeitem.itemName);


    }

    function viewStoreItems() external view returns (StoreItem[] memory) {
    
    return storeItems;
}

//account address:               0xEB7F414e77F55d50822F9FbFFA6781EaA8a26D9f  
//deployed contract address:     0x54c48DFB130F095002025aF38af6AfBbe042C8de
   //0x54c48DFB130F095002025aF38af6AfBbe042C8de

}
