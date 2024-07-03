import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Widgets/Widgets.dart';
import '../../../core/constants/constants.dart';
import '../../bloc/profile/bloc.dart';
import '../../bloc/profile/event.dart';
import '../../bloc/profile/state.dart';
import '../common/profileCircularImage.dart';

/// UpdateProfilePage is a stateful widget that allows users to update their profile information.
class UpdateProfilePage extends StatefulWidget {
  /// Constructor for UpdateProfilePage.
  const UpdateProfilePage({super.key});

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  /// Variables to hold the user's name and email.
  String? name;
  String? email;
  XFile? imageFile;
  @override
  void initState() {
    super.initState();

    // Access the ProfileBloc instance to get the current user's profile information.
    final profileBloc = context.read<ProfileBloc>();

    // Retrieve the current user profile from the ProfileBloc state.
    final userProfile = profileBloc.state.userProfile;

    // Initialize the name and email with the current user's profile information.
    name = userProfile.name;
    email = userProfile.email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Profile'),
        centerTitle: false, // Align the title to the start (left).
      ),
      body: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          // Show a toast message when the profile is updated successfully.
          if (state is ProfileUpdated) {
            Widgets.showToast('Profile updated successfully!');
          }
          // Show an error toast message if there is an error.
          else if (state is ProfileError) {
            Widgets.showToast(state.message);
          }
        },
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            return Padding(
              padding:
                  const EdgeInsets.all(16.0), // Apply padding to all sides.
              child: ListView(
                children: [
                  _profileImagePickers(state),
                  SizeConfig
                      .verticalSpace(), // Add vertical space between widgets.
                  _updateForm(state),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // Widget function to display profile image pickers based on the user's profile state.
  Widget _profileImagePickers(ProfileState state) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(
              20.sp), // Apply padding using Sizer for responsive design.
          child: ProfileCircularImage(
            imageFile: imageFile,
            imageUrl: state.userProfile.avatar, // Display user's profile image.
            nameText: state.userProfile.name, // Display user's name.
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.camera_alt,
                  color: Colors.grey), // Icon for updating profile picture.
              onPressed: () {
                _pickImage(ImageSource.camera);
                // Handle profile image update logic here.
              },
            ),
            IconButton(
              icon: const Icon(Icons.image,
                  color: Colors.grey), // Icon for updating profile picture.
              onPressed: () {
                _pickImage(ImageSource.gallery);
                // Handle profile image update logic here.
              },
            )
          ],
        ),
      ],
    ); // Icon for updating profile picture.
  }

  /// Returns a [Column] widget that contains a form for updating the user's profile information.
  ///
  /// The form consists of two [TxtField] widgets for the user's name and email. The current values of
  /// the name and email fields are displayed, and the user can update them by typing in the text fields.
  /// The [onChanged] callback of each text field updates the corresponding variable (name or email) with
  /// the new value.
  ///
  /// If the profile is being updated, a [CircularProgressIndicator] is displayed. Otherwise, a [Button.save]
  /// widget is displayed. When the save button is pressed, the [ProfileBloc] is triggered to update the
  /// user's profile with the new name and email values.
  ///
  /// Parameters:
  /// - `state`: The current state of the profile. Used to determine whether the profile is being updated.
  ///
  /// Returns:
  /// A [Column] widget containing the profile update form.
  Widget _updateForm(ProfileState state) {
    return Column(
      children: [
        TxtField(
          text: name,
          hintText: 'Name',
          labelText: 'Name',
          onChanged: (val) {
            setState(() {
              name =
                  val; // Update the name variable when the text field value changes.
            });
          },
        ),
        SizeConfig.verticalSpace(),
        TxtField(
          text: email,
          hintText: 'Email',
          labelText: 'Email',
          onChanged: (val) {
            setState(() {
              email =
                  val; // Update the email variable when the text field value changes.
            });
          },
        ),
        SizeConfig.verticalSpace(),
        // Show a loading indicator when the profile is being updated.
        if (state is ProfileLoading)
          const Center(child: CircularProgressIndicator())
        else
          Button.save(width: double.infinity,
          saveFn: () {
            // Trigger the UpdateProfile event to update the user's profile.
            context.read<ProfileBloc>().add(
                  UpdateProfile(state.userProfile.copyWith(
                    name: name,
                    email: email,
                  )),
                );
          }),
      ],
    );
  }

  void _pickImage(ImageSource source) {
    ImagePicker().pickImage(source: source).then((image) {
      if (image != null) {
        imageFile = image;
        Widgets.showToast('Storage not implemented');
        setState(() {
          
        });
      }
    });
  }
}
