//Android Wear interface for KitKat build
package com.example.ryanpaglinawan.howl;

import android.app.Activity;
import android.os.Bundle;
import android.support.wearable.view.WatchViewStub;
import android.view.GestureDetector;
import android.widget.TextView;

public class Main_act extends Activity implements
    GestureDetector.OnDoubleTapListener,
    GestureDetector.OnGestureListener{

    private static final String DEBUG_TAG = "GESTURES";
    private GestureDetectorCompact mDetector;

    private TextView mTextView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main_act);

        final WatchViewStub stub = (WatchViewStub) findViewById(R.id.watch_view_stub);
        stub.setOnLayoutInflatedListener(new WatchViewStub.OnLayoutInflatedListener() {
            @Override
            public void onLayoutInflated(WatchViewStub stub) {
                mTextView = (TextView) stub.findViewById(R.id.text);
            }
        });
    }
}
