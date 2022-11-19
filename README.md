#SwapEmojiPicker

This is SwapEmojiPicker a simple SwiftUI Emoji Picker for your iOS 14+ applications. It has inbuilt search and delegate callbacks and binding to the selected emoji.

## Installation
`SwapEmojiPicker` is available via [Swift Package Manager](https://swift.org/package-manager/). To add `SwapEmojiPicker ` simply add this repo’s URL to your project’s package file. You can choose to use one of the stable releases (tagged) or you can point your package file to the main branch of this project. Although, I would not merge broken code into `main`, if you prefer stability, it’s recommended to use a tagged version.

```
https://github.com/SwapnanilDhol/SwapEmojiPicker
```

## Usage
`SwapEmojiPicker` follows the MVVM architecture and has a `SwapEmojiPickerViewModel`that is passed to the `SwapEmojiPickerView`.

To present the emoji picker
```swift
let viewModel = SwapEmojiPickerViewModel()
let view = SwapEmojiPickerView(viewModel: viewModel)
let controller = UIHostingController(rootView: view)
present(controller, animated: true)
```

### Callbacks
`SwapEmojiPickerViewModel` has two choices to receive data about the selected emoji: Delegate and simple variable access.

#### Simple variable access
`SwapEmojiPickerViewModel` has a variable `selectedEmoji` that you can access at anytime to get the currently selected variable. Although this method is not preferred, it is still an option. The better way to access the selected item is the following

#### Delegate
`SwapEmojiPickerViewModel` has a weak var delegate of type `SwapEmojiPickerDelegate` which has one required function:

```swift
func emojiDidPick(emoji: EmojiObject)
```
The object that sets itself as the delegate and conforms to the type will receive information about the selected emoji in the form of `EmojiObject`. From this object you can access information such as the name, `unicodeVerison`, and more. To check all the properties available on `EmojiObject` please right click and jump to definition of the same.

## Like the framework?
If you like `SwapEmojiPicker` please consider buying me a coffee. 🥰

<a href="https://www.buymeacoffee.com/swapnanildhol"><img src="https://img.buymeacoffee.com/button-api/?text=Buy me a coffee&emoji=&slug=swapnanildhol&button_colour=5F7FFF&font_colour=ffffff&font_family=Cookie&outline_colour=000000&coffee_colour=FFDD00"></a>

You can also view my iOS products on Gumroad:
<script src="https://gumroad.com/js/gumroad.js"></script>
<a class="gumroad-button" href="https://swapnanildhol.gumroad.com/l/appTools">Buy on</a>

## Contributions 
Contributions are always welcome. Please follow the following convention if you’re contributing:
* NameOfFile: Changes Made 
* One commit per feature 
* For issue fixes: #IssueNumber NameOfFile: ChangesMade

## License
This project is licensed under the MIT License - see the  [LICENSE](https://github.com/SwapnanilDhol/SwapEmojiPicker/blob/main/Resources/LICENSE.md)  file for details
