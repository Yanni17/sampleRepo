//
//  ContentView.swift
//  Batch_15
//
//  Created by tebir othman on 22.08.24.
//
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = NamesViewModel()
    @State private var newName: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    TextField("Enter name", text: $newName)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                    
                    Button(action: {
                        viewModel.addName(newName)
                        newName = ""
                    }) {
                        Text("Add")
                            .padding()
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                .padding()
                
                List(viewModel.names) { name in
                    Text(name.name)
                }
                
                Spacer()
                
                ZStack {
                    Circle()
                        .fill(.green)
                        .frame(width: 200, height: 200)
                        .overlay(
                            Text("Pick")
                                .font(.headline)
                                .foregroundColor(.white)
                        )
                    
                    
                    if let selectedName = viewModel.selectedName {
                        Text(selectedName.name)
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding()
                            .background(.black.opacity(0.7))
                            .cornerRadius(10)
                            .padding(.top, 100)
                    }
                }
                .onTapGesture {
                    viewModel.selectRandomName()
                }
                .padding()
            }
            .navigationTitle("Random Name Picker")
        }
    }
}


#Preview {
    ContentView()
}
