import '../models/meetUpPeople.dart';

/// dummy data
class Dummydata {
  Dummydata._();

 static final MeetupPeople _sampleMeetupPeople = MeetupPeople(
      author: 'khaled',
      authorImage:
          'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
      totalMeetUp: 1028,
      participants: [
        Perticipant(
          imageUrl:
              'https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg',
        ),
        Perticipant(
          imageUrl:
              'https://www.befunky.com/images/wp/wp-2021-01-linkedin-profile-picture-after.jpg?auto=avif,webp&format=jpg&width=944',
        ),
        Perticipant(
            imageUrl:
                'https://www.shutterstock.com/image-photo/profile-picture-smiling-young-african-260nw-1873784920.jpg'),
        Perticipant(
            imageUrl:
                'https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg'),
        Perticipant(
            imageUrl:
                'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
      ]);
/// Trending People
  static List<MeetupPeople> trendingPeople = <MeetupPeople>[
    _sampleMeetupPeople,
    _sampleMeetupPeople.copyWith(
      author: 'khaled',
      totalMeetUp: 1088
    ),
    _sampleMeetupPeople.copyWith(
        author: 'Abc',
        totalMeetUp: 250
    ),
    _sampleMeetupPeople.copyWith(
        author: 'Xyz',
        totalMeetUp: 10
    ),
  ];
}
