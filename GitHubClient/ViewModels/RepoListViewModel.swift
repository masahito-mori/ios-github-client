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
    
    func onAppear() async {
        await loadRepos()
    }
    
    func onRetryButtonTapped() async {
        await loadRepos()
    }
    
    private func loadRepos() async {
        state = .loading
        
        do {
            let value = try await RepoAPIClinet().getRepos()
            state = .loaded(value)
        } catch {
            state = .failed(error)
        }
    }
}
