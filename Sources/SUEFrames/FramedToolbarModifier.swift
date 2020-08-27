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

extension FrameView {
    
    func toolbar<V: View>(_ toolbar: V) -> some View{
        
        self.modifier(FramedToolbar(toolbar: toolbar))
    }
    
}

struct FramedToolbar<ToolBar: View> : ViewModifier {
    
    var toolbar : ToolBar
    
    var padding : CGFloat = 5
    var lineWidth: CGFloat = 3
    var cornerRadius: CGFloat = 15
    
    func body(content: Content) -> some View {
        
        ZStack(alignment: .bottom){
            content.zIndex(0)
            overlay.zIndex(1)
        }
    }
    
    var overlay : some View {
        
        FrameView(paddedContent, lineWidht: lineWidth, cornerRadius: cornerRadius)
            .padding(.bottom, cornerRadius+lineWidth+padding)
            .padding(.horizontal, lineWidth+padding)
    }
    
    var paddedContent : some View {
        toolbar
            .padding(padding)
            .background(Color.secondary.opacity(0.8))
            
    }
}

#if DEBUG
struct FrameViewToolbar_Previews: PreviewProvider {
    
    static var previews: some View {
        
        FrameView(Rectangle().foregroundColor(.gray))
            .toolbar(Label("Toolbar", systemImage: "gear"))
    }
}
#endif
