This SwiftUI code defines a beautiful animated water fill effect inside a circle, simulating a wave that gradually fills up a container. The animation combines wave motion, fill level progression, and gradient-based styling to create a smooth, visually engaging component.

---

**WaterFillView:**

Visually represents a filling water tank.
Uses a Wave shape (assumed to be a custom Shape) that animates horizontally using a phase.
Vertically fills the circle based on fillLevel.
Includes a soft reflection overlay to enhance realism.

---

Usage:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            WaterFillView()
        }
        .padding()
    }
}
