import Foundation
protocol FileLoaderType {
    var fileName: String { get }
    var bundle: Bundle { get }
    var fileType: String { get }
}

struct FileLoader: FileLoaderType {
     let fileName: String
     let bundle: Bundle
     let fileType: String
}
