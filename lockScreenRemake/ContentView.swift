//
//  ContentView.swift
//  lockScreenRemake
//
//  Created by Justin Hold on 12/29/24.
//

import SwiftUI

struct ContentView: View {
	
	// MARK: - Properties
	
	
	
	// MARK: - View Body
    var body: some View {
        
		ZStack {
			GeometryReader { geo in
				Image("TheGreatTurn")
					.resizable()
					.scaledToFill()
					.frame(maxWidth: geo.size.width)
					.ignoresSafeArea()
				
				VStack(spacing: 0) {
					Image(systemName: "lock.fill")
						.font(.largeTitle)
						.padding(.top, 60)
					
					Text(Date(), style: .time)
						.font(.system(size: 82, weight: .thin))
					
					Text(Date(), style: .date)
						.font(.title2)
						.offset(y: -10)
					
					Spacer()
					
					HStack {
						LockScreenButton(image: "flashlight.off.fill")
						Spacer()
						LockScreenButton(image: "camera.fill")
					}
					
					Capsule()
						.fill(Color.white)
						.frame(width: 150, height: 5)
						.padding(.bottom, 10)
				}
				.padding([.leading, .trailing])
				.foregroundStyle(.white)
				
				Color.black.opacity(0.15)
			}
		}
    }
}

// MARK: - LockScreenButton
struct LockScreenButton: View {
	
	
	// MARK: - Properties
	@State private var isPressed: Bool = false
	@State private var isActivated: Bool = false
	
	let image: String
	
	
	// MARK: - View Body
	var body: some View {
		
		Image(systemName: image)
			.font(.title)
			.frame(width: 50, height: 50)
			.background(
				isActivated ? Color.white : Color.black.opacity(
					isPressed ? 0.8 : 0.4
				)
			)
			.foregroundStyle(isActivated ? .black : .white)
			.clipShape(Circle())
			.scaleEffect(isPressed ? 1.5 : 1)
			.animation(.spring, value: 0.5)
			.onLongPressGesture(minimumDuration: 0.4) { bool in
				isPressed = bool
			} perform: {
				isActivated.toggle()
				isPressed = false
				
				let generator = UIImpactFeedbackGenerator()
				generator.impactOccurred()
			}
	}
}

#Preview {
    ContentView()
}
