//
//  WordScrambleViewModel.swift
//  WordScramble
//
//  Created by murad on 21.05.2026.
//

import SwiftUI

class WordScrambleViewModel: ObservableObject {
    @Published private(set) var usedWords = [String]()
    @Published private(set) var rootWord = ""
    @Published private(set) var errorTitle = ""
    @Published private(set) var errorMessage = ""
    @Published private(set) var score = 0
    @Published var newWord = ""
    @Published var showingError = false
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !answer.isEmpty else { return }
        
        guard answer != rootWord else {
            wordError(title: "Nice try", message: "You can't just copy the original word!")
            return
        }
        
        guard answer.count >= 3 else {
            wordError(title: "Word too short", message: "Words must be at least 3 letters long.")
            return
        }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        
        score += 1
        newWord = ""
    }
    
    func startGame() {
        usedWords.removeAll()
        newWord = ""
        
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL, encoding: .utf8) {
                
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                
                return
            }
        }
        
        fatalError("Could not load start.txt from bundle.")
    }
    
    private func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    private func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        
        return true
    }
    
    private func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
    }
    
    private func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
    
    func newGame() {
        score = 0
        startGame()
    }
}
