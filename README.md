# Exchange Deposit Forwarder — Bytecode Verification

Two versions of a widely-deployed exchange deposit forwarding contract used to sweep tokens from deposit addresses to a central wallet.

## Version 1 (v0.4.2, no optimizer)
- **Example:** [`0x895e7e8f082267c1c704f97f89e0160d767083a8`](https://etherscan.io/address/0x895e7e8f082267c1c704f97f89e0160d767083a8)
- **Deployed:** October 4, 2016 (block 2,375,846)
- **Siblings:** 4,163 identical deployments
- **Compiler:** solc 0.4.2+commit.af6afb04, optimizer OFF
- **Result:** Exact bytecode match

## Version 2 (v0.4.9, no optimizer)
- **Example:** [`0x9a96270a85fb79eb320f2f7965ccf5c19ba695c7`](https://etherscan.io/address/0x9a96270a85fb79eb320f2f7965ccf5c19ba695c7)
- **Deployed:** February 18, 2017 (block 3,203,394)
- **Siblings:** 5,310 identical deployments
- **Compiler:** solc 0.4.9+commit.364da425, optimizer OFF
- **Result:** Exact bytecode match (stripped, bzzr0 metadata differs)

## What These Are

Exchange deposit forwarders. When an exchange generates a unique deposit address for a user, it deploys one of these contracts. The contract has three functions:

- `balanceOf(address)` — check token balance (delegated to token contract)
- `transfer(address,uint256)` — transfer tokens (delegated to token contract)
- `sweep(address)` — owner-only: sweeps all tokens of the given type to the owner address

The fallback function calls `sweep(defaultSweep)` to forward any incoming tokens/ETH.

v2 adds `pragma solidity ^0.4.8` and the `LOCK8605463013()` constant (an anti-proxy identifier).

## Combined Impact

9,473 contracts verified across both versions — the most widely deployed unverified bytecodes on early Ethereum.
