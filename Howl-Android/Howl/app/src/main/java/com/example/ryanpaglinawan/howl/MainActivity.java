package com.example.ryanpaglinawan.howl;

import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.hardware.Camera;
import android.net.Uri;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.telephony.TelephonyManager;
import android.telephony.PhoneStateListener;
import android.view.View;
import android.support.v4.view.GestureDetectorCompat;
import android.telephony.SmsManager;
import android.telephony.SmsMessage;

//We take the shit from Howl iOS and put the shit in the shit for Android shit
public class MainActivity extends Activity implements
    GestureDetector.OnGestureListener,
    GestureDetector.OnDoubleTapListener {

    private static final String DEBUG_TAG = "Gestures";
    private GestureDetectorCompat mDetector;

    @Override
    protected void onCreate (Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
    }

    @Override
    public boolean onDown (MotionEvent e) {
       return false;
    }

    @Override
    public void onShowPress (MotionEvent e) {

    }

    @Override
    public boolean onSingleTapUp (MotionEvent e) {
      return false;
    }

    @Override
    public boolean onScroll (MotionEvent e1, MotionEvent e2, float distanceX, float distanceY) {
        return false;
    }

    @Override
    public void onLongPress(MotionEvent event){
        Log.d(DEBUG_TAG, "onLongPress: " + event.toString());

        Intent callIntent = new Intent(Intent.ACTION_CALL);
        callIntent.setData(Uri.parse("tel:411"));
        startActivity(callIntent);
    }

    @Override
    public boolean onFling (MotionEvent e1, MotionEvent e2, float velocityX, float velocityY) {
        return false;
    }

    @Override
    public boolean onCreateOptionsMenu (Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected (MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }

    @Override
    public boolean onSingleTapConfirmed (MotionEvent e) {
        return false;
    }

    @Override
    public boolean onDoubleTap (MotionEvent e) {
        return false;
    }

    @Override
    public boolean onDoubleTapEvent (MotionEvent e) {
        return false;
    }
}
