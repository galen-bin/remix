// SPDX-License-Identifier: MIT
pragma solidity ^0.8;
//拍卖
contract NftAction{
    struct NftInfo{
        
        //开始时间
        uint256 stratime;
        //持续时间
        uint256 keeptime;
        //是否结束
        bool isend;
        //起拍价格
        uint256 statpirce;
        //最高价格 
        uint256 maxprice;
        //拍卖者地址
        address maxaddress;
        //TokenID
        uint256 TokenId;
        //Tokenaddress
        address Tokenaddress;
        // NFT合约地址
        address nftaddress;
        //出售者地址
        address seller;    

    }

    mapping (uint256=>NftInfo) public  aciton;

    uint256 public  NextAciontId;

    address public admin;

    constructor(){
        admin=msg.sender;
    }


    //创建拍卖
    function  createAciton(uint256 _statpirce,uint256 keeptime,uint256 _TokenId,address _nftaddress)public {
        
        require(msg.sender==admin,"Only admin can create auctions");
        require(_statpirce>0,"price must pass 0");
        require(keeptime>10,"stratime must pass 10s");

        aciton[NextAciontId]=NftInfo({
             //开始时间
            stratime:block.timestamp,
            //持续时间
            keeptime:keeptime*1000,
            //是否结束
           isend:false,
            //起拍价格
            statpirce:_statpirce,
            //最高价格 
            maxprice:0,
            //最高价地址
            maxaddress:address(0),
            //TokenID
            TokenId:_TokenId,
            //Tokenaddress
            Tokenaddress:address(0),
            // NFT合约地址
            nftaddress:_nftaddress,
            //拍卖者地址
            seller: msg.sender
        });
        NextAciontId++;

    }

    //进行拍卖
    function  joinAciton(uint256 _id)public payable{
        require(msg.value>=aciton[_id].statpirce,"price must pass statpirce");
        require(block.timestamp<aciton[_id].stratime+aciton[_id].keeptime,"Aciton is end");
        require(aciton[_id].isend==false,"Aciton is end");
        require(msg.value>aciton[_id].maxprice,"price must pass maxprice");
        if(aciton[_id].maxaddress!=address(0)){
            payable(aciton[_id].maxaddress).transfer(aciton[_id].maxprice);
        }

        NftInfo storage acinfo=aciton[_id];
        acinfo.maxprice=msg.value;
  


    }




}