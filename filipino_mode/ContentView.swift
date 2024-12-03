//
//  ContentView.swift
//  filipino_mode
//
//  Created by Federica Ziaco on 11/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isFilipinoModeOn = true
    
    var body: some View {
        ZStack {

            if isFilipinoModeOn {
                Image("Flag_of_the_Philippines_(vertical_display)")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .offset(x: -15)
                
            } else {
                Color.white
                    .ignoresSafeArea()
            }
            
            // Content
            VStack(spacing: 20) {
                // Filipino Text
                Text("FILIPINO")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.black)
                    .padding(.bottom, -10)
                
                // Mode Text
                Text("MODE")
                    .font(.system(size: 30, weight: .regular))
                    .foregroundColor(.black)
                
                // Toggle Switch
                Toggle(isOn: $isFilipinoModeOn) {
                    Text("") // Empty label to fit the design
                }
                .toggleStyle(SwitchToggleStyleCustom())
                .frame(width: 100, height: 50)
            }
            .padding()
        }
    }
}

// Custom Toggle Style
struct SwitchToggleStyleCustom: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            // Background shape for the toggle switch
            RoundedRectangle(cornerRadius: 25)
                .fill(configuration.isOn ? Color.green : Color.gray)
                .frame(width: 100, height: 50)
            
            // Text inside the toggle
            HStack {
                if configuration.isOn {
                    Text("ON")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.leading, 15)
                } else {
                    Text("OFF")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.trailing, 100)
                }
                Spacer()
            }
            
            // Circle representing the toggle knob
            Circle()
                .fill(Color.white)
                .frame(width: 40, height: 40)
                .offset(x: configuration.isOn ? 20 : -20)
                .animation(.easeInOut, value: configuration.isOn)
                .onTapGesture {  // Allow tapping to toggle
                    configuration.isOn.toggle()
                }
        }
    }
}

#Preview {
    ContentView()
}
