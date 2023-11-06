// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:base/services/mobile_settings_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:base/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    var mobileSettingsService = await MobileSettingsService.instance();

    await tester
        .pumpWidget(MyApp(mobileSettingsService: mobileSettingsService));

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}



// # Uncomment this line to define a global platform for your project
// platform :ios, '13.0'

// # CocoaPods analytics sends network stats synchronously affecting flutter build latency.
// ENV['COCOAPODS_DISABLE_STATS'] = 'true'

// project 'Runner', {
//   'Debug' => :debug,
//   'Profile' => :release,
//   'Release' => :release,
// }

// def flutter_root
//   generated_xcode_build_settings_path = File.expand_path(File.join('..', 'Flutter', 'Generated.xcconfig'), __FILE__)
//   unless File.exist?(generated_xcode_build_settings_path)
//     raise "#{generated_xcode_build_settings_path} must exist. If you're running pod install manually, make sure flutter pub get is executed first"
//   end

//   File.foreach(generated_xcode_build_settings_path) do |line|
//     matches = line.match(/FLUTTER_ROOT\=(.*)/)
//     return matches[1].strip if matches
//   end
//   raise "FLUTTER_ROOT not found in #{generated_xcode_build_settings_path}. Try deleting Generated.xcconfig, then run flutter pub get"
// end

// require File.expand_path(File.join('packages', 'flutter_tools', 'bin', 'podhelper'), flutter_root)

// flutter_ios_podfile_setup

// target 'Runner' do
//   use_frameworks!
//   use_modular_headers!
//   source 'https://github.com/CocoaPods/Specs.git'


//   flutter_install_all_ios_pods File.dirname(File.realpath(__FILE__))
// end


// target 'push_notification' do
//   use_frameworks!
//   pod 'Firebase/Messaging'
// end

// post_install do |installer|
//   installer.pods_project.targets.each do |target|
//     flutter_additional_ios_build_settings(target)
//   end
// end
