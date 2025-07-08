// SPDX-License-Identifier: MIT
pragma solidity ^0.8;
//sepolia 代币地址
//0xcc661e9c25f5945701c0c8dca6a2890eb7ac126a 
interface IERC20 {  
   event Transfer(address indexed from, address indexed to, uint256 value);

    event Approval(address indexed owner, address indexed spender, uint256 value);

    function name() external  returns (string memory name);//合约名称
    
    function symbol() external returns (string memory symbol);//合约简称
    
    function decimals() external returns (uint8 decimals);//小数位
    
	function totalSupply() external view returns (uint256);//发行总代币

    function balanceOf(address account) external view returns (uint256);//指定地址余额

    function transfer(address to, uint256 amount) external returns (bool);//转账

    function allowance(address owner, address spender) external view returns (uint256);//授权地址剩余余额

    function approve(address spender, uint256 amount) external returns (bool);//授权某地址

    



    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool);//授权地址转账
}   


contract MYTOKEN is IERC20{
    string private _name;  //合约名称
    string private _symbol;   //合约简称
    uint8 private _decimals;//小数位
    address public owner;       //合约地址
    mapping (address =>uint256)  balances;      //余额
    mapping(address =>mapping(address=>uint256)) approvals;     //授权余额
    uint private total ;//发行总代币

    modifier onlyOwner {
        require(msg.sender == owner,"not owner");
        _;
    }
    constructor()public  {
         _name = "mytokens";//合约名称
         _symbol = "MTK"; // 合约简称
        owner=msg.sender;       //合约地址
        total = 100*10**9 ;    
        balances[owner] = 100 * 10 ** 8;//余额
        _decimals =26;   //小数位
        emit Transfer(address(0), msg.sender, total );       
    }


    function name() public view returns (string memory){
        return _name;
    }
    function symbol() public view returns (string memory) {
            return _symbol;
    }
     function decimals()public  view returns(uint8)   {
        return _decimals;
    }

    function totalSupply() external   view returns (uint256){
        return total;
    }

    function balanceOf(address account) public  view returns(uint256){
            return balances[account];
    }

    function transfer(address to, uint256 amount) external returns (bool ){
        require(balances[msg.sender]>=amount,"no enough tokens");
        balances[to]+=amount;
        balances[msg.sender]-=amount;
        emit Transfer(msg.sender, to, amount);
    }

    function allowance(address owner, address spender) public view returns (uint256){
        return approvals[owner][spender];
    }
    function approve(address spender, uint256 amount) external      returns(bool ){

        require((approvals[msg.sender][spender]==0 || approvals[msg.sender][spender]>=amount),"no enough allowance");
        balances[msg.sender]+=amount;
        emit Approval(msg.sender, spender, amount);

       return true;
    }

    function transferFrom(address from, address to, uint256 amount) external returns (bool){
        require((approvals[from][msg.sender]>=amount && approvals[from][msg.sender]>0),"no enough allowance");
        balances[to]-=amount;
        balances[from]-=amount;
        emit Transfer(from, to, amount);
    }

    //充值代币
    function _mint(address account,uint256 amoun) public onlyOwner returns (bool){
        require((balances[account]==0),"already minted");
        balances[account]+=amoun;
        emit Transfer(address(0), account, amoun);
    }



}