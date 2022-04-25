%lang starknet

from starkware.cairo.common.alloc import alloc
from starkware.cairo.common.cairo_builtins import HashBuiltin, SignatureBuiltin
from contracts.IOracle import IOracle
from contracts.entry.library import Entry

#########################
### STORAGE VARIABLES ###
#########################

@storage_var
func pontis_address() -> (address : felt):
end

#########################
######### EVENTS ########
#########################

@event
func proxy_event(
        value : felt,
        to : felt,
):
end

#########################
######## GETTERS ########
#########################

@view
func get_pontis_address{
        syscall_ptr : felt*,
        pedersen_ptr : HashBuiltin*,
        range_check_ptr
    }() -> (res : felt):
    let (contract_address) = pontis_address.read()
    return (contract_address)
end

#########################
######## SETTERS ########
#########################

@external
func set_pontis_address{
        pedersen_ptr : HashBuiltin*,
        syscall_ptr : felt*,
        range_check_ptr
    }(
        address : felt
    ):
    pontis_address.write(address)
    return ()
end

#########################
####### EXTERNALS #######
#########################

@external
func proxy{
        pedersen_ptr : HashBuiltin*,
        syscall_ptr : felt*,
        range_check_ptr
    }(
        contract_address : felt,
        new_entry : Entry,
        signature_r : felt,
        signature_s : felt
    ):
    let (contract_address) = pontis_address.read()
    IOracle.submit_entry(contract_address=contract_address, new_entry=new_entry, signature_r=signature_r, signature_s=signature_s)
    return ()
end
