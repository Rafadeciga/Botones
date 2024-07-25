//
//  ContentView.swift
//  botones
//
//  Created by Rafael Deciga Garcia on 01/03/24.
//

import SwiftUI

struct ContentView: View {
    @State private var checkBoxState = [true, true, true, true, true]
    @State private var selectedRadio = 0
    @State private var toggleState = false
    @State private var switchState = [true, true, true]
    @State private var selectedChip = 0
    
    var body: some View {
        ScrollView {
            VStack {
                Button("Boton 1") { }
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                
                Button("Boton 2") { }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                
                Image("logo_boton") // Replace "logo_boton" with your image asset name
                    .resizable()
                    .frame(width: 100, height: 100)
                
                Image("logo_android") // Replace "logo_android" with your image asset name
                    .resizable()
                    .frame(width: 100, height: 100)
                    .background(Color.green)
                
                Text("CheckBoxes")
                    .font(.title)
                
                ForEach(0..<5) { index in
                    Toggle(isOn: $checkBoxState[index]) {
                        Text("checkBox\(index + 1)")
                    }
                    .toggleStyle(CheckboxStyle())
                }
                
                Text("Botón de radio")
                    .font(.title)
                
                Picker(selection: $selectedRadio, label: Text("Radio Button")) {
                    Text("Botón de radio1").tag(1)
                    Text("Botón de radio2").tag(2)
                    Text("Botón de radio3").tag(3)
                }
                .pickerStyle(SegmentedPickerStyle())
                
                Toggle(isOn: $toggleState) {
                    Text("Botón de activación")
                }
                
                Text("Switches")
                    .font(.title)
                
                ForEach(0..<3) { index in
                    Toggle(isOn: $switchState[index]) {
                        Text("Switch\(index + 1)")
                    }
                }
                
                Text("Chips")
                    .font(.title)
                
                HStack {
                    Chip(label: "chip 1", isSelected: selectedChip == 1) {
                        selectedChip = 1
                    }
                    Chip(label: "chip 2", isSelected: selectedChip == 2) {
                        selectedChip = 2
                    }
                    Chip(label: "chip 3", isSelected: selectedChip == 3) {
                        selectedChip = 3
                    }
                }
                
                Text("Botónes de opción flotante")
                    .font(.title)
                
                HStack {
                    FloatingActionButton(icon: "plus")
                    FloatingActionButton(icon: "minus")
                }
            }
            .padding()
        }
    }
}

// Additional Components
struct CheckboxStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return HStack {
            configuration.label
            
            Spacer()
            
            Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                .resizable()
                .frame(width: 24, height: 24)
                .onTapGesture {
                    configuration.isOn.toggle()
                }
        }
    }
}

struct Chip: View {
    var label: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Text(label)
            .padding(.horizontal)
            .padding(.vertical, 5)
            .background(isSelected ? Color.blue : Color.gray)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .onTapGesture(perform: action)
    }
}

struct FloatingActionButton: View {
    var icon: String
    
    var body: some View {
        Button(action: {}) {
            Image(systemName: icon)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Circle())
        }
    }
}

// Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
