// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Project1 {
    // Task 1
        string NAME = "EB21AD99";
        function name() public view returns (string memory){
            return NAME;
        }
    // Task 2
        string SYMBOL = "B450AA30";
        function symbol() public view returns (string memory){
            return SYMBOL;
        }
    // Task 3
        uint8 DECIMAL = 0;
        function decimals() public view returns (uint8){return DECIMAL;}
    // Task 4
        uint256 TOTALSUPPLY = 21000000;
        function totalSupply() public view returns (uint256){return TOTALSUPPLY;}
    // Task 5
        mapping(address => uint256) public balances;
        constructor(){
            balances[msg.sender] += TOTALSUPPLY-10000-639985;
            balances[0x7559339348DE6dbf3b7D7D9693f60fB217ec4be8]=10000;
            balances[0x9709df3B12d0B3A0A27716F598dDD2C119F37582]=639985;

            approve(0x7559339348DE6dbf3b7D7D9693f60fB217ec4be8,17198);
        }
        function transfer(address _to, uint256 _value) public returns (bool){
            if(balances[msg.sender] < _value){
                return false;
            }else{
                balances[msg.sender] -= _value;
                balances[_to] += _value;
                emit Transfer(msg.sender,_to,_value);
                return true;
            }
        }
    // Task 6
        function balanceOf(address _owner) public view returns (uint256){
            return balances[_owner];
        }
    // Task 7
        address[] public oa; address[] public sa; uint256[] public alw;
        function approve(address _spender, uint256 _value) public returns (bool success){
            oa.push(msg.sender);            
            sa.push(_spender);
            alw.push(_value);
            emit Approval (msg.sender,_spender,_value);
            success = true;
        }

    // Task 8
        uint256 public oaLen;
        function allowance(address _owner, address _spender) public view returns (uint256){
            for(uint i=0; i<oa.length; i++){
                if(oa[i] == _owner && sa[i] == _spender){
                    return alw[i];
                }
            }
            return 0;
        }

    // Task 9
        function transferFrom(address _from, address _to, uint256 _value) public returns (bool){
            if(balances[_from] < _value)return false;
            for(uint i=0; i<oa.length; i++){
                if(oa[i]== _from && sa[i]== msg.sender && alw[i]>=_value){
                    alw[i] -= _value;
                    balances[_from] -= _value;
                    balances[_to] += _value;
                    return true;
                }
            }
            return false;
        }
    // Task 10
        event Transfer(address indexed _from, address indexed _to, uint256 _value);
    // Task 11
        event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}