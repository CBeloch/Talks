import Foundation

public struct DateModel: Codable {
    public let variantA: AnyDate<DateString>
    public let variantB: AnyDate<DateObject>
    public let variantC: AnyDate<DateComponents>
}

