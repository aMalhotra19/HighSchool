//
//  ScoreViewController.swift
//  HighSchool
//
//  Created by Anju Malhotra on 9/9/22.
//

import Foundation
import UIKit

class ScoreViewController: UIViewController {
    var viewModel = ScoreViewModel()
    @IBOutlet var school: UILabel!
    @IBOutlet var satTakers: UILabel!
    @IBOutlet var criticalScore: UILabel!
    @IBOutlet var mathScore: UILabel!
    @IBOutlet var writingScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    private func configure() {
        guard let satResults = viewModel.satResult else {
            showAlert(Constants.noData)
            return
        }
        school.text = satResults.schoolName.camelCased()
        satTakers.text = satResults.numOfSatTestTakers
        criticalScore.text = satResults.satCriticalReadingAvgScore
        mathScore.text = satResults.satMathAvgScore
        writingScore.text = satResults.satWritingAvgScore
    }
    
    private func showAlert(_ error: String?) {
        if let currentAlert = self.presentedViewController as? UIAlertController {
            currentAlert.message = error
            return
        }
        let alert = UIAlertController(title: Constants.error, message: error, preferredStyle: .alert)
        let actionOk = UIAlertAction(title: Constants.ok, style: .default) { _ in
            self.dismiss(animated: false)
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(actionOk)
        present(alert, animated: true, completion: nil)
    }
}
