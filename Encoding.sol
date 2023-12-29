// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Encoding{
    
    function combineStrings()public pure returns(string memory){
        return string(abi.encodePacked("hello ", "World"));
        // ^0.8.12 + 
        // string.concat("hello" + "world")// We can do  
    }

    function encodeString()public pure returns(bytes memory){
        return abi.encode("Some string");
    }

    function decodeString()public pure returns(string memory){
        string memory decodedString = abi.decode(encodeString(), (string));
        return decodedString;
    }

    function multiEncode()public pure returns(bytes memory){
        bytes memory multiStrings =  abi.encode("someone 1 string", "someone 2 string");
        return multiStrings;
    }
    // Difference between the above function and below is that the below function combines the both strings using encodepacked

    function multiPackedEncode()public pure returns(bytes memory){
        bytes memory multiStrings =  abi.encodePacked("someone 1 packed string", "someone 2 packed string");
        return multiStrings;
    }

    function decodeMultiString()public pure returns(string memory,string memory){
        (string memory string1,string memory string2) = abi.decode(multiEncode(),(string,string));
        return (string1, string2);
    }
    //the below function won't work
    function decodeMultiPackedString()public pure returns(string memory){
        string memory string1 = abi.decode(multiPackedEncode(),(string));
        return (string1);
    }
    // instead 
    function DecodeMultiPacked()public pure returns(string memory){
        string memory string1 = string(multiPackedEncode());
        return string1;
    }
}

