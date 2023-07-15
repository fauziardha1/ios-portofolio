//
//  HomeProtocols.swift
//  bangunin
//
//  Created by Fauzi Arda on 10/07/23.
//

import Foundation

protocol HomeDisplayLogic {
    func updateCurrentLocation()
    func displayFirstViewOfMap(_ position: AnnotationModel?, _ regionRadius: Double)
    func displayCurrentLocationNotation()
}

protocol HomeBusinessLogic {
    var presenter: HomePresentationLogic? {get set}
    func getCurrentLocation()
    func setNewAnnotation()
}

protocol HomePresentationLogic: class {
    var controller: HomeViewController? { get set }
    func setFirstViewOfMap()
    func updateCurrentLocation()
    func displayCurrentLocationNotation()
}
