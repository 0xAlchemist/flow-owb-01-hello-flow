// Import the contract from owners address
import HelloWorld from 0x01cf0e2f2f715450

transaction {
    // Nothing to do here as we're not dealing with account storage
    prepare(acct: AuthAccount) {}

    // Call the hello function from the HelloWorld contract and log the returned String
    execute {
        log(HelloWorld.hello())
    }
}
