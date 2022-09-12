//
//  HighSchoolCell.swift
//  HighSchool
//
//  Created by Anju Malhotra on 9/9/22.
//

import Foundation
import UIKit

final class HighSchoolCell: UITableViewCell {
    @IBOutlet var schoolName: UILabel!
    @IBOutlet var phone: UILabel!
    @IBOutlet var email: UILabel!
    @IBOutlet var totalStudents: UILabel!
    @IBOutlet var website: UILabel!
    
    func configureCell(cellViewModel: HighSchoolCellViewModel) {
        schoolName.text = cellViewModel.schoolName
        phone.text = cellViewModel.phone
        email.text = cellViewModel.email
        totalStudents.text = cellViewModel.totalStudents
        website.text = cellViewModel.website
    }
}
