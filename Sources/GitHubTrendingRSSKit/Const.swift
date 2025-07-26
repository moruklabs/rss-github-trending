// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation

public class Const {
    public static let bundleIdentifier = "ai.moruk.github.rss-github-trending"

    public static let rssHomeURL = URL(string: "https://rss.github.moruk.ai")!
    public static let gitHubAPIBaseURL = URL(string: "https://api.github.com")!
    public static let gitHubAPIEmojisURL = URL(string: "\(gitHubAPIBaseURL)/emojis")!
    public static let gitHubTopTrendingURL = URL(string: "\(gitHubBaseURL)/trending")!
    public static let gitHubBaseURL = URL(string: "https://github.com")!
    public static let gitHubRepositoryURL = URL(string: "https://github.com/moruklabs/rss-github-trending")!
    public static let pageTitle = "GitHub Trending RSS"
    public static let author = "Manabu Nakazawa"

    public static let outputDirectoryName = "output"
    public static let outputDirectory = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
        .appendingPathComponent(outputDirectoryName)

    public static var resourcesRootURL: URL {
        let url = URL(fileURLWithPath: #file)
            .deletingLastPathComponent()
            .deletingLastPathComponent()
            .deletingLastPathComponent()
            .appendingPathComponent("Resources")

        guard url.hasDirectoryPath else {
            fatalError("Test resources folder doesn't exist: \(url.absoluteString)")
        }
        return url
    }

    public static let googleAnalyticsTrackingCode = "UA-46019833-3"

    public private(set) static var gitHubClientID: String!
    public private(set) static var gitHubClientSecret: String!

    public static let popularLanguages = [
        "all",
        "applescript",
        "c",
        "c++",
        "c#",
        "common-lisp",
        "css",
        "dart",
        "dockerfile",
        "emacs-lisp",
        "f#",
        "go",
        "haskell",
        "haxe",
        "html",
        "java",
        "javascript",
        "jupyter-notebook",
        "kotlin",
        "lua",
        "objective-c",
        "perl",
        "php",
        "powershell",
        "python",
        "r",
        "ruby",
        "rust",
        "scala",
        "shell",
        "swift",
        "svg",
        "tex",
        "typescript",
        "xml",
        "xslt",
    ]

    public static func setup(gitHubClientID: String, gitHubClientSecret: String) {
        self.gitHubClientID = gitHubClientID
        self.gitHubClientSecret = gitHubClientSecret
    }
}
