//
//  URLSessionVM.swift
//  SwiftUIApiCall
//
//  Created by ONS on 16/09/25.
//

import SwiftUI

class URLSessionVM: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var showError: Bool = false
    @Published var allPosts: [Post] = []
    var errorMessage: String?
    
    var urlString: String
    init(urlString: String) {
        self.urlString = urlString
    }
    
    var isPostAvailable: Bool {
        allPosts.count > 0
    }
    
    func fetchAllPosts() async throws {
        guard let url = URL(string: urlString) else {
            self.errorMessage = "Invalid URL"
            self.showError = true
            return
        }
        
        defer {
            self.isLoading = false
        }
        
        self.isLoading = true
        self.errorMessage = nil
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let posts = try JSONDecoder().decode([Post].self,
                                                 from: data)
            self.allPosts = posts
        } catch {
            self.errorMessage = error.localizedDescription.capitalized
            self.showError = true
        }
    }
}
