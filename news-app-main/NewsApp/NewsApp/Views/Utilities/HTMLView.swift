//
//  HTMLView.swift
//  NewsApp
//
//  Created by Marvin John on 27.07.24.
//

import SwiftUI
import WebKit

struct HTMLView: UIViewRepresentable {
    
    let htmlString: String
    let fontFamily: String
    let fontSize: String
    let color: String
    
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView , context: Context) {
       
        let styledHTMLString = """
           <html>
           <head>
           <style>
           body {
               font-family: \(fontFamily), Helvetica, Arial, sans-serif;
               font-size: \(fontSize);
               color: \(color);
               margin: 0;
               padding: 0;
           }
           </style>
           </head>
           <body>
           \(htmlString)
           </body>
           </html>
           """
        uiView.loadHTMLString(styledHTMLString, baseURL: nil)
    }
}


