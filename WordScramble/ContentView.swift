//
//  ContentView.swift
//  WordScramble
//
//  Created by murad on 21.05.2026.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = WordScrambleViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    HStack {
                        Text("Score: \(viewModel.score)")
                            .font(.headline)
                        
                        Spacer()
                        
                        Button("New Game", action: viewModel.newGame)
                            .buttonStyle(.borderless)
                    }
                }
                
                Section {
                    TextField("Enter your word", text: $viewModel.newWord)
                        .textInputAutocapitalization(.never)
                }
                
                Section {
                    ForEach(viewModel.usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(viewModel.rootWord)
            .onSubmit(viewModel.addNewWord)
            .onAppear(perform: viewModel.startGame)
            .alert(viewModel.errorTitle, isPresented: $viewModel.showingError) { } message: {
                Text(viewModel.errorMessage)
            }
            .toolbar {
                Button("New word", action: viewModel.startGame)
            }
        }
    }
}

#Preview {
    ContentView()
}
