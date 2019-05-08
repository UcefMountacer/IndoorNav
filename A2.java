package com.insidemaps.tutorial;

import android.app.Activity;
import android.os.Bundle;


import android.hardware.Sensor;
import android.hardware.SensorManager;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.service.autofill.Dataset;
import android.widget.TextView;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.ArrayList;


public class A2 extends Activity implements SensorEventListener{

    private TextView xText, yText, zText, timeText;
    private Sensor mySensor;
    private SensorManager SM;

    ArrayList arrayList = new ArrayList(1000);
    public int size;

    ///////////////////////

    private static final String File_name = "acc_data";
    File file = new File(this.getFilesDir(), File_name);
    FileReader fileReader = null;  //open in read mode
    FileWriter fileWriter = null;  //open in write mode
    BufferedReader bufferedReader = null;  //to read
    BufferedWriter bufferedWriter = null;  //to write


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_a2);

        // Create our Sensor Manager
        SM = (SensorManager)getSystemService(SENSOR_SERVICE);

        // a sensor manager contains : default for type, and listener to get data from it;

        // Accelerometer Sensor
        mySensor = SM.getDefaultSensor(Sensor.TYPE_ACCELEROMETER);

        // Register sensor Listener
        SM.registerListener(this, mySensor, SensorManager.SENSOR_DELAY_NORMAL);

        // Assign TextView
        xText = (TextView)findViewById(R.id.xText);
        yText = (TextView)findViewById(R.id.yText);
        zText = (TextView)findViewById(R.id.zText);
        timeText = (TextView)findViewById(R.id.tText);
    }

    @Override
    public void onAccuracyChanged(Sensor sensor, int accuracy) {
        // Not in use
    }

    @Override
    public void onSensorChanged(SensorEvent event) {
        long sampling_time = System.currentTimeMillis();

        //xText.setText("X: " + event.values[0]);
        //yText.setText("Y: " + event.values[1]);
        //zText.setText("Z: " + event.values[2]);
        //timeText.setText("T: " + sampling_time);


        //store data in a json file
        //create arraylist


        arrayList.add(sampling_time); //time in ms
        arrayList.add(event.values[0]);
        arrayList.add(event.values[1]);
        arrayList.add(event.values[2]);
        size = arrayList.size();  //atteindre un seuil ou on remet à 1000

    }





}

