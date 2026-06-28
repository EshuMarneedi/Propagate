# AGENTS.md: Adhere to these instructions when writing Swift and SwiftUI code in this repository.

## Required Project Skills
- Before editing any code in this project, you **must** first read your `SwiftUI-Pro` skill (third-party code style guidelines) and `SwiftUI-Guidelines` (first-party recommendations from Apple) skill. Do not edit code without reading these skills. You need not read this skill if you are not editing code.
- If you are editing SwiftData code, use the `SwiftData-Pro` skill.
- Currently soft-deprecated APIs as of iOS 27 — and their replacements — are listed in the `SwiftUI-Guidelines` skill. Do not use these soft-deprecated APIs. If you see one being used in the codebase, replace it with its alternative.

## Fetching Up-To-Date Documentation 

Always use the Sosumi MCP connector when working with SwiftUI code. APIs you know of may be deprecated, and new APIs may be available. The Sosumi MCP connector gives you up-to-date information about the latest Apple APIs. You can search using the searchAppleDocumentation tool, get a readable version of documentation you already know using fetchAppleDocumentation, and view documentation using `doc://{path}`. 

It may be best to first perform a web search to find the path to Apple documentation, after which you can use fetchAppleDocumentation as part of Sosumi. When you perform a web search and try to access a developer.apple.com link, it will return an error that JavaScript must be enabled. Sosumi allows you to bypass this JavaScript requirement.

## Core Instructions

- Target iOS/iPadOS/visionOS 26 and newer. (iOS 27 is currently available in beta.) 
- Swift 6.2 or later, using modern Swift concurrency.
- SwiftUI backed up by `@Observable` classes for shared data.
- Do not introduce third-party frameworks without asking first.
- Avoid UIKit unless requested.

## Project Information

- This app is a simple video player for iOS that receives and stores local videos from the Files app. The player is in `PlayerView.swift`, and a list of recently watched videos is in `VideoListView.swift`. 
- The `AVPlayerViewController`, responsible for viewing videos, is created in `Player.swift` using `UIViewControllerRepresentable`. The app is written in SwiftUI, except for the video player.
- `PlayerView.swift` displays `Player.swift` and sets up and tears down the player when opened.
- A SwiftData model, `Video.swift`, is used to store recently watched videos.
- Data flow for videos from Files:
  - A URL comes in from Files through `PropagateApp.swift`. It is validated and passed to `ContentView` as `openedURL`. 
  - The `onChange` modifier on `ContentView` watches for changes in `openedURL`, and if a change is detected, adds the video to the model context, converts the URL to an Identifiable URL through `IdentifiableURL.swift`, and assigns it to`selectedVideoURL`.
  - A `fullScreenCover`  on `ContentView` watches for changes on `selectedVideoURL` and displays `PlayerView` with that URL.
- Data flow for stored videos:
  - When a video is tapped in `VideoListView`, it invokes a closure, which is acted upon in `ContentView`. 
  - In `ContentView`, the item comes in from `VideoListView`’s closure, the URL is validated and converted to an Identifiable URL, and is assigned to `selectedVideoURL`. 
  - A `fullScreenCover`  on `ContentView` watches for changes on `selectedVideoURL` and displays `PlayerView` with that URL.

## Project Structure
- Use a consistent project structure with folders. 
- Write understandable, **Swift-native**, human-readable code. Think about core computer science principles like encapsulation, abstraction, code reuse, cohesion, and data flow. Never write more code than you absolutely must, and always think about the most efficient way of solving a problem.
- Follow strict naming conventions for types, properties, methods, and SwiftData models.
- Generally, break different types up into different Swift files rather than placing multiple structs, classes, or enums into a single file.
- Add code comments and documentation comments **only as needed**. Be brief and informative in your comments. **Do not** split comments onto multiple lines.

## Specific Swift and SwiftUI Reminders

- Do not use deprecated APIs. You can find soft-deprecated APIs in the SwiftUI skills. If you suspect an API may be deprecated, look it up using Sosumi. 
- Always mark `@Observable` classes with `@MainActor`.
- Assume strict Swift concurrency rules are being applied.
- Place view logic into view models or similar. The app should be extensible. 
- Do not force specific font sizes; prefer using Dynamic Type instead.
- Do not use `NavigationView`, as it is deprecated. Use `NavigationStack` instead.
- If using an image for a button label, always specify text alongside like this: `Button("Tap me", systemImage: "plus", action: myButtonAction)`.
- Always use `foregroundStyle()` instead of `foregroundColor()`.
- Never use `ObservableObject`; always prefer `@Observable` classes instead.