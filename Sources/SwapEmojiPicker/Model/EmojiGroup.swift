//
//  EmojiGroup.swift
//  Goaley
//
//  Created by Swapnanil Dhol on 19/11/22.
//

import Foundation

public struct EmojiGroup: Hashable, Codable {
    public static func == (lhs: EmojiGroup, rhs: EmojiGroup) -> Bool {
        return lhs.name == rhs.name
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }

    let name, slug: String
    let emojis: [EmojiObject]
}

// MARK: - Emoji Object
public struct EmojiObject: Hashable, Codable {
    let emoji: String
    let skinToneSupport: Bool
    let name, slug, unicodeVersion, emojiVersion: String
    let skinToneSupportUnicodeVersion: String?

    enum CodingKeys: String, CodingKey {
        case emoji
        case skinToneSupport = "skin_tone_support"
        case name, slug
        case unicodeVersion = "unicode_version"
        case emojiVersion = "emoji_version"
        case skinToneSupportUnicodeVersion = "skin_tone_support_unicode_version"
    }
}
