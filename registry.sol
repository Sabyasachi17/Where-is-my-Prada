// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Storage {
        address payable public owner;
        constructor()
        {
            owner = payable(msg.sender);
        }
        
        modifier onlyOwner{
            require(msg.sender == owner);
            _;
        }
        
        modifier onlyProductOwner{
            require(msg.sender == owner);
            _;
        }
        
        struct Location{
            uint256 longitude;
            uint256 latitude;
            string location_name;
        }
        
        struct Owner {
            address payable id;
            string name;
        }
        
        //product struct
        struct Product{
            string manufacture_location;
            string model;
            uint256 serial_number;
            uint256 price;
            Owner owner;
            uint256 createTime;
            
        }
        
        struct Warehouse{
            string location;
            string name;
        }
        
        struct Store{
            string location;
            string name;
        }
        
        mapping(uint256 => Product) public products;
        mapping(uint256 => Warehouse) public warehouses;
        mapping(uint256 => Store) public stores;
        
        function addProducts(string memory _location, string memory _model, uint256 _serial_number, uint256 _price, string memory Owner_name) onlyOwner public
        {
            address payable tempOwner = payable(msg.sender);
            Owner memory new_owner = Owner(tempOwner,Owner_name);
            Product memory new_product= Product(_location,_model,_serial_number,_price,new_owner, block.timestamp);
            products[_serial_number] = new_product;
            
        }
        
        function addWareHouse(uint256 _serial_number, string memory _location,string memory _name) onlyOwner public{
            Warehouse memory new_wh= Warehouse(_location,_name);
            warehouses[_serial_number] = new_wh;
        }
        
        function addStore(uint256 _serial_number, string memory _location,string memory _name) onlyOwner public{
            Store memory new_store= Store(_location,_name);
            stores[_serial_number]= new_store;
        }
}
