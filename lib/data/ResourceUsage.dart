class ResourceUsage {
  int? cpuUsage;
  int? cloudUsage;
  int? memoryUsage;
  int? trafficUsage;

  int? cpuFiles;
  int? cloudFiles;
  int? memoryFiles;
  int? trafficFiles;

  String? cpuStorage;
  String? cloudStorage;
  String? memoryStorage;
  String? trafficStorage;

  ResourceUsage({
    this.cpuUsage,
    this.cloudUsage,
    this.memoryUsage,
    this.trafficUsage,
    this.cpuFiles,
    this.cloudFiles,
    this.memoryFiles,
    this.trafficFiles,
    this.cpuStorage,
    this.cloudStorage,
    this.memoryStorage,
    this.trafficStorage,
  });

  factory ResourceUsage.fromJson(Map<String, dynamic> json) {
    return ResourceUsage(
      cpuUsage: json['cpuUsage'] ?? 0,
      cloudUsage: json['cloudUsage'] ?? 0,
      memoryUsage: json['memoryUsage'] ?? 0,
      trafficUsage: json['trafficUsage'] ?? 0,
      cpuFiles: json['cpuFiles'] ?? 0,
      cloudFiles: json['cloudFiles'] ?? 0,
      memoryFiles: json['memoryFiles'] ?? 0,
      trafficFiles: json['trafficFiles'] ?? 0,
      cpuStorage: json['cpuStorage'] ?? "0%",
      cloudStorage: json['cloudStorage'] ?? "0 MB",
      memoryStorage: json['memoryStorage'] ?? "0 GB",
      trafficStorage: json['trafficStorage'] ?? "0 GB",
    );
  }

  Map<String, dynamic> toJson() => {
    'cpuUsage': cpuUsage ?? 0,
    'cloudUsage': cloudUsage ?? 0,
    'memoryUsage': memoryUsage ?? 0,
    'trafficUsage': trafficUsage ?? 0,
    'cpuFiles': cpuFiles ?? 0,
    'cloudFiles': cloudFiles ?? 0,
    'memoryFiles': memoryFiles ?? 0,
    'trafficFiles': trafficFiles ?? 0,
    'cpuStorage': cpuStorage ?? "0%",
    'cloudStorage': cloudStorage ?? "0 MB",
    'memoryStorage': memoryStorage ?? "0 GB",
    'trafficStorage': trafficStorage ?? "0 GB",
  };
}
