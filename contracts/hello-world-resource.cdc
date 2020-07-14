pub contract HelloWorld {
    
    // Create a public resource for HelloAsset
    pub resource HelloAsset {
        // hello() can be called in a transaction to return the message from the resource
        pub fun hello(): String {
            return "Hello, Flow!"
        }
    }

    init() {

        // The create built-in function creates a new instance of the HelloAsset resource
        let newHello <- create HelloAsset()

        // Save the resource to private account storage by specifying a custom path to the resource
        self.account.save(<-newHello, to: /storage/Hello)
        
        // Log a message to let us know the contract was deployed successfully
        log("HelloAsset created and stored")
    }
}