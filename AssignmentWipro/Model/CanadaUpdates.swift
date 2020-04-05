//
//  Canada.swift
//  AssignmentWipro
//
//  Created by Aditi Garg on 05/04/20.
//  Copyright © 2020 Aditi Garg. All rights reserved.
//

import UIKit

struct CanadaUpdates : Codable {
    var title : String?
    var description : String?
    var imageHref : String?
}

struct Rows : Codable {
    var rows : [Rows]
}
