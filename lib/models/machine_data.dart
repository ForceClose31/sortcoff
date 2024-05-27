class MachineData {
  final int on;
  final int red;
  final int blue;
  final int green;
  final int yellow;

  MachineData({
    required this.on,
    required this.red,
    required this.blue,
    required this.green,
    required this.yellow,
  });

  Map<String, dynamic> toMap() {
    return {
      'on': on,
      'red': red,
      'blue': blue,
      'green': green,
      'yellow': yellow,
    };
  }

  factory MachineData.fromMap(Map<String, dynamic> map) {
    return MachineData(
      on: map['on'] as int,
      red: map['red'] as int,
      blue: map['blue'] as int,
      green: map['green'] as int,
      yellow: map['yellow'] as int,
    );
  }
}
