// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Rome{

    mapping ( bytes1 => int) public list;

    constructor(){
        list['I'] = 1;
        list['V'] = 5;
        list['X'] = 10;
        list['L'] = 50;
        list['C'] = 100;
        list['D'] = 500;
        list['M'] = 1000;
    }
    //罗马转换数字
    function convert_rome(string memory  number)  public view  returns(int ){
        
         bytes  memory  bt=bytes(number);
         //兼容负数
        int  sum= 0 ;
         for (uint  i = 0;i<bt.length;i++){
                int  value=list[bt[i]];
                //如果后面当前位比后一位小则减去当前位（5-1=4）
                if(i<bt.length-1&&value<list[bt[i+1]]){
                    sum-=value; 
                    
                }else{ 
                  sum+=value ;
                }       
            }
            return sum;

         }

    //数字转罗马
    function convert_num(uint number)  public view returns (string memory){
        require(number<=3000,"number is error");
      string[4] memory k=["","M","MM","MMM"];
      string[10] memory h=["","C","CC","CCC","CD","D","DC","DCC","DCCC","CM"];
      string[10] memory t=["","X","XX","XXX","XL","L","LX","LXX","LXXX","XC"];
      string[10] memory o=["","I","II","III","IV","V","VI","VII","VIII","IX"];

    //拼接字符串
   return  string.concat(k[number%10000/1000],h[number%1000/100],t[number%100/10],o[number%10]);
      
        
    }
}

    
