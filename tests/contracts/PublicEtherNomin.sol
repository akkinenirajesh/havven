/* PublicEtherNomin.sol: expose the internal functions in EtherNomin
 * for testing purposes.
 */
pragma solidity ^0.4.20;


import "contracts/EtherNomin.sol";
import "contracts/TokenState.sol";


contract PublicEtherNomin is EtherNomin {

    function PublicEtherNomin(address _havven, address _oracle,
                              address _beneficiary,
                              uint initialEtherPrice,
                              address _owner, TokenState initialState)
        EtherNomin(_havven, _oracle, _beneficiary, initialEtherPrice, _owner, initialState)
        public {}

    function publicEtherValueAllowStale(uint n) 
        public
        view
        returns (uint)
    {
        return etherValueAllowStale(n);
    }

    function publicSaleProceedsEtherAllowStale(uint n)
        public
        view
        returns (uint)
    {
        return saleProceedsEtherAllowStale(n);
    }

    function publicLastPriceUpdate()
        public
        view
        returns (uint)
    {
        return lastPriceUpdate;
    }

    function currentTime()
        public
        returns (uint)
    {
        return now;
    }

    function debugWithdrawAllEther(address recipient)
        public
    {
        recipient.transfer(balanceOf(this));
    }
    
    function debugEmptyFeePool()
        public
    {
        delete feePool;
    }

    function debugFreezeAccount(address target)
        public
    {
        frozen[target] = true;
    }
}
