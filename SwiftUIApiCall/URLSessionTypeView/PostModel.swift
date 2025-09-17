//
//  PostModel.swift
//  SwiftUIApiCall
//
//  Created by ONS on 16/09/25.
//

import Foundation

struct Post: Codable, Identifiable {
    let id: Int
    let title: String
    let body: String
}
