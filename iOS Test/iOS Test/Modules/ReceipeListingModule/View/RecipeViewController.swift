import UIKit
class RecipeViewController: UIViewController {
  // MARK: - properties
  private let presenter: RecipeModulePresenting
  private var viewModels: [RecipeCellViewModelType] = []

  // MARK: - Views
  private lazy var tableView = UITableView(frame: .zero) .. {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.separatorStyle = .none
    $0.estimatedRowHeight = UITableView.automaticDimension
    $0.dataSource = self
    $0.delegate = self
  }

  // MARK: - initializer
  init(presenter: RecipeModulePresenting) {
    self.presenter = presenter
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    setupTableView()
    setupConstraints()
    presenter.onViewDidLoad()
  }

  private func setupTableView() {
    view.addSubview(tableView)
    tableView.register(cellType: RecipeTableViewCell.self)
  }

  private func setupConstraints() {
    tableView
      .alignAllEdgesWithSuperview()
  }
}
// MARK:- View delegates
extension RecipeViewController: RecipeModuleView {
  func updateView(recipeViewModels: [RecipeCellViewModelType]) {
    viewModels = recipeViewModels
    tableView.reloadData()
  }

  func updateTitle(title: String) {
    self.title = title
  }

  func showErrorMessage(errorMessage: String) {
    showAlert(message: errorMessage)
  }

  func updateRecipe(at indexPath: IndexPath, with recipe: RecipeCellViewModelType) {
    viewModels[indexPath.row] = recipe
    tableView.reloadRows(at: [indexPath], with: .fade)
  }
}

// MARK:- TableView delegate and datasource
extension RecipeViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModels.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let viewModel = viewModels[indexPath.row]
    let cell = tableView.dequeueReusableCellOf(type: viewModel.cellType, for: indexPath)
    cell.update(with: viewModel)
    return cell
  }
}

extension RecipeViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    presenter.onSelect(indexPath: indexPath, recipe: viewModels[indexPath.row])
  }
}
