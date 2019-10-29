import Foundation

public struct DateComponents {
    public let year: Int
    public let month: Int
    public let day: Int
    public let hour: Int
    public let minute: Int
    public let second: Int
}

// MARK: - Codable

extension DateComponents: Codable {}

// MARK: - DateConvertible

extension DateComponents: DateConvertible {
    public var date: Date? {
        let cal = Calendar.current
        let date: Date = .init()
        
        var components = cal.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
        components.year = self.year
        components.month = self.month
        components.day = self.day
        components.hour = self.hour
        components.minute = self.minute
        components.second = self.second
        
        return cal.date(from: components)
    }
}
