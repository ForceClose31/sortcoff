class MachineData {
  int on;
  int blue;
  int red;
  int yellow;
  int green;

  MachineData({
    required this.on,
    this.blue = 0,
    this.red = 0,
    this.yellow = 0,
    this.green = 0,
  });

  Map<String, dynamic> toJson() {
    return {
      'on': on,
      'blue': blue,
      'red': red,
      'yellow': yellow,
      'green': green,
    };
  }
}
