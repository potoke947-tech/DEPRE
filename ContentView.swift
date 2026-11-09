
import SwiftUI

struct ContentView: View {
    @State private var esp = true
    @State private var playerInfo = true
    @State private var aimAssist = false
    @State private var sensitivity = 50.0

    var body: some View {
        ZStack {
            Color(red: 0.035, green: 0.04, blue: 0.06)
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 22) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("DEPRE")
                                .font(.system(size: 36, weight: .black))
                                .foregroundColor(.red)

                            Text("SURVIVAL ISLAND")
                                .font(.system(size: 11, weight: .bold))
                                .foregroundColor(.gray)
                        }

                        Spacer()

                        Image(systemName: "shield.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.red)
                    }

                    Divider().overlay(.gray)

                    sectionTitle("VISUAL SETTINGS")

                    feature("ESP Preview",
                            subtitle: "Test player indicators",
                            icon: "eye",
                            enabled: $esp)

                    feature("Player Information",
                            subtitle: "Display demo information",
                            icon: "person.text.rectangle",
                            enabled: $playerInfo)

                    sectionTitle("AIM SETTINGS")

                    feature("Aim Assist Preview",
                            subtitle: "Interface demonstration only",
                            icon: "scope",
                            enabled: $aimAssist)

                    VStack(alignment: .leading, spacing: 12) {
                        Text("SENSITIVITY")
                            .font(.headline)
                            .foregroundColor(.white)

                        Slider(value: $sensitivity, in: 0...100)
                            .tint(.red)

                        Text("\(Int(sensitivity))%")
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(Color.white.opacity(0.06))
                    .cornerRadius(16)

                    Text("DEPRE V1.0 • iOS")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(.top, 20)
                }
                .padding(22)
            }
        }
        .preferredColorScheme(.dark)
    }

    func sectionTitle(_ title: String) -> some View {
        Text(title)
            .font(.headline)
            .foregroundColor(.red)
            .frame(maxWidth: .infinity, alignment: .leading)
    }

    func feature(
        _ title: String,
        subtitle: String,
        icon: String,
        enabled: Binding<Bool>
    ) -> some View {
        HStack(spacing: 14) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(.red)

            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .foregroundColor(.white)
                    .fontWeight(.bold)

                Text(subtitle)
                    .foregroundColor(.gray)
                    .font(.caption)
            }

            Spacer()

            Toggle("", isOn: enabled)
                .labelsHidden()
                .tint(.red)
        }
        .padding()
        .background(Color.white.opacity(0.06))
        .cornerRadius(16)
    }
}
