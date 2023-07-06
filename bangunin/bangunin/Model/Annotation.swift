//
//  Annotation.swift
//  bangunin
//
//  Created by Fauzi Arda on 05/07/23.
//

import Foundation

struct AnnotationModel {
    let lat: Double
    let long: Double
    let title: String
    let subTitle: String?
    
    init(lat: Double, long: Double, title: String, subTitle: String? = "") {
        self.lat = lat
        self.long = long
        self.title = title
        self.subTitle = subTitle
    }
}
