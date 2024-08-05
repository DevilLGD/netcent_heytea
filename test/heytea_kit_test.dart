import 'package:flutter_test/flutter_test.dart';
import 'package:heytea_kit/heytea_kit.dart';
import 'package:heytea_kit/heytea_kit_platform_interface.dart';
import 'package:heytea_kit/heytea_kit_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockHeyteaKitPlatform
    with MockPlatformInterfaceMixin
    implements HeyteaKitPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final HeyteaKitPlatform initialPlatform = HeyteaKitPlatform.instance;

  test('$MethodChannelHeyteaKit is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelHeyteaKit>());
  });

  test('getPlatformVersion', () async {
    HeyTeaKit heyteaKitPlugin = HeyTeaKit();
    MockHeyteaKitPlatform fakePlatform = MockHeyteaKitPlatform();
    HeyteaKitPlatform.instance = fakePlatform;

    expect(await heyteaKitPlugin.getPlatformVersion(), '42');
  });
}
