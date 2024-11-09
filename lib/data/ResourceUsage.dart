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
      cpuUsage: json['cpu_usage']?.toInt() ?? 0,
      cloudUsage: json['cloud_usage_percentage']?.toInt() ?? 0,
      memoryUsage: json['memory_usage_percentage']?.toInt() ?? 0,
      trafficUsage: json['traffic_usage']?.toInt() ?? 0,
      cpuFiles: json['cpu_files'] ?? 0,
      cloudFiles: json['cloud_files'] ?? 0,
      memoryFiles: json['memory_usage_used'] ?? 0,
      trafficFiles: json['traffic_files'] ?? 0,
      cpuStorage: json['cpu_storage'] ?? "0%",
      cloudStorage: json['cloud_usage_total'] ?? "0 MB",
      memoryStorage: json['memory_usage_total'] ?? "0 GB",
      trafficStorage: json['traffic_usage_total'] ?? "0 GB",
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
