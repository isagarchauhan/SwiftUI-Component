### ✅ `CustomSwitch`
A customizable toggle switch with support for color themes, icons, and animations.

```swift
CustomSwitch(
    isOn: $isOn,
    props: CustomSwitchProps(
        onColor: .green,
        offColor: .gray,
        thumbColor: .white,
        size: CGSize(width: 60, height: 34),
        animation: .spring()
    )
) { newValue in
    print("Switched to: \(newValue)")
}
