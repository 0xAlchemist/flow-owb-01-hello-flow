import HelloWorld from 0x179b6b1cb6755e31

// This transaction:
// - creates a new capability for the HelloAsset
//   resource in storage
// - adds it to the account's public area.
//
// Other accounts and scripts can use this capability
// to create a reference to the private object to be able to
// access its fields and call its methods.

transaction {
    prepare(account: AuthAccount) {
        // Create a public capability by linking the capability to a 'target' object in account storage
        // - The capability is created regardless of whether the target exists
        // - The capability is stored at /public/Hello and it is also returned from the function
        let capability = account.link<&HelloWorld.HelloAsset>(/public/Hello, target: /storage/Hello)

        // Use the capability's borrow method to create a new reference to the
        // object that the capability links to
        let helloReference = capability!.borrow<&HelloWorld.HelloAsset>()

        // Call the hello() method using the reference to the HelloAsset resource
        // - the value we are accessing is optional, so optional chaining (?) is used
        log(helloReference?.hello())
    }
}