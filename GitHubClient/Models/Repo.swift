//
//  Repo.swift
//  GitHubClient
//
//  Created by 森匡人 on 2023/11/03.
//

struct Repo: Identifiable {
    var id: Int
    var name: String
    var owner: User
}