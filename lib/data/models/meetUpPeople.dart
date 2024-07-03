/// Meetup People
class MeetupPeople {
  /// Author
  String? author;
  /// Total MeetUp
  int? totalMeetUp;
  /// Author Image
  String? authorImage;
  /// Perticipant List
  List<Perticipant>? participants;
  ///constructor
  MeetupPeople({this.author, this.authorImage, this.totalMeetUp, this.participants});

/// Returns a new instance of [MeetupPeople] with the same properties as the current instance,
/// except for the specified properties which can be overridden.
///
/// Parameters:
/// - [author]: The new value for the [author] property. If not provided, the current value is used.
/// - [authorImage]: The new value for the [authorImage] property. If not provided, the current value is used.
/// - [totalMeetUp]: The new value for the [totalMeetUp] property. If not provided, the current value is used.
/// - [participants]: The new value for the [participants] property. If not provided, the current value is used.
///
/// Returns:
/// A new instance of [MeetupPeople] with the updated properties.
  MeetupPeople copyWith({String? author, String? authorImage, int? totalMeetUp, List<Perticipant>? participants}) {
    return MeetupPeople(
      author: author ?? this.author,
      authorImage: authorImage ?? this.authorImage,
      totalMeetUp: totalMeetUp ?? this.totalMeetUp,
      participants: participants ?? this.participants,
    );
  }
}
/// Perticipant
class Perticipant {
  /// Perticipant Name
  String? name;

  /// Perticipant Image
  String? imageUrl;

  /// Perticipant constructor
  Perticipant({this.imageUrl, this.name});
}
