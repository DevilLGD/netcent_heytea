#ifndef FLUTTER_PLUGIN_HEYTEA_KIT_PLUGIN_H_
#define FLUTTER_PLUGIN_HEYTEA_KIT_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace heytea_kit {

class HeyteaKitPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  HeyteaKitPlugin();

  virtual ~HeyteaKitPlugin();

  // Disallow copy and assign.
  HeyteaKitPlugin(const HeyteaKitPlugin&) = delete;
  HeyteaKitPlugin& operator=(const HeyteaKitPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace heytea_kit

#endif  // FLUTTER_PLUGIN_HEYTEA_KIT_PLUGIN_H_
