//
//  ErrorEnum.swift
//  KeepCoding_DragonBallAPI_Calzadilla_C
//
//  Created by IsaDevs on 19/12/22.
//

import Foundation

enum NetworkError : Error {
    case malformedURL
    case noData
    case statusCode(code: Int?)
    case decodingFailed
    case unknown
}
