//
//  WeatherContentView.swift
//  cluelessCloset
//
//  Created by Erin Chon on 5/8/23.
//
import SwiftUI

struct WeatherContentView: View {
@StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
     
    var body: some View {
        VStack {
            
            if let location = locationManager.location {
                if let weather = weather {
                   WeatherView(weather: weather)
                } else {
                    LoadingView()
                        .task {
                            do {
                      weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch {
                                print("Error getting weather: \(error)")
                            }
                        }
                }
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView()
                .environmentObject(locationManager)
                }
            }
        }
        
        NavigationLink("Click Here!", destination:
                        SecondView())
        .background(Color(hue: 0.4, saturation: 0.7, brightness: 0.5))
        .preferredColorScheme(.dark)
        }
    }

struct WeatherContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherContentView()
    }
}
