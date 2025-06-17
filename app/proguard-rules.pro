# ----------------------------------
#          基本配置
# ----------------------------------
-optimizationpasses 5
-dontusemixedcaseclassnames
-dontskipnonpubliclibraryclasses
-dontpreverify
-verbose
-optimizations !code/simplification/arithmetic,!field/*,!class/merging/*

# ----------------------------------
#         Android 保留规则
# ----------------------------------
-keep public class * extends android.app.Activity
-keep public class * extends android.app.Application
-keep public class * extends android.app.Service
-keep public class * extends android.content.BroadcastReceiver
-keep public class * extends android.content.ContentProvider
-keep public class * extends android.view.View {
    public <init>(android.content.Context);
    public <init>(android.content.Context, android.util.AttributeSet);
    public <init>(android.content.Context, android.util.AttributeSet, int);
    public void set*(...);
}

-keepclasseswithmembers class * {
    public <init>(android.content.Context, android.util.AttributeSet);
}

-keepclasseswithmembers class * {
    public <init>(android.content.Context, android.util.AttributeSet, int);
}

-keepclassmembers class * extends android.app.Activity {
    public void *(android.view.View);
}

-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

-keep class * implements android.os.Parcelable {
    public static final android.os.Parcelable$Creator *;
}

# ----------------------------------
#         库特定保留规则
# ----------------------------------
# 保留公共API
-keep class com.example.mylibrary.** { *; }

# 保留内部关键类
-keep class com.example.mylibrary.internal.** { *; }

# 保留所有注解
-keepattributes *Annotation*

# 保留泛型信息
-keepattributes Signature

# 保留行号信息（便于崩溃分析）
-keepattributes SourceFile,LineNumberTable

# ----------------------------------
#         第三方库保留规则
# ----------------------------------
# 示例：保留Gson相关类
-keep class sun.misc.Unsafe { *; }
-keep class com.google.gson.** { *; }