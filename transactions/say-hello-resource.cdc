import HelloWorld from 0x179b6b1cb6755e31

// Call the hello() method on the HelloAsset resource that is stored in private storage
// - Remove the resource from storage
// - Call the hello() method on the resource
// - Place the resource back in storage

transaction {
    prepare(acct: AuthAccount) {
        // Load the resouce from storage
        // - specify the type to load it as and the path to it's location in storage
        let helloResource <- acct.load<@HelloWorld.HelloAsset>(from: /storage/Hello)

        // Log the result of hello() if the resource exists in storage
        // - (?) optional chaining is used in case the resource is unavailable
        log(helloResource?.hello())

        // Put the resource back in it's original storage location
        // - (!) the force-unwrap operator is used to get the value 
        // out of the optional (helloResource). The mthod will abort
        // if the optional is nil
        acct.save(<-helloResource!, to: /storage/Hello)
    }
}
 