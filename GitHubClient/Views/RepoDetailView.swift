//
//  RepoDetailView.swift
//  GitHubClient
//
//  Created by 森匡人 on 2023/11/03.
//

import SwiftUI

struct RepoDetailView: View {
    let repo: Repo
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Image("GitHubMark")
                        .resizable()
                        .frame(width: 16, height: 16)
                    Text(repo.owner.name)
                        .font(.caption)
                }

                Text(repo.name)
                    .font(.body)
                    .fontWeight(.bold)
                    
                if let description = repo.description {
                    Text(description)
                        .padding(.top, 4)
                }
                
                HStack {
                    Image(systemName: "star")
                    Text("\(repo.stargazersCount) stars")
                }
                .padding(.top, 8)
                
                Spacer()
            }
            Spacer()
        }
        .padding(8)
        .navigationTitle("Repository Detail")
    }
}

#Preview {
    RepoDetailView(repo: .mock1)
}
