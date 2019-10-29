import Foundation

public struct MacounSession {
    public let firstName: String
    public let lastName: String
    public let title: String
    public let time: Date
}

extension MacounSession: Codable {
    private enum CodingKeys: String, CodingKey {
        case title = "sessionTitle"
        case time
        case speaker
    }
    
    private enum SpeakerCodingKeys: String, CodingKey {
        case firstName
        case lastName
    }
    
    public init(from decoder: Decoder) throws {
        // Get the main container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.title = try container.decode(String.self, forKey: .title)
        self.time = try container.decode(Date.self, forKey: .time)
        
        // Get container with speaker data
        let speakerContainer = try container.nestedContainer(keyedBy: SpeakerCodingKeys.self, forKey: .speaker)
        
        self.firstName = try speakerContainer.decode(String.self, forKey: .firstName)
        self.lastName = try speakerContainer.decode(String.self, forKey: .lastName)
    }
    
    public func encode(to encoder: Encoder) throws {
        // create main container
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(self.title, forKey: .title)
        try container.encode(self.time, forKey: .time)
        
        // Add nested container for speaker data
        var speakerContainer = container.nestedContainer(keyedBy: SpeakerCodingKeys.self, forKey: .speaker)
        
        try speakerContainer.encode(self.firstName, forKey: .firstName)
        try speakerContainer.encode(self.lastName, forKey: .lastName)
    }
}
