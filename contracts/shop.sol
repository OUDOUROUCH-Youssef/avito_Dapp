// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;


contract Shop{
    string public shopName;
    constructor(){
        shopName="Mr Khaoulaj Shop";
    }
    struct Product{
        uint id;
        string name;
        string description;
        bool sold;
        address payable owner;
        uint price;
    }

    mapping (uint => Product) public shopProducts;

    uint public count=0;
    function getData() public view returns (uint256) {
        return count;
    }
    
    function getProduct(uint _id) public view returns (uint, string memory, string memory, bool, address, uint) {
        Product memory product = shopProducts[_id];
        return (product.id, product.name, product.description, product.sold, product.owner, product.price);
    }

    event CreateProduct(uint id, string name, string description, uint price, address owner);
    event PurchasedProduct(uint id, string name, string description, uint price, address owner);

    function createShopProduct(string memory _name,  uint _price, string memory _description) public {
        require(_price > 0, "Price must be greater than zero.");
        
        require(bytes(_name).length > 0, "Product name cannot be empty.");
        require(bytes(_description).length > 0, "Product description cannot be empty.");
        count++;

        shopProducts[count] = Product(
            count, 
            _name, 
            _description, 
            false, 
            payable(msg.sender), 
            _price
        );

        emit CreateProduct(count, _name, _description, _price, msg.sender );
    }
    function purchaseShopProduct( uint _id)public payable{
        Product memory product= shopProducts[_id];
        require(msg.sender!= product.owner, "you can't bay this product, because you are the seller");
        require(!product.sold,"this product is not available");
        require(msg.sender.balance>=product.price, "You can't bay this product, your balance is less than the price");
        payable(product.owner).transfer(product.price);
        shopProducts[_id].owner=payable(msg.sender);
        shopProducts[_id].sold=true;

        emit CreateProduct(_id, product.name, product.description, product.price, product.owner );
        
    }
}