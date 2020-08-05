class Geo {
  String lat;
  String lang;

  Geo({this.lat, this.lang});

  static fromJson(Map<String, dynamic> json) {
    return Geo(lat: json['lat'], lang: json['lang']);
  }
}

class Address {
  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;

  Address({this.street, this.suite, this.city, this.zipcode, this.geo});

  static fromJson(Map<String, dynamic> json) {
    Geo geo;
    if (json.containsKey('geo')) {
      geo = Geo.fromJson(json['geo']);
    }
    return Address(
        street: json['street'],
        suite: json['suite'],
        city: json['city'],
        zipcode: json['zipcode'],
        geo: geo);
  }
}

class Company {
  String name;
  String catchPhrase;
  String bs;

  Company({this.name, this.catchPhrase, this.bs});

  static fromJson(Map<String, dynamic> json) {
    return Company(
        name: json['name'], catchPhrase: json['catchPhrase'], bs: json['bs']);
  }
}

class User {
  int id;
  String name;
  String username;
  String email;
  Address address;
  String phone;
  String website;
  Company company;

  User(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.address,
      this.phone,
      this.website,
      this.company});

  @override
  String toString() {
    // TODO: implement toString
    return 'User (name: $username, email: $phone)';
  }

  static fromJson(Map<String, dynamic> json) {
    Company company;
    if (json.containsKey('company')) {
      company = Company.fromJson(json['company']);
    }
    Address address;
    if (json.containsKey('address')) {
      address = Address.fromJson(json['address']);
    }
    return User(
        id: json['id'],
        name: json['name'],
        username: json['username'],
        email: json['email'],
        website: json['website'],
        address: address,
        phone: json['phone'],
        company: company);
  }
}
