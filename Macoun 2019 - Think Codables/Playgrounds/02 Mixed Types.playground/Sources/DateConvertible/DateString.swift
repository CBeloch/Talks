import Foundation

private let formatter: DateFormatter = {
    let f = DateFormatter()
    f.dateFormat = "YYYY-MM-dd"
    f.timeZone = TimeZone(identifier: "UTC")
    return f
}()

public struct DateString: DateConvertible {
    public var date: Date?
}

// MARK: - Codable

extension DateString: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        // Get date string
        let dateString = try container.decode(String.self)
        
        // use formatter to convert to date
        self.date = formatter.date(from: dateString)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        if let date = self.date {
            try container.encode(formatter.string(from: date))
        } else {
            try container.encodeNil()
        }
    }
}
