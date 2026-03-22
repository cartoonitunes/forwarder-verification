pragma solidity ^0.4.8;

contract Token {
    function transfer(address to, uint256 value) returns (bool ok);
    function balanceOf(address who) constant returns (uint256 value);
}

contract Forwarder {
    address owner;
    address defaultSweep;

    function Forwarder() {
        owner = 0x0536806df512d6cdde913cf95c9886f65b1d3462;
        defaultSweep = 0xa74476443119A942dE498590Fe1f2454d7D4aC0d;
    }

    function() {
        sweep(defaultSweep);
    }

    function sweep(address _token) {
        address token = _token;
        if (!(msg.sender == owner && Token(token).transfer(owner, Token(token).balanceOf(this)))) throw;
    }
}
