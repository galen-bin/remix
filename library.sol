// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

library SafeMath {
    function add (uint a,uint b) pure  public returns (uint)
    {
        return a+b;
    }
}

contract librarytest{


    function test(uint a,uint b) pure public returns (uint) {

        SafeMath.add(a,b);
    }


}

library search{

    function indexof(uint[] storage self,uint value) view  public returns (int) {

      
            for (uint i=0;i<self.length;i++){
                if(self[i]==value)return int(i);
            }  

            return int(-1); // 如果找不到返回 -1
    }
}


contract tosell{
    using search for uint[];
    uint[] data;
    function push(uint s)public {
        data.push(s);
    }

    function replace(uint old,uint _new) public {
        int i=data.indexof(old);
        if(i!=-1){
            data[uint(i)]=_new;
        }

    }

    function getdata()public returns (uint[] memory) {
        return data;
    }

}

