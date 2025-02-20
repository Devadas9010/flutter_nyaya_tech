# Keep Flutter Downloader plugin classes
-keep class vn.hunghd.flutterdownloader.** { *; }

# Keep Firebase Messaging plugin classes
-keep class io.flutter.plugins.firebasemessaging.** { *; }

# Keep Flutter Local Notifications plugin classes
-keep class com.dexterous.flutterlocalnotifications.** { *; }

# Keep all classes in your app package (change `com.example.nyayatechproject` to your actual package name)
-keep class com.example.nyayatechproject.** { *; }

# Keep any class extending Application
-keep class * extends android.app.Application { *; }

# Keep any class extending BroadcastReceiver
-keep class * extends android.content.BroadcastReceiver { *; }

# Keep any class extending Service (important for background downloading)
-keep class * extends android.app.Service { *; }

# Ensure actions in notification are not removed (Pause, Resume, Cancel)
-keep class android.app.Notification$Action { *; }

# Keep Flutter WorkManager (if used for background tasks)
-keep class androidx.work.** { *; }

# Keep PendingIntent methods to ensure notification actions work
-keepclassmembers class android.app.PendingIntent { 
    *;
}

# Keep reflection-based classes (if FlutterDownloader uses it)
-keepattributes *Annotation*

# Avoid stripping methods used by the Flutter downloader plugin
-keepclassmembers class vn.hunghd.flutterdownloader.** {
    public *;
}
