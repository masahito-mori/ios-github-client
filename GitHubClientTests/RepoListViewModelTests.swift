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
        let viewModel = RepoListViewModel(
            apiClient: MockRepoAPIClinet(
                repos: [.mock1, .mock2],
                error: nil
            )
        )
        
        await viewModel.onAppear()
        
        switch viewModel.state {
        case let .loaded(repos):
            XCTAssertEqual(repos, [Repo.mock1, Repo.mock2])
        default:
            XCTFail()
        }
    }
    
    func test_onAppear_異常系() async {
        let viewModel = RepoListViewModel(
            apiClient: MockRepoAPIClinet(
                repos: [],
                error: DummyError()
            )
        )
        
        await viewModel.onAppear()
        
        switch viewModel.state {
        case let .failed(error):
            XCTAssert(error is DummyError)
        default:
            XCTFail()
        }
    }
}
