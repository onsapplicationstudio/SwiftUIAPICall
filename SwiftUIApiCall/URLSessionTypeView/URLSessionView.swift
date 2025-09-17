//
//  URLSessionView.swift
//  SwiftUIApiCall
//
//  Created by ONS on 16/09/25.
//

import SwiftUI

struct URLSessionView: View {
    @StateObject private var viewModel = URLSessionVM(urlString: "https://jsonplaceholder.typicode.com/posts")
    var title: String
    @State private var showAlert: Bool = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .red]),
                           startPoint: .top,
                           endPoint: .bottom)
            .ignoresSafeArea(.all)
                        
            if viewModel.isPostAvailable {
                List(viewModel.allPosts) { post in
                    Text(post.title)
                        .font(.title3)
                }
                .scrollContentBackground(.hidden)
                .listStyle(.plain)
                .cornerRadius(10)
                .padding()
            }
            
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(2)
            }
        }
        .navigationTitle(title)
        .task {
            try? await viewModel.fetchAllPosts()
        }
        .alert(viewModel.errorMessage ?? "",
               isPresented: $viewModel.showError) {
            Button("Cancel",
                   role: .cancel,
                   action: {})
        }
    }
}

#Preview {
    URLSessionView(title: "URLSessionView")
}
