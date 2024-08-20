import 'dart:convert';

class WeatherForecastModel {
  String? cod;
  int? message;
  int? cnt;
  List<WeatherList?>? list;
  City? city;

  WeatherForecastModel({
    this.cod,
    this.message,
    this.cnt,
    this.list,
    this.city,
  });

  factory WeatherForecastModel.fromMap(Map<String, dynamic> map) {
    return WeatherForecastModel(
      cod: map['cod'] as String?,
      message: map['message'] as int?,
      cnt: map['cnt'] as int?,
      list: map['list'] != null
          ? List<WeatherList?>.from(
              map['list']?.map((x) => WeatherList.fromMap(x)))
          : null,
      city: map['city'] != null ? City.fromMap(map['city']) : null,
    );
  }

  factory WeatherForecastModel.fromJson(String source) =>
      WeatherForecastModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() {
    return {
      'cod': cod,
      'message': message,
      'cnt': cnt,
      'list': list?.map((x) => x?.toMap()).toList(),
      'city': city?.toMap(),
    };
  }

  String toJson() => json.encode(toMap());
}

class City {
  int? id;
  String? name;
  Coord? coord;
  String? country;
  int? population;
  int? timezone;
  int? sunrise;
  int? sunset;

  City({
    this.id,
    this.name,
    this.coord,
    this.country,
    this.population,
    this.timezone,
    this.sunrise,
    this.sunset,
  });

  factory City.fromMap(Map<String, dynamic> map) {
    return City(
      id: map['id'] as int?,
      name: map['name'] as String?,
      coord: map['coord'] != null ? Coord.fromMap(map['coord']) : null,
      country: map['country'] as String?,
      population: map['population'] as int?,
      timezone: map['timezone'] as int?,
      sunrise: map['sunrise'] as int?,
      sunset: map['sunset'] as int?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'coord': coord?.toMap(),
      'country': country,
      'population': population,
      'timezone': timezone,
      'sunrise': sunrise,
      'sunset': sunset,
    };
  }
}

class Coord {
  double? lat;
  double? lon;

  Coord({
    this.lat,
    this.lon,
  });

  factory Coord.fromMap(Map<String, dynamic> map) {
    return Coord(
      lat: (map['lat'] as num?)?.toDouble(),
      lon: (map['lon'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'lat': lat,
      'lon': lon,
    };
  }
}

class WeatherList {
  int? dt;
  Main? main;
  List<Weather>? weather;
  Clouds? clouds;
  Wind? wind;
  int? visibility;
  double? pop;
  Rain? rain;
  Sys? sys;
  String? dtTxt;

  WeatherList({
    this.dt,
    this.main,
    this.weather,
    this.clouds,
    this.wind,
    this.visibility,
    this.pop,
    this.rain,
    this.sys,
    this.dtTxt,
  });

  factory WeatherList.fromMap(Map<String, dynamic> map) {
    return WeatherList(
      dt: map['dt'] as int?,
      main: map['main'] != null ? Main.fromMap(map['main']) : null,
      weather: map['weather'] != null
          ? List<Weather>.from(map['weather']?.map((x) => Weather.fromMap(x)))
          : null,
      clouds: map['clouds'] != null ? Clouds.fromMap(map['clouds']) : null,
      wind: map['wind'] != null ? Wind.fromMap(map['wind']) : null,
      visibility: map['visibility'] as int?,
      pop: (map['pop'] as num?)?.toDouble(),
      rain: map['rain'] != null ? Rain.fromMap(map['rain']) : null,
      sys: map['sys'] != null ? Sys.fromMap(map['sys']) : null,
      dtTxt: map['dt_txt'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'dt': dt,
      'main': main?.toMap(),
      'weather': weather?.map((x) => x.toMap()).toList(),
      'clouds': clouds?.toMap(),
      'wind': wind?.toMap(),
      'visibility': visibility,
      'pop': pop,
      'rain': rain?.toMap(),
      'sys': sys?.toMap(),
      'dt_txt': dtTxt,
    };
  }
}

class Clouds {
  int? all;

  Clouds({
    this.all,
  });

  factory Clouds.fromMap(Map<String, dynamic> map) {
    return Clouds(
      all: map['all'] as int?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'all': all,
    };
  }
}

class Main {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? seaLevel;
  int? grndLevel;
  int? humidity;
  double? tempKf;

  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.seaLevel,
    this.grndLevel,
    this.humidity,
    this.tempKf,
  });

  factory Main.fromMap(Map<String, dynamic> map) {
    return Main(
      temp: (map['temp'] as num?)?.toDouble(),
      feelsLike: (map['feels_like'] as num?)?.toDouble(),
      tempMin: (map['temp_min'] as num?)?.toDouble(),
      tempMax: (map['temp_max'] as num?)?.toDouble(),
      pressure: map['pressure'] as int?,
      seaLevel: map['sea_level'] as int?,
      grndLevel: map['grnd_level'] as int?,
      humidity: map['humidity'] as int?,
      tempKf: (map['temp_kf'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'temp': temp,
      'feels_like': feelsLike,
      'temp_min': tempMin,
      'temp_max': tempMax,
      'pressure': pressure,
      'sea_level': seaLevel,
      'grnd_level': grndLevel,
      'humidity': humidity,
      'temp_kf': tempKf,
    };
  }
}

class Rain {
  double? the3H;

  Rain({
    this.the3H,
  });

  factory Rain.fromMap(Map<String, dynamic> map) {
    return Rain(
      the3H: (map['3h'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '3h': the3H,
    };
  }
}

class Sys {
  String? pod;

  Sys({
    this.pod,
  });

  factory Sys.fromMap(Map<String, dynamic> map) {
    return Sys(
      pod: map['pod'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'pod': pod,
    };
  }
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      id: map['id'] as int?,
      main: map['main'] as String?,
      description: map['description'] as String?,
      icon: map['icon'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'main': main,
      'description': description,
      'icon': icon,
    };
  }
}

class Wind {
  double? speed;
  int? deg;
  double? gust;

  Wind({
    this.speed,
    this.deg,
    this.gust,
  });

  factory Wind.fromMap(Map<String, dynamic> map) {
    return Wind(
      speed: (map['speed'] as num?)?.toDouble(),
      deg: map['deg'] as int?,
      gust: (map['gust'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'speed': speed,
      'deg': deg,
      'gust': gust,
    };
  }
}
