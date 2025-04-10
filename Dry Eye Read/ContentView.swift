//
//  ContentView.swift
//  Dry Eye Read
//
//  Created by Pieter Yoshua Natanael on 14/12/23.
//

//need copy and paste button

import SwiftUI

struct ContentView: View {
    @State private var toggleIsOn: Bool = false
    @State private var inputText: String = ""
    @State private var fontSize: CGFloat = 20.0
    @State private var showAd: Bool = false
    @State private var showExplain: Bool = false
    

    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                ZStack {
                    // Background
                    // Color.black.ignoresSafeArea()
                    
                    // Content
                    VStack {
                        
                        HStack{
                            Button(action: {
                                showAd = true
                            }) {
                                Image(systemName: "ellipsis.circle.fill")
                                    .font(.system(size: 30))
            //                        .foregroundColor(.white)
                                    .padding()
                                Spacer()
                                Button(action: {
                                    showExplain = true
                                }) {
                                    Image(systemName: "questionmark.circle.fill")
                                        .font(.system(size: 30))
            //                            .foregroundColor(.white)
                                        .padding()
                                }
                            }
                           
                        }
                        Text("Dry Eye Read")
                            .font(.largeTitle)
                            
                        textEditor
                        controlPanel
                        
                    }
                    .sheet(isPresented: $showAd) {
                        ShowAdView(onConfirm: {
                            showAd = false
                        })
                    }
                    
                    .sheet(isPresented: $showExplain) {
                        ShowExplainView(onConfirm: {
                            showExplain = false
                        })
                    }

//                    .padding()
//                    .navigationTitle("Dry Eye Read")
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


struct ShowAdView: View {
   var onConfirm: () -> Void

    var body: some View {
        ScrollView {
            VStack {
                Text("Behind the Scenes.")
                                    .font(.title)
                                    .padding()
                                    .foregroundColor(.white)

                                // Your ad content here...

                                Text("Thank you for buying our app with a one-time fee, it helps us keep up the good work. Explore these helpful apps as well. ")
                    .font(.title3)
                                    .foregroundColor(.white)
                                    .padding(.horizontal)
                                    .multilineTextAlignment(.center)
                
                
                
             
             Text("SingLOOP.")
                 .font(.title)
 //                           .monospaced()
                 .padding()
                 .foregroundColor(.white)
                 .onTapGesture {
                     if let url = URL(string: "https://apps.apple.com/id/app/sing-l00p/id6480459464") {
                         UIApplication.shared.open(url)
                     }
                 }
 Text("Record your voice effortlessly, and play it back in a loop.") // Add your 30 character description here
                    .font(.title3)
//                    .italic()
                   .multilineTextAlignment(.center)
                   .padding(.horizontal)
                   .foregroundColor(.white)
                
                Text("Time Tell.")
                    .font(.title)
//                           .monospaced()
                    .padding()
                    .foregroundColor(.white)
                    .onTapGesture {
                        if let url = URL(string: "https://apps.apple.com/app/time-tell/id6479016269") {
                            UIApplication.shared.open(url)
                        }
                    }
  Text("it will announce the time every 30 seconds, no more guessing and checking your watch, for time-sensitive tasks, workouts, and mindfulness exercises.") // Add your 30 character description here
                      .font(.title3)
//                                 .italic()
                      .multilineTextAlignment(.center)
                      .padding(.horizontal)
                      .foregroundColor(.white)
                
             
                
                Text("Insomnia Sheep.")
                    .font(.title)
     //                           .monospaced()
                    .padding()
                    .foregroundColor(.white)
                    .onTapGesture {
                        if let url = URL(string: "https://apps.apple.com/id/app/insomnia-sheep/id6479727431") {
                            UIApplication.shared.open(url)
                        }
                    }
             Text("Design to ease your mind and help you relax leading up to sleep.") // Add your 30 character description here
                                 .font(.title3)
//                                 .italic()
                                 .padding(.horizontal)
                                 .multilineTextAlignment(.center)
                                 .foregroundColor(.white)
                           
                           Text("Loop Speak.")
                               .font(.title)
     //                           .monospaced()
                               .padding()
                               .foregroundColor(.white)
                               .onTapGesture {
                                   if let url = URL(string: "https://apps.apple.com/id/app/loopspeak/id6473384030") {
                                       UIApplication.shared.open(url)
                                   }
                               }
             Text("Type or paste your text, play in loop, and enjoy hands-free narration.") // Add your 30 character description here
                                 .font(.title3)
//                                 .italic()
                                 .multilineTextAlignment(.center)
                                 .padding(.horizontal)
                                 .foregroundColor(.white)
                           
                           Text("iProgramMe.")
                               .font(.title)
     //                           .monospaced()
                               .padding()
                               .foregroundColor(.white)
                               .onTapGesture {
                                   if let url = URL(string: "https://apps.apple.com/id/app/iprogramme/id6470770935") {
                                       UIApplication.shared.open(url)
                                   }
                               }
             Text("Custom affirmations, schedule notifications, stay inspired daily.") // Add your 30 character description here
                                 .font(.title3)
//                                 .italic()
                                 .multilineTextAlignment(.center)
                                 .padding(.horizontal)
                                 .foregroundColor(.white)
                           
                        
                      
                           Text("TemptationTrack.")
                               .font(.title)
     //                           .monospaced()
                               .padding()
                               .foregroundColor(.white)
                               .onTapGesture {
                                   if let url = URL(string: "https://apps.apple.com/id/app/temptationtrack/id6471236988") {
                                       UIApplication.shared.open(url)
                                   }
                               }
             Text("One button to track milestones, monitor progress, stay motivated.") // Add your 30 character description here
                                 .font(.title3)
//                                 .italic()
                                 .multilineTextAlignment(.center)
                                 .padding(.horizontal)
                                 .foregroundColor(.white)


               Spacer()

               Button("Close") {
                   // Perform confirmation action
                   onConfirm()
               }
               .font(.title)
               .padding()
               .foregroundColor(.black)
               .background(Color.white)
               .cornerRadius(25.0)
               .padding()
           }
           .padding()
           .background(Color(#colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)))
           .cornerRadius(15.0)
       .padding()
        }
   }
}

struct ShowExplainView: View {
   var onConfirm: () -> Void

    var body: some View {
       VStack {
           Text("Type or paste your text, then select 'Make Bigger' or 'Make Smaller' to adjust the font size. Use 'Dry Eye Mode' for a softer font color that reduces eye strain.")
               .font(.title)
               .multilineTextAlignment(.center)
//                       .monospaced()
               .padding()
               .foregroundColor(.white)



           Spacer()

           Button("Close") {
               // Perform confirmation action
               onConfirm()
           }
           .font(.title)
           .padding()
           .foregroundColor(.black)
           .background(Color.white)
           .cornerRadius(25.0)
           .padding()
       }
       .padding()
       .background(Color(#colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)))
       .cornerRadius(15.0)
       .padding()
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
