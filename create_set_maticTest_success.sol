
// SPDX-License-Identifier: MIT

pragma solidity 0.6.10;

interface ICreateSet {
    function create(
        address[] memory _components,
        int256[] memory _units,
        address[] memory _modules,
        address _manager,
        string memory _name,
        string memory _symbol
      
    )
        external
        returns (address);
}



contract CREATESET {
    
    address public SetTokenCreatorKovanAddress = 0xB24F7367ee8efcB5EAbe4491B42fA222EC68d411;
    address public ControllerKovanAddress = 0x9048278cA7e874F9338e4898C436Ab07AA454701 ;
    address public IntegrationRegistryKovanAddress = 0x28A87DCca3322F90B3A4CE80cee499869EFdBf11 ;
    address public PriceOracleKovanAddress = 0xDFEA02F2824Ee177733d6f108005E95C85D1D4bE ;  // Invalid
    address public SetValuerKovanAddress = 0xA37f4c5A7Ad72EEa9034195B75e7498C7ed1d4E3 ;
    
    
    address public BasicIssuanceModuleKovanAddress = 0x8a070235a4B9b477655Bf4Eb65a1dB81051B3cC1 ;
    address public NavIssuanceModuleKovanAddress = 0x5dB52450a8C0eb5e0B777D4e08d7A93dA5a9c848 ;
    address public StreamingFeeModuleKovanAddress = 0xE038E59DEEC8657d105B6a3Fb5040b3a6189Dd51 ;
    
    
    address public MockBAT = 0x482dC9bB08111CB875109B075A40881E48aE02Cd ;
    address public MockUSDC = 0xb7a4F3E9097C08dA09517b5aB877F7a917224ede ;
    address public MockZRX =  0x162c44e53097e7B5aaE939b297ffFD6Bf90D1EE3 ;
    address public MockWETH =  0xd0A1E359811322d97991E03f863a0C30C2cF029C ;
    
    address public sushiSWAPExchangeAdapterKovan = 0xbFAD1987608a38bfA0FE4c5510c1aF834aE21379 ;
    
 

    
        
    modifier onlyManager {
        require (msg.sender == 0x3793f758a36c04B51a520a59520e4d845f94F9F2 , 'Only Manager has right to execute this function');
        _;
        
    }
    

    
     /*
     
     Create SET with following underlying Component:
     
     
     Underlying Component 1 : MockBAT = 0x482dC9bB08111CB875109B075A40881E48aE02Cd  ,  Allocation % = 30%
     Underlying Component 2 : MockZRX = 0x162c44e53097e7B5aaE939b297ffFD6Bf90D1EE3  ,  Allocation % = 70%
     
     ["0x482dC9bB08111CB875109B075A40881E48aE02Cd" , "0x162c44e53097e7B5aaE939b297ffFD6Bf90D1EE3"]    [MockBAT,MockZRX]

     ["20000000000000000000" ,"30000000000000000000"]    [20 MockBAT , 30 MockZRX]

    ["0x8a070235a4B9b477655Bf4Eb65a1dB81051B3cC1" , "0x5dB52450a8C0eb5e0B777D4e08d7A93dA5a9c848" , "0xE038E59DEEC8657d105B6a3Fb5040b3a6189Dd51" ]    [Modules To Be Added]
                [BasicIssuanceModuleKovanAddress ,0x5dB52450a8C0eb5e0B777D4e08d7A93dA5a9c848 , StreamingFeeModuleKovanAddress]

    0x3793f758a36c04B51a520a59520e4d845f94F9F2   [Manager Address]

    KOVAN-BAT-ZRX       [Name]
    
    KBATZRX           [Symbol]
     
     
     SET CREATED  
     
     https://kovan.etherscan.io/token/0x1b21742a271ee85f837d208c5e9b99be6cdea6ce#readContract
     
     SET KOVAN-BAT-ZRX Address  = 0x1b21742a271ee85f837d208c5e9b99be6cdea6ce;
     
     
     Data provided to Intialize NAVIssuance:
     
     ["0x0000000000000000000000000000000000000000", "0x0000000000000000000000000000000000000000", ["0xb7a4F3E9097C08dA09517b5aB877F7a917224ede"], "0x3793f758a36c04B51a520a59520e4d845f94F9F2", ["100000000000000" , "10000000000000000"], "800000000000000000" , "10000000000000000" , "100000000000000000" , "1000000000000000000"]



managerIssuanceHook = '0x0000000000000000000000000000000000000000',


managerRedemptionHook = '0x0000000000000000000000000000000000000000',
	
address[] reserveAssets = ['0xb7a4F3E9097C08dA09517b5aB877F7a917224ede']  // USDC  On Kovan


address feeRecipient = '0x3793f758a36c04B51a520a59520e4d845f94F9F2'

uint256[2] managerFees = [100000000000000 , 10000000000000000]   // [0.01% , 1%]  //        0.01% -> 100000000000000(10^14)      1% -> 10000000000000000 (10^16)

uint maxManagerFee = 800000000000000000                // 80%  ->  800000000000000000

uint premiumPercentage  = 10000000000000000                     // 1% ->  10000000000000000  
	
uint maxPremiumPercentage = 100000000000000000	               // 10% -> 100000000000000000
		
uint minSetTokenSupply     = 	1000000000000000000	            // 1 Token   ->   1000000000000000000


Reserve USDC Asset Quanity to supply  Set: 100 USDC    100000000000000000000
		
     
     
     */






    function createMySet(
        address[] memory _components,
        int256[] memory _units,
        address[] memory _modules,
        address _manager,
        string memory _name,
        string memory _symbol 
         ) external returns (address) {
        
          ICreateSet createSet = ICreateSet(SetTokenCreatorKovanAddress) ;
          address[] memory components = _components;
          int256[] memory uints = _units;
          address[] memory modules = _modules;
          address manager = _manager;
          string memory name = _name;
          string memory symbol = _symbol;
      
         
        return createSet.create(components, uints ,modules ,manager , name , symbol  );
        
        

        }
        
        
      
        
        
        
        }
        
        
        
 

