class Message {
  final String message;
   var id;

  Message(this.message, this.id);

  factory Message.fromJson( jsonData) {
    return Message(jsonData['message'],jsonData['id']);
  }
}
