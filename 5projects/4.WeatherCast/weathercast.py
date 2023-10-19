#Find Information in Info.txt

import argparse
import requests


class Weather:
    def __init__(self,api_key):
        self.api_key = api_key
        self.base_url = "https://api.openweathermap.org/data/2.5/weather"
    def get_weather(self,city, details):
        params = {
            "q": city,
            "appid": API_KEY,
            "units": "metric",
        # "units": "imperial"
        }

        try:
            response = requests.get(self.base_url, params=params)
            data = response.json()

            if data["cod"] == 200:
                weather_info = data["main"]
                if "temperature" in details:
                    print(f"Temperature: {weather_info['temp']}°C")
                if "humidity" in details:
                    print(f"Humidity: {weather_info['humidity']}%")
                if "pressure" in details:
                    print(f"Pressure: {weather_info['pressure']}hPa")
                if "wind" in details:
                    wind_info = data["wind"]
                    print(f"Wind Speed: {wind_info['speed']}m/s")
                if "description" in details:
                    weather_description = data["weather"][0]["description"]
                    print(f"Description: {weather_description}")
            else:
                print(f"Error: {data['message']}")

        except Exception as e:
            print(f"An error occurred: {e}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Get weather information for a city.")
    parser.add_argument("city", type=str, help="City name")
    parser.add_argument(
        "--details",
        type=str,
        nargs="+",
        choices=["temperature", "humidity","pressure","wind","description"],
        help="Specify weather details to display",
    )

    args = parser.parse_args()

    city = args.city
    details = args.details

    if not details:
        details = ["temperature", "humidity","pressure","wind","description"]

    API_KEY = "8c11a6c02a2cc62f157e4b6a10735d8f"
    weather_app = Weather(API_KEY)
    weather_app.get_weather(city, details)

