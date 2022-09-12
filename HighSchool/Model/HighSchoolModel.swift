//
//  HighSchoolModel.swift
//  HighSchool
//
//  Created by Anju Malhotra on 9/9/22.
//

import Foundation

struct HighSchool: Codable {
    let dbn, schoolName: String?
    let website, totalStudents, email, phone: String?

    enum CodingKeys: String, CodingKey {
        case dbn
        case website
        case schoolName = "school_name"
        case phone = "phone_number"
        case email = "school_email"
        case totalStudents = "total_students"
    }
}
