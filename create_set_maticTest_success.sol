
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
    
 

    
        
    modifier onlyManager {
        require (msg.sender == 0x3793f758a36c04B51a520a59520e4d845f94F9F2 , 'Only Manager has right to execute this function');
        _;
        
    }
    

    
     /*
     
     Create SET with following underlying Component:
     
     
     Underlying Component 1 : MockBAT = 0x482dC9bB08111CB875109B075A40881E48aE02Cd  ,  Allocation % = 30%
     Underlying Component 2 : MockZRX = 0x162c44e53097e7B5aaE939b297ffFD6Bf90D1EE3  ,  Allocation % = 70%
     
     
     
     
     
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
        
        
        
 

