# SUEFrames

SwiftUI Views modifiers to add frames

<p align="center">
<a href="LICENSE.md">
    <img src="https://img.shields.io/badge/license-MIT-brightgreen.svg" alt="MIT License">
</a>
<a href="https://swift.org">
    <img src="https://img.shields.io/badge/swift-5.3-brightgreen.svg" alt="Swift 5.3">
</a>

SUE stands for *S*wift*U*I *E*xtras and is a collection of small SwiftUI libraries for various recurring use cases

## Gallery

### addRectangleFrame
```swift
Text("Hello, World!").padding().addRectangleFrame().padding()
```
![addRectangleFrame](Doc/addRectangleFrame.png)

### addFrame
```swift
Text("Hallo Welt").padding(10).addFrame()
```
![addFrame](Doc/addFrame.png)

```swift
Text("Hallo Welt").padding(10).addFrame(topToolbar: Text("Top"))
```
![addFrame](Doc/addFrameTop.png)

```swift
Text("Hallo Welt").padding(10).addFrame(bottomToolbar: Text("Bottom"))
```
![addFrame](Doc/addFrameBottom.png)


## License

MIT license; see [LICENSE](LICENSE.md).
(c) 2020
