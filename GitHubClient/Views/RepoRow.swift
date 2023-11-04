//
//  RepoRow.swift
//  GitHubClient
//
//  Created by 森匡人 on 2023/11/03.
//

import SwiftUI

struct RepoRow: View {
    let repo: Repo
    
    var body: some View {
        HStack {
            Image("GitHubMark")
                .resizable()
                .frame(width: 44.0, height: 44.0)
            VStack(alignment: .leading) {
                Text(repo.owner.name)
                    .font(.caption)
                Text(repo.name)
                    .font(.body)
                    .fontWeight(.semibold)
            }
        }
    }
}

#Preview {
    let repo = Repo.mock1
    return RepoRow(repo: repo)
}
