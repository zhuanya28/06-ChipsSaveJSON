//
//  TopCanvasView.swift
//  ChipsSaveJSON
//
//  Created by anya zhukova on 4/8/24.
//

import SwiftUI

struct TopCanvasView: View {
    var rect : CGRect
    @EnvironmentObject var document : Document
   
    var body: some View {
        if document.items.isEmpty {
            Spacer()
        }
        else {
            ZStack {
                ForEach(document.items) { item in
                    ItemDragView(item: item)
                }
            }
        }
        if let item = document.selectedItem {
            Text("x \(item.x) y \(item.y) color \(item.colorName)")
            HStack {
                ColorPicker("Color", selection: $document.itemColor)
                Button("Rotate") {
                    document.update(id: document.selectedId, rotationBy: 45.0)
                }
                Button("+Size") {
                    document.update(id: document.selectedId, sizeBy: 1.1)
                }
                Button("-Size") {
                    document.update(id: document.selectedId, sizeBy: 0.9)
                }
            }
            .buttonStyle(.bordered)
            HStack {
                Text("AssetName:")
                Picker("AssetName", selection: $document.itemAssetName) {
                    Text("").tag("")
                    Text("cat").tag("cat")
                    Text("lama").tag("lama")
                }
            }
            .padding(5)
            .background(Color.gray)
        }
    }
}

struct TopCanvasView_Previews: PreviewProvider {
    static var previews: some View { 
        let document = Document()
        TopCanvasView(rect: CGRect(x: 0, y: 0, width: 100, height: 100))
    }
    }
