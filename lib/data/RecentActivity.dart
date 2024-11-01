
class Recentactivity {
  final int id;
  final String app;
  final int cr;
  final int w;
  final int n;
  final int e;
  final int r;

  Recentactivity({
    required this.id,
    required this.app,
    required this.cr,
    required this.w,
    required this.n,
    required this.e,
    required this.r,
  });

  factory Recentactivity.fromJson(Map<String, dynamic> json) {
    return Recentactivity(
      id: json['id'],
      app: json['app'],
      cr: json['cr'],
      w: json['w'],
      n: json['n'],
      e: json['e'],
      r: json['r'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'app': app,
    'cr': cr,
    'w': w,
    'n': n,
    'e': e,
    'r': r,
  };
}
