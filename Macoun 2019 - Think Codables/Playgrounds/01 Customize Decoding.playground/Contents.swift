import Foundation

let jsonString = """
[
  {
    "speaker": {
      "first_name": "Chris",
      "last_name": "Hauser",
      "twitter": "@Doktorhauser"
    },
    "session_title": "Keynote",
    "time": "2019-10-04T08:30:00Z"
  },
  {
    "speaker": {
      "first_name": "Christopher",
      "last_name": "Beloch",
      "twitter": "@SomeKindOfCode"
    },
    "session_title": "Think Codables",
    "time": "2019-10-05T10:30:00Z"
  }
]
"""

let jsonData = Data(jsonString.utf8)

let decoder: JSONDecoder = .init()
decoder.keyDecodingStrategy = .convertFromSnakeCase
decoder.dateDecodingStrategy = .iso8601

try! decoder.decode(Array<MacounSession>.self, from: jsonData)
