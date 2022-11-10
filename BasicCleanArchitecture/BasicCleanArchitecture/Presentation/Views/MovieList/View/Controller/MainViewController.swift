//
//  MainViewController.swift
//  BasicCleanArchitecture
//
//  Created by 김하늘 on 2022/09/27.
//

import UIKit

import RxCocoa
import RxSwift

class MainViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var searchbar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Property
    var movieArray: [Movie?] = []
    
    private var viewModel: MovieListViewModel!
    private let disposeBag = DisposeBag()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableView()
        setSearchBar()
        setInitData(viewModel: setViewModel())
    }
    
    // MARK: - Function
    private func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: Const.Identifier.TableViewCell, bundle: nil), forCellReuseIdentifier: Const.Identifier.TableViewCell)
    }
    
    private func setSearchBar() {
        searchbar.delegate = self
    }
    
    private func setViewModel() -> MovieListViewModel {
        let repository = MovieListRepository()
        let request = MovieRequest(query: "")
        let usecase = GetMovieListUseCase(repository: repository, movieRequest: request)
        viewModel = MovieListViewModel(searchUseCase: usecase)
        return viewModel
    }
    
    // 1. 초기 데이터를 요청하고 구독하고 있다가 오면 뷰에 뿌려줌
    private func setInitData(viewModel: MovieListViewModel) {
        let observable = viewModel.setInitData()
        _ = observable.subscribe { [weak self] event in
            switch event {
            case .next(let data):
                self?.movieArray = data
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .error(let error):
                print(error.localizedDescription)
            case .completed:
                break
            }
        }
    }
    
    private func bind() {
        self.searchbar.rx.text.orEmpty
            .debounce(RxTimeInterval.microseconds(5), scheduler: MainScheduler.instance)
            .distinctUntilChanged().subscribe(onNext: { [weak self] text in
                if let movieArray = self?.movieArray {
                    self?.movieArray = movieArray.filter {
                        if let movie = $0, let title = movie.title {
                            return title.hasPrefix(text)
                        }
                        else {
                            return false
                        }
                    }
                    self?.tableView.reloadData()
                }
            })
            .disposed(by: disposeBag)
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Const.Identifier.TableViewCell) as! TableViewCell
        
        var title: String = ""
        var description: String = ""
        if let movie = movieArray[indexPath.row], let movieTitle = movie.title, let movieDescription = movie.subtitle {
            
            title = movieTitle.replacingOccurrences(of: "<b>", with: "").replacingOccurrences(of: "</b>", with: "")
            description = movieDescription.replacingOccurrences(of: "<b>", with: "").replacingOccurrences(of: "</b>", with: "")
        }
        cell.titleLabel.text = title
        cell.descriptionLabel.text = description
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieArray.count
    }
    
}

extension MainViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        dismissKeyboard()
    }
    
    private func dismissKeyboard() {
        searchbar.resignFirstResponder()
    }
}

