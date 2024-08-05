//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <heytea_kit/heytea_kit_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) heytea_kit_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "HeyteaKitPlugin");
  heytea_kit_plugin_register_with_registrar(heytea_kit_registrar);
}
