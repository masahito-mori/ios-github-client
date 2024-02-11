//
//  RepoListViewModel.swift
//  GitHubClient
//
//  Created by Masahito Mori on 2024/02/11.
//

import Foundation

@MainActor
class RepoListViewModel: ObservableObject {
    @Published private(set) var state: Stateful<[Repo]> = .loading
    
    private let apiClient: RepoAPIClientProtocol
    
    init(apiClient: RepoAPIClientProtocol = RepoAPIClinet()) {
        self.apiClient = apiClient
    }
    
    func onAppear() async {
        await loadRepos()
    }
    
    func onRetryButtonTapped() async {
        await loadRepos()
    }
    
    private func loadRepos() async {
        state = .loading
        
        do {
            let value = try await apiClient.getRepos()
            state = .loaded(value)
        } catch {
            state = .failed(error)
        }
    }
}
