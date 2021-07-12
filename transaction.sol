// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./registry.sol";

contract transaction is Storage
{
    event pradaJourney(uint256 indexed _serial_number,address indexed _from, address indexed _to);
    function changeOwner(uint256 _serial_number, address payable _id, string memory _name) public
    {
        require(msg.sender== products[_serial_number].owner.id);
        products[_serial_number].owner.name=_name;
        products[_serial_number].owner.id= _id;
        
        emit pradaJourney(_serial_number,msg.sender,_id);
    }
    function buyPrada(address payable sender,address receiver,uint256 _serial_number,string memory _name) public payable{
        require(msg.sender == products[_serial_number].owner.id);
        
        sender.transfer(msg.value);
        changeOwner(_serial_number,payable(receiver),_name);
    }
    
    function whereIsMyPrada(uint256 _serial_number) public view returns(Product memory)
    {
        return products[_serial_number];
    }
}
