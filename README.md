****Web3 Ticket Shop****

**1- Introduction**

  The Web3 Ticket Shop is a decentralized application (dApp) built on Ethereum that allows users to create and purchase products in a shop environment using smart contracts. This project demonstrates the integration of blockchain technology with a React frontend, utilizing web3.js for Ethereum interactions.

**2- Technologies Used**

Blockchain: Ethereum

Smart Contract Language: Solidity

Frontend Framework: React

Styling: Tailwind CSS

Ethereum Library: web3.js

Development Tools: Truffle, Ganache

**3- Installation & Prerequisites**

Node.js and npm

Truffle Suite

Ganache (for local blockchain simulation)

**4- Steps**

*a- Clone the repository:*

    git clone https://github.com/yourusername/web3-ticket-shop.git
    cd web3-ticket-shop

*b- Install dependencies:*

    npm install
  
*c- Compile the smart contracts:*

    truffle compile
  
*d- Migrate the smart contracts to the local blockchain (Ganache):*

    truffle migrate
  
*e- Start the frontend application:*

    npm start

  
**5- Usage**

Navigate to the frontend application in your browser (usually at http://localhost:3000).

Users can create products by providing a name, price, and description.

Users can view all available products in a catalog.

Users can purchase products using Ether.

**6- Smart Contract Overview**

*1- Shop Contract*

  a- Properties:
  
  shopName: Stores the name of the shop.
  
  shopProducts: A mapping to store products by ID.
  
  count: A counter to track the number of products.
      
  Functions:
  
  createShopProduct(string memory _name, uint _price, string memory _description): Creates a new product.
  
  purchaseShopProduct(uint _id): Allows users to purchase a product

  getData(): Returns the count of products

  getProduct(uint id): Return the product corresponding to given id
  
  Events
  
   CreateProduct: Emitted when a product is created.
      
   PurchasedProduct: Emitted when a product is purchased.

**7- Frontend Overview**

  The frontend is built using React and allows users to interact with the smart contract:
  
ProductCatalog Component: Displays all products and provides options to purchase them.

AddProduct Component: Allows users to add new products to the shop.

