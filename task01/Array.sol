// SPDX-License-Identifier: MIT
pragma solidity ^0.8;



contract Array {
  
    function getarr() view  public returns (uint[] memory) {
        uint8[5]  memory  arr1 = [1,2,3,4,5];
        uint8[5] memory  arr2 = [4, 5, 6,8,7];
        uint[] memory result = new uint[](arr1.length + arr2.length);
        uint index = 0;
        for (uint i = 0; i < arr1.length; i++) {
            result[index++] = arr1[i];
        }
        for (uint i = 0; i < arr2.length; i++) {
            result[index++] = arr2[i];
        }

        //冒泡排序
        for (uint i = 0;i<result.length;i++){

            for (uint j = 0 ;j<result.length-1;j++){

                if(result[i]<=result[j+1]){
                    uint temp = result[i];
                    result[i] = result[j+1];
                    result[j+1] =temp;
                }

            }
        }
        


        return result;
    }

}