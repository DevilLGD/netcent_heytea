#include "include/heytea_kit/heytea_kit_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "heytea_kit_plugin.h"

void HeyteaKitPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  heytea_kit::HeyteaKitPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
