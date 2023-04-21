//SPDX-License-Identifier: Unlicense
pragma solidity 0.6.12;
pragma experimental ABIEncoderV2;

import "./BalancerStrategyV3.sol";

contract BalancerStrategyV3Mainnet_stMatic_amMatic is BalancerStrategyV3 {

  constructor() public {}

  function initializeStrategy(
    address _storage,
    address _vault
  ) public initializer {
    address underlying = address(0x216690738Aac4aa0C4770253CA26a28f0115c595);
    address stMatic = address(0x3A58a54C066FdC0f2D55FC9C89F0415C92eBf3C4);
    address wmatic = address(0x0d500B1d8E8eF31E21C99d1Db9A6444d3ADf1270);
    address bal = address(0x9a71012B13CA4d3D0Cdc72A177DF3ef03b0E76A3);
    address ldo = address(0xC3C7d422809852031b44ab29EEC9F1EfF2A58756);
    address gauge = address(0x51BE9bC648714CC07503Ad46F354BC8D1A3B727B);
    BalancerStrategyV3.initializeBaseStrategy(
      _storage,
      underlying,
      _vault,
      gauge,
      address(0xBA12222222228d8Ba445958a75a0704d566BF2C8), //balancer vault
      0x216690738aac4aa0c4770253ca26a28f0115c595000000000000000000000b2c,  // Pool id
      stMatic,   //depositToken
      true      //boosted
    );
    rewardTokens = [bal, ldo];
    reward2WETH[bal] = [bal, weth];
    reward2WETH[ldo] = [ldo, wmatic, weth];
    WETH2deposit = [weth, wmatic, stMatic];
    poolIds[bal][weth] = 0x3d468ab2329f296e1b9d8476bb54dd77d8c2320f000200000000000000000426;
  }
}
