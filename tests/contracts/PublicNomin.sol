/* PublicNomin.sol: expose the internal functions in Nomin
 * for testing purposes.
 */
pragma solidity 0.4.21;


import "contracts/Nomin.sol";
import "contracts/TokenState.sol";


contract PublicNomin is Nomin {

    function PublicNomin(address _havven, address _owner, TokenState initialState)
        Nomin(_havven, _owner, initialState)
        public {}
    
    function debugEmptyFeePool()
        public
    {
        state.setBalanceOf(address(this), 0);
    }

    function debugFreezeAccount(address target)
        public
    {
        frozen[target] = true;
    }

    function giveNomins(address account, uint amount)
        public
    {
        state.setBalanceOf(account, safeAdd(amount, state.balanceOf(account)));
        totalSupply = safeAdd(totalSupply, amount);
    }

    function clearNomins(address account)
        public
    {
        totalSupply = safeSub(totalSupply, state.balanceOf(account));
        state.setBalanceOf(account, 0);
    }
}