//
//  ButtonsRowOne.swift
//  ChipsSaveJSON
//
//  Created by anya zhukova on 4/8/24.
//

import SwiftUI

struct ButtonsRowOneView: View {
    @EnvironmentObject var document: Document
    var rect: CGRect
    var body: some View {
        HStack {
            Button("Add") {
                withAnimation {
                    document.addItem(rect: rect)
                }
            }
            Button("+8") {
                withAnimation {
                    //document.clear();
                    document.addItems(rect: rect, count: 8)
                }
            }
            Button("Clear") {
                withAnimation {
                    document.clear();
                }
            }
            Button("Shake") {
                withAnimation {
                    document.shakeDemo();
                }
            }
            Button("Color") {
                withAnimation {
                    document.colorDemo();
                }
            }
        }
        .buttonStyle(.bordered)
    }
}

struct ButtonRowOneView_Previews: PreviewProvider {
    static var previews: some View {
        let document = Document()
        ButtonsRowOneView(rect: CGRect(x: 0, y: 0, width: 100, height: 100))
        
    }
}
