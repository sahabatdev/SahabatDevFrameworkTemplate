<?xml version="1.0" encoding="utf-8"?>
 <LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
     xmlns:app="http://schemas.android.com/apk/res-auto"
     xmlns:tools="http://schemas.android.com/tools"
     android:layout_width="match_parent"
     android:layout_height="match_parent"
     android:orientation="vertical">

     <android.support.design.widget.TabLayout
         android:id="@+id/tab_${activityPackage}"
         android:layout_width="match_parent"
         android:layout_height="?attr/actionBarSize"
         app:tabBackground="@color/colorPrimary"
         app:tabGravity="fill">

     </android.support.design.widget.TabLayout>

     <android.support.v4.view.ViewPager
         android:id="@+id/view_pager_${activityPackage}"
         android:layout_width="match_parent"
         android:layout_height="match_parent">

     </android.support.v4.view.ViewPager>

 </LinearLayout>