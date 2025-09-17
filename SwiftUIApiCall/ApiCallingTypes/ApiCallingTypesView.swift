//
//  ApiCallingTypesView.swift
//  SwiftUIApiCall
//
//  Created by ONS on 16/09/25.
//

import SwiftUI

struct ApiCallingTypesView: View {
    private let callingTypes = ["URLSession"]
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.green, Color.gray]),
                               startPoint: .top,
                               endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
                
                List(callingTypes,
                     id: \.self) { type in
                    NavigationLink(destination: URLSessionView(title: type)) {
                        Text(type)
                    }
                }
                     .scrollContentBackground(.hidden)
                     .background(Color.clear)
            }
            .navigationBarTitle("Api Calling Types")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ApiCallingTypesView()
}
