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

extension View {
    
    public func addFrame() -> some View{
        
        self.modifier(Framer<EmptyView,EmptyView>())
    }
    
    public func addFrame<T: View, B: View>(topToolbar: T, bottomToolbar: B) -> some View {
        
        self.modifier(Framer(top: topToolbar, bottom: bottomToolbar))
    }
    
    public func addFrame<T: View>(topToolbar: T) -> some View {
        
        self.modifier(Framer<T,EmptyView>(top: topToolbar))
    }

    public func addFrame<B: View>(bottomToolbar: B) -> some View {
        
        self.modifier(Framer<EmptyView,B>(bottom: bottomToolbar))
    }
    
    
}

struct Framer<T: View, B: View> : ViewModifier {
    
    var top: T?
    var bottom : B?
    
    var padding : CGFloat = 5
    var lineWidth: CGFloat = 3
    var cornerRadius: CGFloat = 15
    
    func body(content: Content) -> some View {
            
        FrameView(top: {top}, content, bottom: {bottom}, padding: padding, lineWidht: lineWidth, cornerRadius: cornerRadius)
    }
}

#if DEBUG
struct Framer_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Text("Hallo Welt").padding(10).addFrame()
    }
    
    
}

struct FramerTop_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Text("Hallo Welt").padding(10).addFrame(topToolbar: Text("Top"))
    }
    
    
}

struct FramerBottom_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Text("Hallo Welt").padding(10).addFrame(bottomToolbar: Text("Bottom"))
    }
    
    
}
#endif
