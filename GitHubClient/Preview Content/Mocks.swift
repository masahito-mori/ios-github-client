//
//  Mocks.swift
//  GitHubClient
//
//  Created by Masahito Mori on 2024/02/11.
//

import Foundation

struct DummyError: Error {}

struct MockRepoAPIClinet: RepoAPIClientProtocol {
    let repos: [Repo]
    let error: Error?
    
    func getRepos() async throws -> [Repo] {
        if let error {
            throw error
        }
        return repos
    }
}
