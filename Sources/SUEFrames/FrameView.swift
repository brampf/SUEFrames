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

import Foundation
import SwiftUI

public struct FrameView<Content: View, T: View, B: View> : View {
    
    var topToolbar : (() -> T)?
    var content : Content
    var bottomToolbar : (() -> B)?
    
    var padding : CGFloat = 5
    var lineWidht: CGFloat = 5
    var cornerRadius: CGFloat = 30

    public init(top: @escaping () -> T, _ content: Content, bottom: @escaping () -> B){
        self.content = content
        self.topToolbar = top
        self.bottomToolbar = bottom
    }
    
    internal init(top: @escaping () -> T, _ content: Content, bottom: @escaping () -> B, padding: CGFloat = 5, lineWidht : CGFloat = 5, cornerRadius: CGFloat = 30){
        self.content = content
        self.topToolbar = top
        self.bottomToolbar = bottom
        self.padding = padding
        self.lineWidht = lineWidht
        self.cornerRadius = cornerRadius
    }
    
    public var body : some View {
        
        VStack(spacing: 0){
            if topToolbar != nil{
                Group{
                topToolbar?()
                    .padding(.horizontal, 2*cornerRadius+2*lineWidht)
                    .padding(.vertical, padding)
                    .frame(minHeight: cornerRadius, maxHeight: 2*cornerRadius)
                Rectangle().frame(height: 1)
                    .padding(.horizontal, 2*padding+lineWidht)
                    .frame(height: lineWidht)
                }
            }
            content
            if bottomToolbar != nil{
                Group{
                Rectangle().frame(height: 1)
                    .padding(.horizontal, 2*padding+2*lineWidht)
                    .frame(height: lineWidht)
                bottomToolbar?()
                    .padding(.horizontal, 2*cornerRadius+2*lineWidht)
                    .padding(.vertical, padding)
                    .frame(minHeight: cornerRadius, maxHeight: 2*cornerRadius)
                }
            }
        }
        .frame(minWidth: 2*cornerRadius, minHeight: 2*cornerRadius)
        .cornerRadius(cornerRadius)
        .padding(padding)
        .overlay(overlay)
            
    }
    
    var overlay : some View {
        
        RoundedRectangle(cornerRadius: cornerRadius)
            .stroke(Color.primary, lineWidth: lineWidht)
            .padding(padding)
        
    }
    
}

extension FrameView where B == EmptyView, T == EmptyView {
    
    public init(_ content: Content){
        self.content = content
    }
    
    internal init(_ content: Content, padding: CGFloat = 5, lineWidht : CGFloat = 5, cornerRadius: CGFloat = 30){
        self.content = content
        self.padding = padding
        self.lineWidht = lineWidht
        self.cornerRadius = cornerRadius
    }
}

extension FrameView where B == EmptyView {
    
    public init(top: @escaping () -> T, _ content: Content){
        self.content = content
        self.topToolbar = top
    }
    
}

extension FrameView where T == EmptyView {
    
    public init(_ content: Content, bottom: @escaping () -> B){
        self.content = content
        self.bottomToolbar = bottom
    }
}



#if DEBUG
struct FrameView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Group {
            FrameView(Text("Hallo Welt").padding())
            FrameView(top: {Text("Top Toolbar")}, Rectangle().foregroundColor(.gray))
            FrameView(Rectangle().foregroundColor(.gray), bottom: {Text("Top Toolbar")})
        }
        
    }
}
#endif
