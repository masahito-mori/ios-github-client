//
//  RepoListView.swift
//  GitHubClient
//
//  Created by 森匡人 on 2023/11/03.
//

import SwiftUI

@MainActor
class ReposStore: ObservableObject {
    @Published private(set) var repos = [Repo]()
    
    func loadRepos() async {
        try! await Task.sleep(nanoseconds: 1_000_000_000)
        repos = [.mock1, .mock2, .mock3, .mock4, .mock5]
    }
}

struct RepoListView: View {
    @StateObject private var reposStore = ReposStore()
    
    var body: some View {
        NavigationView {
            if reposStore.repos.isEmpty {
                ProgressView("loading...")
            } else {
                List(reposStore.repos) { repo in
                    NavigationLink(
                        destination: RepoDetailView(repo: repo)) {
                        RepoRow(repo: repo)
                    }
                }
                .navigationTitle("Repositories")
            }
        }
        .task {
            await reposStore.loadRepos()
        }
    }
}

#Preview {
    RepoListView()
}
