//
//  MainViewController.swift
//  BasicCleanArchitecture
//
//  Created by 김하늘 on 2022/09/27.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Property
    var dummyArray: [Movie] = [Movie(Title: "aaa", score: 100.0),
                               Movie(Title: "bbb", score: 90.8),
                               Movie(Title: "ccc", score: 88.3),
                               Movie(Title: "ddd", score: 70.5)]
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableView()
    }
    
    // MARK: - Function
    private func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: Const.Identifier.TableViewCell, bundle: nil), forCellReuseIdentifier: Const.Identifier.TableViewCell)
    }
    
    
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
        cell.titleLabel.text = dummyArray[indexPath.row].Title
        cell.descriptionLabel.text = String(dummyArray[indexPath.row].score)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyArray.count
    }
    
}


