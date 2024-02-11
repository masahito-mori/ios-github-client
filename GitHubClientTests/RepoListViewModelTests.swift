//
//  RepoListViewModelTests.swift
//  RepoListViewModelTests
//
//  Created by Masahito Mori on 2024/02/11.
//

import XCTest
@testable import GitHubClient

@MainActor
final class RepoListViewModelTests: XCTestCase {
    func test_onAppear_正常系() async {
        let viewModel = RepoListViewModel(apiClient:
            RepoAPIClinet(repos: [.mock1, .mock2])
        )
        
        await viewModel.onAppear()
        
        switch viewModel.state {
        case let .loaded(repos):
            XCTAssertEqual(repos, [Repo.mock1, Repo.mock2])
        default:
            XCTFail()
        }
    }
    
    struct RepoAPIClinet: RepoAPIClientProtocol {
        let repos: [Repo]
        
        func getRepos() async throws -> [Repo] {
            repos
        }
    }
}
