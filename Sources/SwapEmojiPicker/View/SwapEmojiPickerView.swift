//
//  SwapEmojiPickerView.swift
//  Goaley
//
//  Created by Swapnanil Dhol on 17/11/22.
//

import SwiftUI

public struct SwapEmojiPickerView: View {

    @ObservedObject var viewModel: SwapEmojiPickerViewModel

    public var body: some View {
        NavigationView {
            ScrollView {
                TextField("Search...", text: $viewModel.searchString)
                    .autocorrectionDisabled(true)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(.quaternarySystemFill))
                    )
                    .padding()
                if viewModel.isSearching {
                    EmojiListSearchingView()
                        .environmentObject(viewModel)
                } else {
                    EmojiListView()
                        .environmentObject(viewModel)
                }
            }
            .navigationTitle("Emoji Picker")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        UIApplication.topViewController()?.dismiss(animated: true)
                    } label: {
                        Image(systemName: "xmark.circle")
                            .foregroundColor(.red)
                            .font(.headline)
                    }
                }
            }
        }
    }
}

private struct EmojiListView: View {

    @EnvironmentObject var viewModel: SwapEmojiPickerViewModel
    private let rows = [
        GridItem(.flexible(minimum: 60)),
        GridItem(.flexible(minimum: 60)),
        GridItem(.flexible(minimum: 60)),
    ]

    var body: some View {
        ForEach(viewModel.emojiGroups, id: \.self) { group in
            DisclosureGroup {
                ScrollView(.horizontal) {
                    LazyHGrid(rows: rows, spacing: 5) {
                        ForEach(group.emojis, id: \.self) { emoji in
                            Button {
                                viewModel.selectedEmoji = emoji.emoji
                                viewModel.didSelectEmoji(emoji)
                            } label: {
                                Text(emoji.emoji)
                                    .font(.largeTitle)
                            }
                            .padding(.horizontal, 6)
                        }
                    }
                }
            } label: {
                Text(group.name)
                    .font(.headline)
            }
            .buttonStyle(.plain)
        }
        .padding()
    }
}

private struct EmojiListSearchingView: View {
    @EnvironmentObject var viewModel: SwapEmojiPickerViewModel
    let layout = [
        GridItem(.adaptive(minimum: 50))
    ]

    var body: some View {
        LazyVGrid(columns: layout, spacing: 5) {
            ForEach(viewModel.filteredEmojis, id: \.self) { emoji in
                Button {
                    viewModel.selectedEmoji = emoji.emoji
                    viewModel.didSelectEmoji(emoji)
                } label: {
                    Text(emoji.emoji)
                        .font(.largeTitle)
                }
                .buttonStyle(.plain)
                .padding(.horizontal, 6)
            }
        }
        .padding()
    }
}

private struct EmojiPickerView_Previews: PreviewProvider {
    static var previews: some View {
        SwapEmojiPickerView(viewModel: SwapEmojiPickerViewModel())
    }
}
