import Foundation

private let formatter: DateFormatter = {
    let f = DateFormatter()
    f.dateFormat = "YYYY-MM-dd HH:mm:ss"
    return f
}()

public struct DateObject {
    public let dateString: String
    public let timezoneType: Int
    public let timezone: String
}

// MARK: - Codable

extension DateObject: Codable {
    private enum CodingKeys: String, CodingKey {
        case dateString = "date"
        case timezoneType = "timezone_type"
        case timezone
    }
}

// MARK: - DateConvertible

extension DateObject: DateConvertible {
    public var date: Date? {
        formatter.timeZone = TimeZone(identifier: self.timezone)
        return formatter.date(from: self.dateString)
    }
}

