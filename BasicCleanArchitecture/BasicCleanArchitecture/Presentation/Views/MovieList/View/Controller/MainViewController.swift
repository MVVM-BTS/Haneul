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


