import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Widgets/Widgets.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/utils/navigationService.dart';
import '../../../../routes/appRoutes.dart';
import '../../../bloc/login/bloc.dart';
import '../../../bloc/login/event.dart';
import '../../../bloc/profile/bloc.dart';

import '../../../bloc/profile/state.dart';
import '../../common/profileCircularImage.dart';

/// profile tab
class ProfileTab extends StatelessWidget {
  /// constructor
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
   

    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return AppLoadingWidget(
          isLoading: state is ProfileLoading,
          child: Padding(
            padding: EdgeInsets.all(SizeConfig.spaceBetween),
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                _buildProfileHeader(state),
                SizeConfig.verticalSpace(),
                _buildProfileOption(
                  context,
                  icon: Icons.edit,
                  title: 'Edit Profile',
                  isLoading: state is ProfileLoading,
                  subtitle: 'Change profile picture, name, E-mail',
                  onTap: () {
                    NavigatorService.pushNamed(AppRoutes.updateProfile,
                        arguments: state.userProfile.id);
                    
                  },
                ),
                _buildProfileOption(
                  context,
                  icon: Icons.lock,
                  title: 'Change Password',
                  subtitle: 'Update and strengthen account security',
                  onTap: () {},
                ),
                _buildProfileOption(
                  context,
                  icon: Icons.description,
                  title: 'Terms of Use',
                  subtitle: 'Protect your account now',
                  onTap: () {},
                ),
                _buildProfileOption(
                  context,
                  icon: Icons.credit_card,
                  title: 'Add Card',
                  subtitle: 'Securely add payment method',
                  onTap: () {},
                ),
                SizeConfig.verticalSpace(),
                _buildProfileOption(
                  context,
                  icon: Icons.notifications,
                  title: 'Notification',
                  trailing: Switch(value: true, onChanged: (bool value) {}),
                  onTap: () {},
                ),
                _buildProfileOption(
                  context,
                  icon: Icons.help,
                  title: 'FAQ',
                  onTap: () {},
                ),
                _buildProfileOption(
                  context,
                  icon: Icons.logout,
                  title: 'Log Out',
                  isLoading: state is ProfileLoading,
                  onTap: () {
                      BlocProvider.of<LoginBloc>(context).add(LogoutEvent());
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Builds the profile header with user's avatar and details.
  Widget _buildProfileHeader(ProfileState state) {
    return Column(
      children: [
        ProfileCircularImage(
          imageUrl: state.userProfile.avatar,
          nameText: state.userProfile.name,
        ),
        SizeConfig.verticalSpace(),
        
        Center(
          child: Column(
            children: [
              Text(
                state.userProfile.name,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(state.userProfile.email),
            ],
          ),
        ),
      ],
    );
  }

  /// Builds a list tile option for the profile tab.
  Widget _buildProfileOption(BuildContext context,
      {required IconData icon,
      required String title,
      String? subtitle,
      Widget? trailing,
      required VoidCallback onTap,
      bool isLoading = true}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: trailing,
      onTap: () {
        if (!isLoading) {
          onTap();
        }
      },
    );
  }
}
