
class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}

class Contact{
  String email;
  String phone;
  String link;

  Contact({required this.email, required this.phone, required this.link});
}


class Customer {
  String id;
  String name;
  int numOfNotifications;

  Customer(this.id, this.name, this.numOfNotifications);
}


class Authentication{
  int? status;
  String? message;
  Customer? customer;
  Contact? contacts;

  Authentication({this.status, this.message, this.customer, this.contacts});
}
