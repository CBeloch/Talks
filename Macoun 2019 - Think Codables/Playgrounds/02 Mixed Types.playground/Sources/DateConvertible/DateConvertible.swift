import Foundation

public protocol DateConvertible {
    var date: Date? { get }
}

public struct AnyDate<DC: DateConvertible & Codable>: Codable {
    let convertible: DC
    
    public init(from decoder: Decoder) throws {
        self.convertible = try DC.init(from: decoder)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        try container.encode(self.date)
    }
}

extension AnyDate: DateConvertible {
    public var date: Date? {
        return self.convertible.date
    }
}
