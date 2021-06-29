// SPDX-License-Identifier: MIT

//    Welcome to Little Yellow Koala Stealth Launch!
//      Air Rocket is a project based on Binance Smart Chain. 
//    We are community driven token based on merchandise fans art.
//    Name Token : Little Yellow Koala
//    Symbol     : LYKO
//    Supply     : 100.000.000.000.000.000    
//    Decimals   : 9
//
//        Tokenomic
//        Burned 90
//        Devoloper and Marketing 1%
//        Liquidity Pool 9%
//        Max Tx 100.000.000.000.000 (Shield From Whale)

//        Join our Telegram: https://t.me/LittleYellowKoala

pragma solidity ^0.8.2;

contract Token {
    mapping(address => uint) public balances;
    mapping(address => mapping(address => uint)) public allowance;
    uint public totalSupply = 100 * 10**15 * 10**9;
    string public name = "Little Yellow Koala";
    string public symbol = "LYKO";
    uint public decimals = 9;

    uint256 public _maxTxAmount = 100 * 10**12 * 10**9;
    uint256 private nummtokensSellToAddLiquidity = 100 * 10**15 * 10**9;

    uint256 public _liquidityFee = 4;
    uint256 public _taxFee = 4;
    
    uint256 private _previousTaxFee = _taxFee;
    uint256 private _previousLiquidityFee = _liquidityFee;
    
    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);
    
    constructor() {
        balances[msg.sender] = totalSupply;
    }
    
    function balanceOf(address owner) public returns(uint) {
        return balances[owner];
    }
    
    function transfer(address to, uint value) public returns(bool) {
        require(balanceOf(msg.sender) >= value, 'balance too low');
        balances[to] += value;
        balances[msg.sender] -= value;
       emit Transfer(msg.sender, to, value);
        return true;
    }
    
    function transferFrom(address from, address to, uint value) public returns(bool) {
        require(balanceOf(from) >= value, 'balance too low');
        require(allowance[from][msg.sender] >= value, 'allowance too low');
        balances[to] += value;
        balances[from] -= value;
        emit Transfer(from, to, value);
        return true;   
    }
    
    function approve(address spender, uint value) public returns (bool) {
        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;   
    }
}
