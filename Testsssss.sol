// SPDX-License-Identifier: UNLICENSED

Infort https://github.com/Blackshiba-in/black-shiba-inu/blob/main/Yb.sol

Pragma solidity 0.6.12;

contract TronRangers is Context, iBEP20, Ownable {
  using SafeMath for uint256;

  mapping (address => uint256) private _balances;
  mapping (address => mapping (address => uint256)) private _allowances;

  uint256 private _totalSupply;
  uint8 public _decimals;
  string public _symbol;
  string public _name;
  address private _burnaddress;

  constructor() public {
    _name = 'Tron Rangers';
    _symbol = 'TRXR';
    _decimals = 8;
    _burnaddress = 0x000000000000000000000000000000000000dEaD;
    _totalSupply = 1 * 10**6 * 10**8;
    _balances[msg.sender] = _totalSupply;

    emit Transfer(address(0), msg.sender, _totalSupply);
  }

    uint256 public _taxFee = 4;
    uint256 private _previousTaxFee = _taxFee;
    
    uint256 public _liquidityFee = 4;
    uint256 private _previousLiquidityFee = _liquidityFee;

    uint256 public _maxTxAmount = 10 * 10**2 * 10**8;
    uint256 private numTokensSellToAddToLiquidity = 1 * 10**5 * 10**18;
