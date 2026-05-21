# Word Scramble

![Swift](https://img.shields.io/badge/Swift-5.0+-FA7343?logo=swift&logoColor=white)
![iOS](https://img.shields.io/badge/iOS-18.0+-000000?logo=apple&logoColor=white)
![Xcode](https://img.shields.io/badge/Xcode-15.0+-147EFB?logo=xcode&logoColor=white)
![Framework](https://img.shields.io/badge/Framework-SwiftUI-007AFF)
![Architecture](https://img.shields.io/badge/Architecture-MVVM-8A2BE2)

An engaging iOS word game built natively with SwiftUI, developed as **Project 5** of the 100 Days of SwiftUI course.

Players are challenged to create as many valid anagrams as possible from a randomly generated root word. The app features native iOS spell-checking, a continuous scoring system, and strict custom validation rules.

## Preview
<img width="25%" alt="start" src="https://github.com/user-attachments/assets/36a9ecc4-9fcd-450e-b790-7d087758ac1d" />
<img width="25%" alt="game" src="https://github.com/user-attachments/assets/896c5c63-569d-49e6-9599-f35c19d575d2" />
<img width="25%" alt="error" src="https://github.com/user-attachments/assets/39a0d997-519a-4b88-b6fd-cbfbe9cfb567" />

## Features

* **Dynamic Word Generation:** Loads thousands of unique root words to guarantee a completely fresh game session every time.
* **Smart Validation:** Real-time rule checking prevents players from using identical, overly short, impossible, or non-existent words.
* **Score Tracking:** A persistent scoring system that rewards players for finding valid anagrams.
* **Dual-Mode Reset:** Players can request a "New Word" via the toolbar (keeping their score) or trigger a full "New Game" hard reset directly from the list section.
* **Engaging UI:** Features smooth list animations, dynamic character count icons, and clear contextual error alerts for invalid inputs.

## About the Project & Challenge

This application was built to fulfill **Project 5 (Days 29-31)** of the SwiftUI learning path created by Paul Hudson (Hacking with Swift). 

The core goal of this project was to master lists, text inputs, string manipulation, and bridging older Objective-C APIs into modern Swift. Key topics practiced and improved in this project include:

* **UIKit Bridging:** Leveraged `UITextChecker` and `NSRange` to utilize native iOS spell-checking without relying on any third-party APIs.
* **Bundle & File Parsing:** Securely locating, loading, and parsing a `start.txt` file directly from the app bundle to seed the game's dictionary.
* **SwiftUI Fundamentals:** Extensive use of `List`, `TextField`, `.onSubmit`, and trailing closures to build a fluid, reactive interface.

🔗 **[Full project description here](https://www.hackingwithswift.com/100/swiftui/29)**
