# DVProgressLabel

[![Version](https://img.shields.io/cocoapods/v/DVProgressLabel.svg?style=flat)](https://cocoapods.org/pods/DVProgressLabel)
[![License](https://img.shields.io/cocoapods/l/DVProgressLabel.svg?style=flat)](https://cocoapods.org/pods/DVProgressLabel)
[![Platform](https://img.shields.io/cocoapods/p/DVProgressLabel.svg?style=flat)](https://cocoapods.org/pods/DVProgressLabel)

## Preview

![ProgressMaskLabel](https://user-images.githubusercontent.com/61190690/142808765-a8a91b54-5992-48b4-a47e-b22257ceadf2.gif)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- iOS 10.0+
- Swift 5

## Installation

DVProgressLabel is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'DVProgressLabel'
```

## Usage

### Progress

```swift
func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) { 
    let progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
    progressMaskLabel.update(progress: progress)
}
```
You can detect when progress did finished with `didFinishMasking` property. 
It will be `true` when `progress` is set to a value greater than or equal to 1.0.

```swift
if progressMaskLabel.didFinishMasking {
    // Next step
}
```

You can also get current progress with `progress` property.

```swift
let progress = progressMaskLabel.progress
```

### Color

![progressMaskLabel-usage](https://user-images.githubusercontent.com/61190690/151121601-8dfe6c22-866e-49f3-86a1-6597eb10f51a.gif)

You can set stroke color with `maskStokeColor` property when the label is being masked.

```swift
progressMaskLabel.maskStrokeColor = .green
```

You can set fill color with `maskStokeColor` property when the label is being masked.

```swift
progressMaskLabel.maskColor = .white
```

## Author

anjaeyoung26, dkswodud011@naver.com

## License

DVProgressLabel is available under the MIT license. See the LICENSE file for more info.
