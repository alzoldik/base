import 'package:base/feature/auth/singup/widget/schools.dart';
import 'package:base/feature/main_page.dart';
import 'package:base/utility/extintions.dart';
import 'package:base/widgets/app_bottom_sheet.dart';
import 'package:flutter/material.dart';
import '../../../../utility/route.dart';
import '../../../../widgets/custom_btn.dart';
import '../../../../widgets/custom_text_field.dart';
import '../widget/cities.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  String? city;
  String? school;
  String? subject;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Account')),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomTextField(
                        hint: "Name",
                        onChanged: (p0) {},
                      ),
                      SizedBox(height: 16.h),
                      CustomTextField(
                        hint: "Phone Number",
                        onChanged: (p0) {},
                      ),
                      SizedBox(height: 16.h),
                      CustomTextField(
                        hint: "Email",
                        onChanged: (p0) {},
                      ),
                      SizedBox(height: 16.h),
                      CustomTextField(
                        hint: "National ID",
                        onChanged: (p0) {},
                      ),
                      SizedBox(height: 16.h),
                      GestureDetector(
                        onTap: () {
                          showAppBottomSheet(
                            context: context,
                            widget: SizedBox(
                              height: context.h / 1.5,
                              width: double.infinity,
                              child: CitiesList(
                                city: city ?? "City",
                                onChanged: (value) {
                                  setState(
                                    () {
                                      city = value;
                                    },
                                  );
                                },
                              ),
                            ),
                          );
                        },
                        child: CustomTextField(
                          hint: city ?? "City",
                          enabled: false,
                          suffixIcon: const Icon(
                            Icons.keyboard_arrow_down_outlined,
                            size: 30,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      GestureDetector(
                        onTap: () {
                          showAppBottomSheet(
                            context: context,
                            widget: SizedBox(
                              height: context.h / 1.5,
                              width: double.infinity,
                              child: SchoolList(
                                school: school ?? "School",
                                onChanged: (value) {
                                  setState(
                                    () {
                                      school = value;
                                    },
                                  );
                                },
                              ),
                            ),
                          );
                        },
                        child: CustomTextField(
                          hint: school ?? "School",
                          enabled: false,
                          suffixIcon: const Icon(
                            Icons.keyboard_arrow_down_outlined,
                            size: 30,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      GestureDetector(
                        onTap: () {
                          showAppBottomSheet(
                            context: context,
                            widget: SizedBox(
                              height: context.h / 1.5,
                              width: double.infinity,
                              child: SchoolList(
                                school: subject ?? "Subject",
                                onChanged: (value) {
                                  setState(
                                    () {
                                      subject = value;
                                    },
                                  );
                                },
                              ),
                            ),
                          );
                        },
                        child: CustomTextField(
                          hint: subject ?? "Subject",
                          enabled: false,
                          suffixIcon: const Icon(
                            Icons.keyboard_arrow_down_outlined,
                            size: 30,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                    ],
                  ),
                ),
              ),
              Hero(
                tag: "btn",
                child: CustomBtn(
                  text: "Sign Up",
                  onPressed: () {
                    pushAndRemoveUntil(const MainPage());
                  },
                ),
              ),
              SizedBox(height: 32.h)
            ],
          ),
        ),
      ),
    );
  }
}
