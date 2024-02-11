//
//  User.swift
//  GitHubClient
//
//  Created by 森匡人 on 2023/11/03.
//

struct User: Decodable, Equatable {
    var name: String

    private enum CodingKeys: String, CodingKey {
        case name = "login"
    }
}
