import Foundation
enum DecodeError: Error {
    case resourceNotFound
}
  // MARK: decode any file format with any name and from any bundle
extension Decodable {
    static func parse(fileName: String, fileType: String, bundle: Bundle) throws ->  Self {
        guard let url = bundle.url(forResource: fileName, withExtension: fileType)
        else { throw DecodeError.resourceNotFound }
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(self, from: data)
    }
}
