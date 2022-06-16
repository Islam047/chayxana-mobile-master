package com.chayxana.chayxana

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import com.yandex.mapkit.MapKitFactory

class MainActivity: FlutterActivity() {
  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
   // MapKitFactory.setLocale("YOUR_LOCALE") // Your preferred language. Not required, defaults to system language
    MapKitFactory.setApiKey("b00283f6-30a9-406b-89fe-0c16bf88728c") // Your generated API key
    super.configureFlutterEngine(flutterEngine)
  }
}

