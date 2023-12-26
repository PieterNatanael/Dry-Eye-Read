//
//  ContentView.swift
//  Dry Eye Read
//
//  Created by Pieter Yoshua Natanael on 14/12/23.
//


import SwiftUI

struct ContentView: View {
    @State private var toggleIsOn: Bool = false
    @State private var inputText: String = ""
    @State private var fontSize: CGFloat = 20.0

    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                ZStack {
                    // Background
                    // Color.black.ignoresSafeArea()
                    
                    // Content
                    VStack {
                        textEditor
                        controlPanel
                    }
                    .padding()
                    .navigationTitle("Dry Eye Read")
                }
            }
        } else {
            // Fallback on earlier versions
        }
    }

    private var textEditor: some View {
        TextEditor(text: $inputText)
            // .scrollContentBackground(toggleIsOn ? .hidden : .visible)
            // .background(toggleIsOn ? .gray : .clear)
            .padding()
            .foregroundColor(toggleIsOn ? Color(#colorLiteral(red: 0.5704585314, green: 0.5704723597, blue: 0.5704649091, alpha: 1)) : .primary)
            // .monospaced()
            .font(.system(size: fontSize))
    }

    private var controlPanel: some View {
        HStack {
            Button("Make Smaller") {
                adjustFontSize(smaller: true)
            }
            .buttonStyle(PrimaryButtonStyle())

            Button("Make Bigger") {
                adjustFontSize(smaller: false)
            }
            .buttonStyle(PrimaryButtonStyle())

            Toggle("Dry Eye Mode", isOn: $toggleIsOn)
        }
    }

    private func adjustFontSize(smaller: Bool) {
        fontSize += smaller ? -5.0 : 5.0
    }
}

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .font(.headline)
            .cornerRadius(10)
    }
}

struct DryEyesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



/*

import SwiftUI

struct ContentView: View {
    @State private var inputText: String = ""
    @State private var fontSize: CGFloat = 20.0

    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                VStack {
                    TextEditor(text: $inputText)
                        .padding()
                        .font(.system(size: fontSize))
                    
                    HStack {
                        Button("Make Smaller") {
                            adjustFontSize(smaller: true)
                        }
                        .padding()
                        
                        Spacer()
                        
                        Button("Make Bigger") {
                            adjustFontSize(smaller: false)
                        }
                        .padding()
                    }
                }
                .padding()
                .navigationTitle("Dry Eye Read")
            }
        } else {
            // Fallback on earlier versions
        }
    }

    func adjustFontSize(smaller: Bool) {
        if smaller {
            fontSize -= 5.0
        } else {
            fontSize += 5.0
        }
    }
}

struct DryEyesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

*/
