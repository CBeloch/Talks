import Cocoa

// Read JSON data from file
let jsonURL = Bundle.main.url(forResource: "date_data", withExtension: "json")
let jsonData = try! Data(contentsOf: jsonURL!)

let decoder = JSONDecoder()

let decoded = try decoder.decode(DateModel.self, from: jsonData)

prettyPrint(decoded)
