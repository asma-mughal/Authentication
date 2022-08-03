//SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;
contract Auth {
  
    struct UserDetail {
        address addr;
        string name;
        string password;
        string ipfsImageHash;
        string number;
        string email;
        string user_address;
        string deviceToken;
        string access;
        bool isUserLoggedIn; 
    }

    mapping(address => UserDetail) public user;
      function registerUser(
        address _address,
        string memory _name,
        string memory _password,
        string memory _ipfsImageHash,
        string memory _number,
        string memory _email,
        string memory _userAddress,
        string memory _deviceToken,
        string memory _access) public returns (bool) {
        user[_address].addr = _address;
        user[_address].name = _name;
        user[_address].password = _password;
        user[_address].ipfsImageHash = _ipfsImageHash;
        user[_address].number = _number;
        user[_address].email = _email;
        user[_address].user_address = _userAddress;
        user[_address].deviceToken = _deviceToken;
        user[_address].access = _access;
        user[_address].isUserLoggedIn = false;
        return true;
    }
    function loginUser(address _address, string memory _password) public returns (bool)
    {
        if (
            keccak256(abi.encodePacked(user[_address].password)) == keccak256(abi.encodePacked(_password))) {
            user[_address]. isUserLoggedIn = true;
            return user[_address].isUserLoggedIn;

        } else {
            return false;

        }
    }
    function checkIsUserLogged(address _address)public view returns(bool)
    {
        return (user[_address].isUserLoggedIn);
    }
     function logoutUser(address _address) public {
        user[_address].isUserLoggedIn = false;
    }
}