//
//  EmojiPickerVM.swift
//  Goaley
//
//  Created by Swapnanil Dhol on 17/11/22.
//

import Foundation

public protocol SwapEmojiPickerDelegate: AnyObject {
    func emojiDidPick(emoji: EmojiObject)
}

public final class SwapEmojiPickerViewModel: ObservableObject {

    @Published private(set) var emojiGroups: [EmojiGroup] = []
    @Published private(set) var filteredEmojis: [EmojiObject] = []
    @Published var searchString: String = "" { didSet { filter() } }
    public var selectedEmoji: String = ""
    private var allEmojis: [EmojiObject] = []
    public weak var delegate: SwapEmojiPickerDelegate?
    var isSearching: Bool { !searchString.isEmpty }

    // MARK: - Init
    init() {
        prepareEmojis()
    }

    // MARK: - Prepare
    private func prepareEmojis() {
        guard let url = Bundle.main.url(forResource: "emoji-list", withExtension: "json"),
              let data = try? Data(contentsOf: url)
        else { return }
        guard let emojiGroups = try? JSONDecoder().decode([EmojiGroup].self, from: data) else { return }
        DispatchQueue.main.async {
            self.emojiGroups = emojiGroups
        }
        for group in emojiGroups {
            allEmojis.append(contentsOf: group.emojis)
        }
    }

    private func filter() {
        let filteredEmojis = allEmojis.filter { emoji in
            return emoji.name.contains(searchString.lowercased())
        }
        DispatchQueue.main.async {
            self.filteredEmojis = filteredEmojis
        }
    }

    public func didSelectEmoji(_ emoji: EmojiObject) {
        delegate?.emojiDidPick(emoji: emoji)
    }
}
