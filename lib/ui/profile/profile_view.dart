import 'package:flutter/material.dart';
import 'package:shopperscart/ui/profile/profile_viewmodel.dart';
import 'package:shopperscart/ui/shared/constants.dart';
import 'package:shopperscart/ui/shared/styles.dart';
import 'package:shopperscart/ui/shared/ui_helpers.dart';
import 'package:stacked/stacked.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      builder: (context, model, child) => Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.bgtop),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: Text(
                    'More',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontFamily: "Poppins",
                      fontSize: 16,
                      color: blackText,
                    ),
                  ),
                ),
                verticalSpaceRegular,
                Row(
                  children: [
                    horizontalSpaceSmall,
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(Assets.user),
                    ),
                    horizontalSpaceSmall,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'John Wick',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: "Poppins",
                            fontSize: 16,
                            color: blackText,
                          ),
                        ),
                        Text(
                          '01XXXXXXXXXX',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontFamily: "Poppins",
                            fontSize: 15,
                            color: blackText,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                verticalSpaceLarge,
                Column(
                  children: [
                    Row(
                      children: [
                        horizontalSpaceRegular,
                        Icon(
                          Icons.edit,
                        ),
                        horizontalSpaceRegular,
                        Text(
                          'Edit Profile',
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 16,
                            color: blackText,
                          ),
                        ),
                      ],
                    ),
                    verticalSpaceRegular,
                    Container(
                      color: Colors.grey.shade300,
                      height: 2,
                    ),
                  ],
                ),
                verticalSpaceRegular,
                Column(
                  children: [
                    Row(
                      children: [
                        horizontalSpaceRegular,
                        Icon(
                          Icons.location_on,
                        ),
                        horizontalSpaceRegular,
                        Text(
                          'My Address',
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 16,
                            color: blackText,
                          ),
                        ),
                      ],
                    ),
                    verticalSpaceRegular,
                    Container(
                      color: Colors.grey.shade300,
                      height: 2,
                    ),
                  ],
                ),
                verticalSpaceRegular,
                Column(
                  children: [
                    InkWell(
                      onTap: () => model.navigateToOrderView(),
                      child: Row(
                        children: [
                          horizontalSpaceRegular,
                          Icon(
                            Icons.shop,
                          ),
                          horizontalSpaceRegular,
                          Text(
                            'My Orders',
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 16,
                              color: blackText,
                            ),
                          ),
                        ],
                      ),
                    ),
                    verticalSpaceRegular,
                    Container(
                      color: Colors.grey.shade300,
                      height: 2,
                    ),
                  ],
                ),
                verticalSpaceRegular,
                Column(
                  children: [
                    Row(
                      children: [
                        horizontalSpaceRegular,
                        Icon(
                          Icons.bolt,
                        ),
                        horizontalSpaceRegular,
                        Text(
                          'My Wishlist',
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 16,
                            color: blackText,
                          ),
                        ),
                      ],
                    ),
                    verticalSpaceRegular,
                    Container(
                      color: Colors.grey.shade300,
                      height: 2,
                    ),
                  ],
                ),
                verticalSpaceRegular,
                Column(
                  children: [
                    Row(
                      children: [
                        horizontalSpaceRegular,
                        Icon(
                          Icons.chat,
                        ),
                        horizontalSpaceRegular,
                        Text(
                          'Chat with us',
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 16,
                            color: blackText,
                          ),
                        ),
                      ],
                    ),
                    verticalSpaceRegular,
                    Container(
                      color: Colors.grey.shade300,
                      height: 2,
                    ),
                  ],
                ),
                verticalSpaceRegular,
                Column(
                  children: [
                    Row(
                      children: [
                        horizontalSpaceRegular,
                        Icon(
                          Icons.call,
                        ),
                        horizontalSpaceRegular,
                        Text(
                          'Talk to our Support',
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 16,
                            color: blackText,
                          ),
                        ),
                      ],
                    ),
                    verticalSpaceRegular,
                    Container(
                      color: Colors.grey.shade300,
                      height: 2,
                    ),
                  ],
                ),
                verticalSpaceRegular,
                Column(
                  children: [
                    Row(
                      children: [
                        horizontalSpaceRegular,
                        Icon(
                          Icons.mail,
                        ),
                        horizontalSpaceRegular,
                        Text(
                          'Mail to us',
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 16,
                            color: blackText,
                          ),
                        ),
                      ],
                    ),
                    verticalSpaceRegular,
                    Container(
                      color: Colors.grey.shade300,
                      height: 2,
                    ),
                  ],
                ),
                verticalSpaceRegular,
                Column(
                  children: [
                    Row(
                      children: [
                        horizontalSpaceRegular,
                        Icon(
                          Icons.logout,
                        ),
                        horizontalSpaceRegular,
                        Text(
                          'Log out',
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 16,
                            color: blackText,
                          ),
                        ),
                      ],
                    ),
                    verticalSpaceRegular,
                    Container(
                      color: Colors.grey.shade300,
                      height: 2,
                    ),
                  ],
                ),
                verticalSpaceMedium
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => ProfileViewModel(),
    );
  }
}
