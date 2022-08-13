import UIKit
class RecipeModuleBuilder: RecipeModuleBuilding {

  private enum Constants {
    static let fileName = "recipes_v3"
    static let fileType = "json"
  }

 //TODO: we can use dependency container to register and resolve dependencies
  func view() -> UIViewController {
    let fileLoader = FileLoader(
      fileName: Constants.fileName,
      bundle: Bundle.main,
      fileType: Constants.fileType
    )
    let service = RecipeService(
      fileLoader: fileLoader
    )
    let mapper = RecipeResponseModelMapper()
    let interactor = RecipeModuleInteractor(
      service: service
    )
    let router = RecipeRouter()
    let presenter = RecipeModulePresentor<RecipeViewController>(
      interactor: interactor,
      router: router,
      mapper: mapper,
      checking: CountChecker()
    )
    let controller = RecipeViewController(
      presenter: presenter
    )

    presenter.view = controller
    router.viewController = controller
    return controller
  }
}
