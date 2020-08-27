/*
 
 Copyright (c) <2020>
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 
 */

import SwiftUI

struct RectangleFramer : ViewModifier {
    
    var corderRadius : CGFloat = 5
    
    func body(content: Content) -> some View {
        content.mask(RoundedRectangle(cornerRadius: corderRadius)).overlay(RoundedRectangle(cornerRadius: corderRadius).stroke(Color.accentColor, style: .init(lineWidth: 2))).padding(3)
    }
}

extension View {
    
    public func addRectangleFrame() -> some View {
        self.modifier(RectangleFramer())
    }
    
}

struct RectangleFramer_Previews: PreviewProvider {
    
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Group {
            Text("Hello, World!").padding().addRectangleFrame().padding().preferredColorScheme(.light)
            Text("Hello, World!").padding().addRectangleFrame().padding().preferredColorScheme(.dark)
        }
    }
}
