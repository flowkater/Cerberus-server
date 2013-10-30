# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


@user = User.create(email: "foobar@foobar.com", password:"foobarfoo", password_confirmation:"foobarfoo")
@project = @user.projects.create!(name: "Today Breaker")
@user.projects.create!(name: "KaKaoTalk")
@user.projects.create!(name: "Wind Runner")
@user.projects.create!(name: "Study Mate")

@scenario = @project.scenarios.create!(name: "A Scenario", description: "Many users used this A Scenario")
@project.scenarios.create!(name: "B Scenario", description: "Many users used this B Scenario")
@project.scenarios.create!(name: "C Scenario", description: "Many users used this C Scenario")
@project.scenarios.create!(name: "D Scenario", description: "Many users used this D Scenario")

@report1 = @project.reports.create!(appversion: 1.0,osversion: 4.1 ,scenario_id: @scenario.id, time_for_profiling: 120)
@report2 = @project.reports.create!(appversion: 1.2,osversion: 4.1, scenario_id: @scenario.id, time_for_profiling: 720)
@report3 = @project.reports.create!(appversion: 1.3,osversion: 4.1, scenario_id: @scenario.id, time_for_profiling: 620)
@report4 = @project.reports.create!(appversion: 1.4,osversion: 4.1, scenario_id: @scenario.id, time_for_profiling: 3534)
@report5 = @project.reports.create!(appversion: 1.5,osversion: 4.1, scenario_id: @scenario.id, time_for_profiling: 750)

@report1.create_memory
@report1.create_battery
@report1.create_network
@report1.create_cpu

@report2.create_memory
@report2.create_battery

@report3.create_memory
@report3.create_cpu

@report4.create_memory
@report4.create_battery
@report4.create_cpu

@memory = @report5.create_memory
@network = @report5.create_network
@battery = @report5.create_battery
@cpu = @report5.create_cpu

# CPU trace_methods dummy data
@cpu.trace_methods.create(name: 'android/os/BinderProxy.transact (ILandroid/os/Parcel;Landroid/os/Parcel;I)Z' , self_time_rate: 8.22, sum_time_rate: 8.22, call_index: 21, usecs: 352)
@cpu.trace_methods.create(name: 'com/android/internal/policy/impl/PhoneWindow.setContentView (I)V' , self_time_rate: 7.38, sum_time_rate: 15.59, call_index: 2, usecs: 316)
@cpu.trace_methods.create(name: 'android/provider/Settings$System.getString (Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;' , self_time_rate: 5.51, sum_time_rate: 21.10, call_index: 10, usecs: 236)
@cpu.trace_methods.create(name: 'android/view/View.<init> (Landroid/content/Context;)V' , self_time_rate: 5.51, sum_time_rate: 26.61, call_index: 8, usecs: 236)
@cpu.trace_methods.create(name: 'android/net/Uri.decode (Ljava/lang/String;)Ljava/lang/String;' , self_time_rate: 3.24, sum_time_rate: 29.86, call_index: 39, usecs: 139)
@cpu.trace_methods.create(name: 'android/os/Parcel.nativeWriteInterfaceToken (ILjava/lang/String;)V' , self_time_rate: 2.33, sum_time_rate: 32.19, call_index: 54, usecs: 100)
@cpu.trace_methods.create(name: 'android/widget/FrameLayout.<init> (Landroid/content/Context;)V' , self_time_rate: 2.10, sum_time_rate: 34.29, call_index: 6, usecs: 90)
@cpu.trace_methods.create(name: 'android/view/ViewConfiguration.<init> (Landroid/content/Context;)V' , self_time_rate: 1.96, sum_time_rate: 36.25, call_index: 13, usecs: 84)
@cpu.trace_methods.create(name: 'android/provider/Settings$NameValueCache.getString (Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;' , self_time_rate: 1.80, sum_time_rate: 38.05, call_index: 12, usecs: 77)
@cpu.trace_methods.create(name: 'android/content/res/AssetManager.loadResourceValue (ISLandroid/util/TypedValue;Z)I' , self_time_rate: 1.75, sum_time_rate: 39.80, call_index: 61, usecs: 75)
@cpu.trace_methods.create(name: 'android/os/Parcel.readInt ()I' , self_time_rate: 1.73, sum_time_rate: 41.53, call_index: 47, usecs: 74)
@cpu.trace_methods.create(name: 'android/util/SparseArray.put (ILjava/lang/Object;)V' , self_time_rate: 1.73, sum_time_rate: 43.25, call_index: 60, usecs: 74)
@cpu.trace_methods.create(name: 'android/app/ActivityManagerProxy.getContentProvider (Landroid/app/IApplicationThread;Ljava/lang/String;Z)Landroid/app/IActivityManager$ContentProviderHolder;' , self_time_rate: 1.68, sum_time_rate: 44.93, call_index: 18, usecs: 72)
@cpu.trace_methods.create(name: 'android/os/Parcel.recycle ()V' , self_time_rate: 1.61, sum_time_rate: 46.55, call_index: 43, usecs: 69)
@cpu.trace_methods.create(name: 'android/view/ViewConfiguration.get (Landroid/content/Context;)Landroid/view/ViewConfiguration;' , self_time_rate: 1.35, sum_time_rate: 47.90, call_index: 11, usecs: 58)
@cpu.trace_methods.create(name: 'android/os/SystemProperties.get (Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;' , self_time_rate: 1.33, sum_time_rate: 49.23, call_index: 51, usecs: 57)
@cpu.trace_methods.create(name: 'java/lang/AbstractStringBuilder.append0 (Ljava/lang/String;)V' , self_time_rate: 1.33, sum_time_rate: 50.56, call_index: 41, usecs: 57)
@cpu.trace_methods.create(name: 'android/net/Uri$AbstractPart.getDecoded ()Ljava/lang/String;' , self_time_rate: 1.24, sum_time_rate: 51.80, call_index: 36, usecs: 53)
@cpu.trace_methods.create(name: 'android/os/Parcel.nativeReadString (I)Ljava/lang/String;' , self_time_rate: 1.21, sum_time_rate: 53.01, call_index: 69, usecs: 52)
@cpu.trace_methods.create(name: 'android/app/Activity.onCreate (Landroid/os/Bundle;)V' , self_time_rate: 1.19, sum_time_rate: 54.20, call_index: 14, usecs: 51)
@cpu.trace_methods.create(name: 'android/os/Parcel.nativeReadInt (I)I' , self_time_rate: 1.19, sum_time_rate: 55.39, call_index: 70, usecs: 51)
@cpu.trace_methods.create(name: 'android/graphics/Typeface.SetFlipFonts ()V' , self_time_rate: 1.14, sum_time_rate: 56.54, call_index: 20, usecs: 49)
@cpu.trace_methods.create(name: 'android/os/SystemProperties.native_get (Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;' , self_time_rate: 1.14, sum_time_rate: 57.68, call_index: 72, usecs: 49)
@cpu.trace_methods.create(name: 'android/os/Parcel.nativeFreeBuffer (I)V' , self_time_rate: 1.03, sum_time_rate: 58.71, call_index: 74, usecs: 44)
@cpu.trace_methods.create(name: 'android/view/IWindowManager$Stub$Proxy.hasNavigationBar ()Z' , self_time_rate: 0.91, sum_time_rate: 59.62, call_index: 24, usecs: 39)
@cpu.trace_methods.create(name: 'com/android/internal/policy/impl/PhoneWindow.generateDecor ()Lcom/android/internal/policy/impl/PhoneWindow$DecorView;' , self_time_rate: 0.89, sum_time_rate: 60.50, call_index: 4, usecs: 38)
@cpu.trace_methods.create(name: 'java/util/regex/Splitter.fastSplit (Ljava/lang/String;Ljava/lang/String;I)[Ljava/lang/String;' , self_time_rate: 0.89, sum_time_rate: 61.39, call_index: 42, usecs: 38)
@cpu.trace_methods.create(name: 'android/view/Display.<init> (ILandroid/view/CompatibilityInfoHolder;)V' , self_time_rate: 0.86, sum_time_rate: 62.25, call_index: 55, usecs: 37)
@cpu.trace_methods.create(name: 'java/lang/System.arraycopy (Ljava/lang/Object;ILjava/lang/Object;II)V' , self_time_rate: 0.86, sum_time_rate: 63.12, call_index: 79, usecs: 37)
@cpu.trace_methods.create(name: 'android/content/pm/PackageItemInfo.<init> (Landroid/os/Parcel;)V' , self_time_rate: 0.82, sum_time_rate: 63.94, call_index: 35, usecs: 35)
@cpu.trace_methods.create(name: 'android/os/Parcel.readString ()Ljava/lang/String;' , self_time_rate: 0.82, sum_time_rate: 64.75, call_index: 57, usecs: 35)
@cpu.trace_methods.create(name: 'android/view/IWindowManager$Stub$Proxy.hasSystemNavBar ()Z' , self_time_rate: 0.82, sum_time_rate: 65.57, call_index: 27, usecs: 35)
@cpu.trace_methods.create(name: 'java/lang/String.length ()I' , self_time_rate: 0.82, sum_time_rate: 66.39, call_index: 81, usecs: 35)
@cpu.trace_methods.create(name: 'android/text/TextUtils$1.createFromParcel (Landroid/os/Parcel;)Ljava/lang/CharSequence;' , self_time_rate: 0.77, sum_time_rate: 67.16, call_index: 66, usecs: 33)
@cpu.trace_methods.create(name: 'android/view/Display.init (I)V' , self_time_rate: 0.77, sum_time_rate: 67.93, call_index: 84, usecs: 33)
@cpu.trace_methods.create(name: 'com/android/internal/policy/impl/PhoneWindow$DecorView.<init> (Lcom/android/internal/policy/impl/PhoneWindow;Landroid/content/Context;I)V' , self_time_rate: 0.75, sum_time_rate: 68.67, call_index: 5, usecs: 32)
@cpu.trace_methods.create(name: 'java/lang/String._getChars (II[CI)V' , self_time_rate: 0.75, sum_time_rate: 69.42, call_index: 73, usecs: 32)
@cpu.trace_methods.create(name: 'android/os/SystemProperties.native_get_long (Ljava/lang/String;J)J' , self_time_rate: 0.70, sum_time_rate: 70.12, call_index: 87, usecs: 30)

# Network latency_methods dummy data
@network.latency_methods.create(name: "doInBackground", class_name: "NetworkTask", request_url: "http://10.0.2.2:8080/JsonTest", line_number: 114, latency: 2014)
@network.latency_methods.create(name: "postNetworkExecute", class_name: "JsonNetwork", request_url: "http://search.naver.com/search.naver?where=nexearch&query=%3%2&ie=utf8&sm=tab_she&qdt=0", line_number: 76, latency: 1099)
@network.latency_methods.create(name: "getWebImage", class_name: "WebImageLoader", request_url: "http://postfiles3.naver.net/20130528_130/dh9289_1369720453251oXLWc_JPEG/naver_com_20130528_145325.jpg?type=w3", line_number: 43, latency: 3018)
@network.latency_methods.create(name: "doInBackground", class_name: "NetworkTask", request_url: "http://10.0.2.2:8080/JsonTest", line_number: 114, latency: 2010)
@network.latency_methods.create(name: "getImageList", class_name: "BoardActivity", request_url: "http://10.0.2.2:8080/file/image.do", line_number: 298, latency: 3097)
@network.latency_methods.create(name: "getImageList", class_name: "BoardActivity", request_url: "http://10.0.2.2:8080/file/image.do", line_number: 298, latency: 3088)
@network.latency_methods.create(name: "getImageList", class_name: "BoardActivity", request_url: "http://10.0.2.2:8080/file/image.do", line_number: 298, latency: 3109)

# Battery componetns dummy data
@battery.components.create(name: "GPS", joule: 58)
@battery.components.create(name: "LCD", joule: 855)
@battery.components.create(name: "CPU", joule: 120)
@battery.components.create(name: "WIFI", joule: 38)
@battery.components.create(name: "3G", joule: 90)
@battery.components.create(name: "Audio", joule: 45)
