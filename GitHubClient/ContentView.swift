//
//  ContentView.swift
//  GitHubClient
//
//  Created by 森匡人 on 2023/11/03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Image("GitHubMark")
                .resizable()
                .frame(width: 44.0, height: 44.0)
            VStack(alignment: .leading) {
                Text("Owner Name")
                    .font(.caption)
                Text("Good evening, world!")
                    .font(.body)
                    .fontWeight(.semibold)
            }
        }
    }
}

#Preview {
    ContentView()
}
