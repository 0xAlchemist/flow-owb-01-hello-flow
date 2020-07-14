import HelloWorld from 0x179b6b1cb6755e31

// Scripts are read-only

// This script:
// - gets the public account object for 0x179b6b1cb6755e31
// - gets the public capability for HelloAsset from the account's public storage
// - borrows a reference to the public capability
// - logs the result of calling the hello() method on HelloAsset

pub fun main() {
    // Get the public account object using the built-in getAccount() function
    let helloAccount = getAccount(0x179b6b1cb6755e31)

    // Get the public capability from the public path of the owner's account
    let helloCapability = helloAccount.getCapability(/public/Hello)

    // Borrow a refernce for the capability
    let helloReference = helloCapability!.borrow<&HelloWorld.HelloAsset>()

    // The log() built-in function logs its argument to stdout
    //
    // Call the hello() method on the HelloAsset resource
    // referenced in the published area of the account
    // - optional chaining (?) is used as the value we're
    //   accessing is optional
    log(helloReference?.hello())
}
 