import Foundation

public func prettyPrint<T: Encodable>(_ encodable: T) {
    let encoder = JSONEncoder()
    encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
    encoder.dateEncodingStrategy = .iso8601
    let encoded = try! encoder.encode(encodable)
    print(String(data: encoded, encoding: .utf8)!)
}
