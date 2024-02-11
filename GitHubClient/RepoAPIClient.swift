//
//  RepoAPIClient.swift
//  GitHubClient
//
//  Created by Masahito Mori on 2024/02/11.
//

import Foundation

protocol RepoAPIClientProtocol {
    func getRepos() async throws -> [Repo]
}

class RepoAPIClinet: RepoAPIClientProtocol {
    func getRepos() async throws -> [Repo] {
        let url = URL(string: "https://api.github.com/users/masahito-mori/repos")!
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = [
            "Accept": "application/vnd.github+json"
        ]
        // GitHub API のリクエスト数制限(60回/h)回避のためのキャッシュ設定
        urlRequest.cachePolicy = .returnCacheDataElseLoad

        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        // デコード処理
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode([Repo].self, from: data)
    }
}
