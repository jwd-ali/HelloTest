import UIKit
final class RecipeTableViewCell: ReusableTableViewCell {

  // MARK:- Contants use to create cell view
  private enum Constants {
    static let cornerRadius: CGFloat = 20
    static let shadowOpacity: Float = 0.3
    static let shadowRadius: CGFloat = 5
    static let shadowOffset: CGSize = CGSize(width: 1, height: 1)
    static let offset: CGFloat = 10
    static let stackViewSpacing: CGFloat = 5
    static let borderWidth: CGFloat = 5
    static let imageViewHeight: CGFloat = 150
  }

  // MARK:- Views
  private lazy var cornerRadiusView = UIView() .. {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.layer.cornerRadius = Constants.cornerRadius
    $0.layer.shadowOpacity = Constants.shadowOpacity
    $0.layer.shadowRadius = Constants.shadowRadius
    $0.layer.shadowOffset = Constants.shadowOffset
    $0.layer.shadowColor = UIColor.black.cgColor
    $0.backgroundColor = .white
    $0.layer.masksToBounds = false
  }

  private lazy var holderView = UIView() .. {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.layer.cornerRadius = Constants.cornerRadius
    $0.clipsToBounds = true
  }

  private lazy var textStackView = UIStackView() .. {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.axis = .vertical
    $0.distribution = .fill
    $0.alignment = .leading
    $0.spacing = Constants.stackViewSpacing
  }

  private lazy var recipeImageView = UIImageView() .. {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.contentMode = .scaleAspectFill
    $0.clipsToBounds = true
  }

  private lazy var recipeNameLabel = UILabel() .. {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.font = UIFont.boldSystemFont(ofSize: 18)
  }

  private lazy var headlineLabel = UILabel() .. {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.font = UIFont.systemFont(ofSize: 16)
  }

  private lazy var minutesLabel = UILabel() .. {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.font = UIFont.boldSystemFont(ofSize: 16)
  }

  // MARK:- property
  private var isRecipeSelected: Bool = false {
    didSet {
      cornerRadiusView.layer.borderColor = isRecipeSelected ? UIColor(named: "SelectionColor")?.cgColor : UIColor.clear.cgColor
      cornerRadiusView.layer.borderWidth =  isRecipeSelected ? Constants.borderWidth : 0
    }
  }

  // MARK: - initializer
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setHierarchy()
    setConstraints()
    selectionStyle = .none
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func update(with viewModel: ReusableCellViewModel?) {
    guard let viewModel = viewModel as? RecipeCellViewModelType else { return }
    recipeNameLabel.text = viewModel.name
    headlineLabel.text = viewModel.headline
    minutesLabel.text = viewModel.preprationTime.minutesString
    recipeImageView.loadImage(with: viewModel.image, showsIndicator: true)
    isRecipeSelected = viewModel.isSelected
  }

}
private extension RecipeTableViewCell {
  func setHierarchy() {
    contentView.addSubview(cornerRadiusView)
    cornerRadiusView.addSubview(holderView)
    holderView.addSubview(recipeImageView)
    holderView.addSubview(textStackView)

    [recipeNameLabel, headlineLabel, minutesLabel].forEach(textStackView.addArrangedSubview)
  }

  func setConstraints() {
    cornerRadiusView
      .alignEdgesWithSuperview([.left, .right, .top, .bottom], constant: Constants.offset)

    holderView
      .alignEdgesWithSuperview([.left, .right, .top])
      .alignEdgeWithSuperview(.bottom, constant:  Constants.offset)

    recipeImageView
      .alignEdgesWithSuperview([.left, .right, .top])
      .height(constant: Constants.imageViewHeight)

    textStackView
      .toBottomOf(recipeImageView, constant: Constants.offset)
      .alignEdgesWithSuperview([.left, .right, .bottom], constant: Constants.offset)
  }
}
