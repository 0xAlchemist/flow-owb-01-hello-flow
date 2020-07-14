pub contract HelloWorld {

    // Declare a public greeting field for our greeting String
    pub let greeting: String

    // The init() function is required if a contract contains any fields
    //  - it is responsible for setting the initial field values
    init() {
        self.greeting = "Hello, Flow!"
    }

    // hello() is a public function that returns our greeting message
    pub fun hello(): String {
        return self.greeting
    }
}
