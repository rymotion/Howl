package com.example.ryanpaglinawan.howl;

import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.GestureDetector;    //This one
import android.view.MotionEvent;    //This one
import android.app.Activity;    //This one
import android.content.Context;
import android.content.Intent;  //This one
import android.telephony.TelephonyManager;  //This one
import android.telephony.PhoneStateListener;    //This one
import android.view.View;
import android.support.v4.view.GestureDetectorCompat;   //This one
import android.telephony.SmsManager;    //This one
import android.telephony.SmsMessage;    //This one

//We take the shit from Howl iOS and put the shit in the shit for Android shit
public class MainActivity extends Activity implements
    GestureDetector.OnDoubleTapListener {

    private static final String DEBUG_TAG = "Gestures";
    private GestureDetectorCompat mDetector;

    @Override
    protected void onCreate (Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
    }

    @Override
    public void onLongPress(MotionEvent event){
        callEmNum();
        Log.d(DEBUG_TAG,"Using emCall function")
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
    public boolean onDoubleTap (MotionEvent e) {
       sendSMSMessage();
        Log.d(DEBUG_TAG, "Message sent");
    }

    @Override
    public boolean onDoubleTapEvent (MotionEvent e) {
        sendSMSMessage();
        Log.d(DEBUG_TAG, "Message sent");
    }

    protected void callEmNum() {
        Log.d(DEBUG_TAG, "Emergency services contacted");
        //getEmNum();
        String emNum = "911";
    }
    protected void sendSMSMessage() {
        Log.i("Send SMS", "");

        String phoneNo = txtphoneNo.getText().toString();
        String message = txtMessage.getText().toString();

        try {
            SmsManager smsManager = SmsManager.getDefault();
            smsManager.sendTextMessage(phoneNo, null, message, null, null);
            Toast.makeText(getApplicationContext(), "SMS sent.",
                    Toast.LENGTH_LONG).show();
        } catch (Exception e) {
            Toast.makeText(getApplicationContext(),
                    "SMS faild, please try again.",
                    Toast.LENGTH_LONG).show();
            e.printStackTrace();
        }
    }
    protected void getEmNum() {
        /*
            this is going to the GPS to find out what country you are in and will set it to the
            callEmNum function or atl east I hope
        */
    }
    protected void getContact(){
        /*
            This will get the contacts from the users phone and set it to the app
        */

    }
}
