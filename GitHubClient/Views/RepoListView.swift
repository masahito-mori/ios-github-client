//
//  RepoListView.swift
//  GitHubClient
//
//  Created by 森匡人 on 2023/11/03.
//

import SwiftUI

enum Stateful<Value> {
    case loading
    case failed(Error)
    case loaded(Value)
}

struct RepoListView: View {
    @StateObject private var viewModel: RepoListViewModel
    
    init(repoAPIClient: RepoAPIClientProtocol) {
        _viewModel = StateObject(
            wrappedValue: RepoListViewModel(apiClient: repoAPIClient)
        )
    }
    
    var body: some View {
        NavigationView {
            Group {
                switch viewModel.state {
                case .loading:
                    ProgressView("loading...")
                case let .loaded(repos):
                    List(repos) { repo in
                        NavigationLink(
                            destination: RepoDetailView(repo: repo)) {
                                RepoRow(repo: repo)
                            }
                    }
                case .failed:
                    VStack {
                        Text("Failed to load repositories")
                        Button(
                            action: {
                                Task {
                                    await viewModel.onAppear()
                                }
                            },
                            label: {
                                Text("Retry")
                            }
                        )
                        .padding()
                    }
                }
            }
            .navigationTitle("Repositories")
        }
        .task {
            await viewModel.onAppear()
        }
    }
}

#Preview("Default") {
    RepoListView(repoAPIClient: MockRepoAPIClinet(
        repos: [.mock1, .mock2, .mock3, .mock4, .mock5],
        error: nil
    )
    )
}

#Preview("Error") {
    RepoListView(repoAPIClient: MockRepoAPIClinet(
        repos: [.mock1, .mock2, .mock3, .mock4, .mock5],
        error: DummyError()
    )
    )
}
