class VideoLesson {
  final String name;
  final String topic;
  final String description;
  final String url;
  final String time;

  VideoLesson({
    required this.name,
    required this.topic,
    required this.description,
    required this.url,
    required this.time,
  });

  /// إنشاء كائن [VideoLesson] من خريطة JSON
  factory VideoLesson.fromJson(Map<String, dynamic> json) {
    return VideoLesson(
      name: json['name'] as String,
      topic: json['topic'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      time: json['time'] as String,
    );
  }

  /// تحويل كائن [VideoLesson] إلى خريطة JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'topic': topic,
      'description': description,
      'url': url,
      'time': time,
    };
  }

  @override
  String toString() {
    return 'VideoLesson(name: $name, topic: $topic, description: $description, url: $url, time: $time)';
  }
}