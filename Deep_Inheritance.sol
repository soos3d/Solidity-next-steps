// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

// inheritance, the capability to transfer functions to derived contracts
// the first contract is the base contract (parent)
// the contract inheriting the functions is the derived contract (child)

contract FirstContract {

    function numberOne() public virtual pure returns (uint) {           // virtual means that this function can be overridden(modified) from a derived contract
        return 100;
    }
    
    function numberTwo() public virtual pure returns (uint) {
        return 50;
    }

    function numberThree() public pure returns (string memory) {       // private would not allow access to derived contracts
        return " I am in the first contract";
    }
}

contract SecondContract is FirstContract {                              // the keyword is sets the inheritance 

    function numberOne() public pure virtual override returns(uint) {   // override means we can modify this function
        return 150;
    }


    function numberTwo() public pure virtual override returns (uint) {
        return 200;
    }

// funtcion numberOne() in contract A is overridden so we can't access it unless we make a function for it
    function accesOne() public pure returns(uint) {
        return super.numberOne();                                   // the word super access the original function
    }

    function letters() public pure virtual returns (string memory) {
        return "I am only in the second contract";
    }
}


    // linearization from most "base-like” to “most derived”
contract ThirdContract is FirstContract , SecondContract {  

                                                        // lis the contract inheriting from
      function numberOne() public pure virtual override(FirstContract , SecondContract) returns(uint) {   
        return 600;
    }


    function numberTwo() public pure virtual override(FirstContract , SecondContract) returns (uint) {
        return 700;
    }
    
    function letters() public pure override returns (string memory) {
        return "I am only in the second contract";
    }
}


contract FourthContract is ThirdContract {
      function numberOne() public pure override returns(uint) {   
        return 1000;
    }


    function numberTwo() public pure override returns (uint) {
        return 800;
    }
}

// when a function is called that is defined multiple times in different contracts, the given bases are searched from right to left
