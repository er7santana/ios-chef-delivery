//
//  HomeView.swift
//  ChefDelivery
//
//  Created by Eliezer Rodrigo on 21/04/25.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isAnimating = false
    @State private var imageOffset: CGSize = .zero
    @State private var buttonOffset: CGFloat = .zero
    @State private var showSecondScreen = false
    let buttonHeight: CGFloat = 80
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                
                Circle()
                    .foregroundStyle(.colorRedDark)
                    .frame(width: 200)
                    .position(x: 50, y: 100)
                    .blur(radius: 75)
                    .opacity(isAnimating ? 0.3 : 0)
                
                Circle()
                    .foregroundStyle(.colorRed)
                    .frame(width: 200)
                    .position(x: geometry.size.width - 50, y: geometry.size.height - 50)
                    .blur(radius: 75)
                    .opacity(isAnimating ? 0.3 : 0)
                
                VStack {
                    Text("Chef Delivery")
                        .font(.system(size: 40))
                        .fontWeight(.heavy)
                        .foregroundStyle(.colorRed)
                        .opacity(isAnimating ? 1 : 0)
                        .offset(y: isAnimating ? 0 : -40)
                    
                    Text("Peça as suas comidas no conforto da sua casa.")
                        .font(.title2)
                        .padding()
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.foreground.opacity(0.7))
                        .opacity(isAnimating ? 1 : 0)
                        .offset(y: isAnimating ? 0 : -40)
                    
                    Image("image")
                        .resizable()
                        .scaledToFit()
                        .shadow(radius: 60)
                        .padding(isAnimating ? 32 : 92)
                        .opacity(isAnimating ? 1 : 0)
                        .offset(x: imageOffset.width, y: imageOffset.height)
                        .gesture(
                            DragGesture()
                                .onChanged({ gesture in
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        imageOffset = gesture.translation
                                    }
                                })
                                .onEnded({ _ in
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        imageOffset = .zero
                                    }
                                })
                        )
                    
                    Spacer()
                    
                    ZStack {
                        Capsule()
                            .fill(Color.colorRed.opacity(0.2))
                        
                        Capsule()
                            .fill(Color.colorRed.opacity(0.2))
                            .padding(8)
                        
                        Text("Descubra mais")
                            .font(.title2)
                            .bold()
                            .foregroundStyle(Color.colorRedDark)
                            .offset(x: 20)
                        
                        HStack {
                            Capsule()
                                .fill(.colorRed)
                                .frame(width: buttonOffset + buttonHeight)
                            
                            Spacer()
                        }
                        
                        HStack {
                            ZStack {
                                
                                Circle()
                                    .fill(.colorRed)
                                
                                Circle()
                                    .fill(.colorRedDark)
                                    .padding(8)
                                
                                Image(systemName: "chevron.right.2")
                                    .font(.system(size: 20))
                                    .foregroundStyle(.white)
                            }
                            .offset(x: buttonOffset)
                            .gesture(
                                DragGesture()
                                    .onChanged({ gesture in
                                        withAnimation(.easeInOut(duration: 0.5)) {
                                            if gesture.translation.width >= 0 && buttonOffset <= (geometry.size.width - 140)  {
                                                buttonOffset = gesture.translation.width
                                            }
                                        }
                                    })
                                    .onEnded({ _ in
                                        if buttonOffset > ((geometry.size.width - 60) / 2) {
                                            showSecondScreen = true
                                        } else {
                                            withAnimation(.easeInOut(duration: 0.25)) {
                                                buttonOffset = 0
                                            }
                                        }
                                    })
                            )
                            
                            Spacer()
                        }
                        
                    }
                    .frame(width: geometry.size.width - 60, height: buttonHeight)
                    .opacity(isAnimating ? 1 : 0)
                }
                .padding()
                .onAppear {
                    withAnimation(.easeInOut(duration: 1.5)) {
                        isAnimating = true
                    }
                }
            }
            .fullScreenCover(isPresented: $showSecondScreen) {
                ContentView()
            }
        }
    }
}

#Preview {
    HomeView()
}
