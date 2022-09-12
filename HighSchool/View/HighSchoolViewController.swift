//
//  ViewController.swift
//  HighSchool
//
//  Created by Anju Malhotra on 9/9/22.
//

import UIKit

class HighSchoolViewController: UIViewController {
    @IBOutlet var schoolTableView: UITableView!
    private let viewModel = HighSchoolViewModel()
    private let activityView = UIActivityIndicatorView(style: .large)
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    private func configure() {
        title = Constants.highSchoolTitle
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshUI(refreshControl:)), for: .valueChanged)
        self.schoolTableView.refreshControl = refreshControl
        getData()
    }
    
    @objc func refreshUI(refreshControl: UIRefreshControl) {
        reloadView()
        refreshControl.endRefreshing()
    }
        
    private func reloadView() {
        getData()
        
    }
    private func getData() {
        activityView.show(with: view)
        viewModel.getHighSchoolData { [weak self] in
            guard let self = self else {
                self?.showAlert(Constants.retryError)
                return }
            DispatchQueue.main.async {
                self.activityView.hide()
                if self.viewModel.highSchools != nil {
                    self.schoolTableView.reloadData()
                }
            }
        }
    }
    
    private func showAlert(_ error: String?) {
        if let currentAlert = self.presentedViewController as? UIAlertController {
            currentAlert.message = error
            return
        }
        let alert = UIAlertController(title: Constants.error, message: error, preferredStyle: .alert)
        let actionOk = UIAlertAction(title: Constants.ok, style: .cancel)
        alert.addAction(actionOk)
        present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == Constants.schoolSegue)
                {
        let viewModel = ScoreViewModel(satResult: viewModel.satResult)
        let destinationVC = segue.destination as? ScoreViewController
        destinationVC?.viewModel = viewModel
        }
    }
}

extension HighSchoolViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(HighSchoolCell.self)") as? HighSchoolCell, let school = viewModel.highSchools?[indexPath.row] else {
            return UITableViewCell()
        }
        let cellViewModel = HighSchoolCellViewModel(schoolName: school.schoolName, phone: school.phone, email: school.email, totalStudents: school.totalStudents, website: school.website)
        cell.configureCell(cellViewModel: cellViewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let dbn = viewModel.highSchools?[indexPath.row].dbn {
            viewModel.getScore(for: dbn) {
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: Constants.schoolSegue, sender: self)
                }
            }
        } else {
            showAlert(Constants.retryError)
        }
    }
}
