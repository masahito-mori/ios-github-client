//
//  RepoListView.swift
//  GitHubClient
//
//  Created by 森匡人 on 2023/11/03.
//

import SwiftUI

struct RepoListView: View {
    private let mockRepos: [Repo] = [
        .mock1, .mock2, .mock3, .mock4, .mock5
    ]
    
    var body: some View {
        List(mockRepos) { item in
            RepoRow(repo: item)
        }
    }
}

#Preview {
    RepoListView()
}
