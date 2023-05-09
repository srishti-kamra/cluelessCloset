//
//  WeatherView.swift
//  cluelessCloset
//
//  Created by Erin Chon on 5/8/23.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold().font(.title)
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            Image(systemName: "cloud.drizzle")
                                .font(.system(size: 45))
                            Text(weather.weather[0].main)
                                .font(.system(size: 25))
                        }.frame(width: 130, alignment: .leading)
                        Spacer()
                        Text(weather.main.feelsLike
                            .roundDouble() + "°C")
                        .font(.system(size: 100))
                        .fontWeight(.bold)
                        .padding()
                    }
                    Spacer()
                        .frame(height: 80)
                    AsyncImage(url: URL(string: "https://assets.change.org/photos/1/dk/pj/WhDkpJHDTNagkNv-800x450-noPad.jpg?1527285128")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                    }
                placeholder: {
                    ProgressView()
                }
                    Spacer()
                    
                }
                .frame(maxWidth: .infinity)
                
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather now")
                        .bold().padding(.bottom)
                    
                    HStack {
                        WeatherRow(logo: "thermometer.medium", name: "Min temp", value: (weather.main.tempMin.roundDouble() + "°C"))
                        //Spacer()
                        WeatherRow(logo: "thermometer.medium", name: "Max temp", value: (weather.main.tempMax.roundDouble() + "°C"))
                    }
                    HStack {
                        WeatherRow(logo: "wind", name: "Wind speed", value: (weather.wind.speed.roundDouble() + "m/s"))
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidity", value: (weather.main.humidity.roundDouble() + "%"))
                        
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading).padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354)).background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])}}
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
