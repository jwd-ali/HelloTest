import UIKit
import SDWebImage

// MARK: Wrapper class to use third party framework in application so that if we want to replace it with any other framework or create our own we only need to change here

// MARK: Image loading using SDWebImage
extension UIImageView {
  func loadImage(with url: URL?, placeholder: UIImage? = nil, showsIndicator: Bool = false) {
    sd_imageIndicator = showsIndicator ? SDWebImageActivityIndicator.gray : nil
    sd_setImage(with: url, placeholderImage: placeholder)
  }
}
