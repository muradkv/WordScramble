//
//  UsedWordRowView.swift
//  WordScramble
//
//  Created by murad on 18.10.2026.
//

import SwiftUI

struct UsedWordRowView: View {
    let word: String
    
    var body: some View {
        HStack {
            Image(systemName: "\(word.count).circle")
            Text(word)
        }
        .accessibilityElement()
        .accessibilityLabel("\(word), \(word.count) letters")
    }
}

#Preview {
    List {
        UsedWordRowView(word: "silkworm")
    }
}
