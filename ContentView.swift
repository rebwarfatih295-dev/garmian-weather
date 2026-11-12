import SwiftUI

struct GarmianCity: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let temp: Int
    let high: Int
    let low: Int
    let condition: String
    let icon: String
    let windSpeed: String
    let humidity: Int
    let hailRisk: String
}

struct ContentView: View {
    @State private var selectedIndex = 0
    
    let cities: [GarmianCity] = [
        GarmianCity(name: "کەلار", type: "قەزا", temp: 23, high: 25, low: 13, condition: "نیمچە هەور", icon: "cloud.sun.fill", windSpeed: "15 کم/ک", humidity: 46, hailRisk: "نییە"),
        GarmianCity(name: "ڕزگاری", type: "ناحیە", temp: 22, high: 24, low: 12, condition: "خۆرەتاو", icon: "sun.max.fill", windSpeed: "14 کم/ک", humidity: 42, hailRisk: "نییە"),
        GarmianCity(name: "کفری", type: "قەزا", temp: 21, high: 23, low: 11, condition: "هەوا و با", icon: "wind", windSpeed: "26 کم/ک", humidity: 44, hailRisk: "نییە"),
        GarmianCity(name: "خانەقین", type: "قەزا", temp: 25, high: 27, low: 14, condition: "خۆرەتاو", icon: "sun.max.fill", windSpeed: "12 کم/ک", humidity: 40, hailRisk: "نییە"),
        GarmianCity(name: "باوەنوور", type: "ناحیە", temp: 18, high: 20, low: 10, condition: "باران بارین", icon: "cloud.rain.fill", windSpeed: "22 کم/ک", humidity: 78, hailRisk: "کەم"),
        GarmianCity(name: "دەربەندیخان", type: "قەزا", temp: 15, high: 17, low: 8, condition: "باران و تەرزە", icon: "cloud.hail.fill", windSpeed: "31 کم/ک", humidity: 86, hailRisk: "بەرز"),
        GarmianCity(name: "سەرقەڵا", type: "ناحیە", temp: 20, high: 22, low: 11, condition: "هەور و خۆر", icon: "cloud.sun.fill", windSpeed: "18 کم/ک", humidity: 52, hailRisk: "نییە")
    ]
    
    var body: some View {
        let city = cities[selectedIndex]
        ZStack {
            LinearGradient(colors: [.blue, .indigo], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(cities.indices, id: \.self) { index in
                                Button(action: { selectedIndex = index }) {
                                    Text("\(cities[index].name) \(cities[index].temp)°")
                                        .font(.subheadline.bold())
                                        .padding(.horizontal, 14)
                                        .padding(.vertical, 8)
                                        .background(selectedIndex == index ? Color.white : Color.white.opacity(0.2))
                                        .foregroundColor(selectedIndex == index ? .black : .white)
                                        .clipShape(Capsule())
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    VStack(spacing: 6) {
                        Text(city.name)
                            .font(.system(size: 38, weight: .bold))
                        Text("\(city.temp)°")
                            .font(.system(size: 84, weight: .thin))
                        HStack {
                            Image(systemName: city.icon)
                            Text(city.condition)
                        }
                        .font(.title3.weight(.semibold))
                        Text("بەرزترین: \(city.high)°   نزمترین: \(city.low)°")
                            .font(.subheadline)
                            .opacity(0.85)
                    }
                    .foregroundColor(.white)
                    .padding(.vertical, 20)
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 14) {
                        InfoCard(title: "خێرایی با", value: city.windSpeed)
                        InfoCard(title: "ڕێژەی شێ", value: "\(city.humidity)%")
                        InfoCard(title: "ئەگەری تەرزە", value: city.hailRisk)
                        InfoCard(title: "ناوچە", value: city.type)
                    }
                    .padding(.horizontal)
                    
                    VStack(spacing: 4) {
                        Text("دروستکراوە لەلایەن")
                            .font(.caption2)
                            .foregroundColor(.white.opacity(0.75))
                        Text("ڕێبوار مانج علی")
                            .font(.subheadline.bold())
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(16)
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                }
                .padding(.top)
            }
        }
        .environment(\.layoutDirection, .rightToLeft)
    }
}

struct InfoCard: View {
    let title: String
    let value: String
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.caption).foregroundColor(.white.opacity(0.75))
            Text(value).font(.title2.bold()).foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(20)
    }
}
