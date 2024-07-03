part of './bloc.dart';

/// Represents a user in the application.
class AppUser extends Model {
 
  /// access token
  final String accessToken;
  /// refresh token
  final String? refreshToken;
  ///Constructor
  AppUser({

    required this.accessToken,
  
    this.refreshToken,
    
  });

  ///Creates AppUser from the [Json] result
  factory AppUser.fromJson(Json json,) {
    return AppUser(
  
      accessToken: json.safeString('access_token'),
    
      refreshToken: json.safeString('refresh_token'),
     
      
    );
  }

  @override
  Json get toJson => <String, dynamic>{
       
        'access_token': accessToken,
        
        'refresh_token': refreshToken,
        
      
      };

  @override
  AppUser copyWith({
  
    String? accessToken,
   
   
    String? refreshToken,
  
  }) {
    return AppUser(
    
      accessToken: accessToken??this.accessToken,
     
      refreshToken: refreshToken??this.refreshToken,
     
    );
  }

  ///When the data is not yet loaded from server, this will be used to show loading indication
  static AppUser checking = AppUser(
   
    accessToken: 'checking',
  );

  ///When the data is not found, this will be returned
  static AppUser notFound = AppUser(
  
    accessToken: 'notFound',
  
  );
}
