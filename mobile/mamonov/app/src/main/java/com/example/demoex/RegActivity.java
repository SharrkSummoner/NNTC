package com.example.demoex;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;

public class RegActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_reg);
    }

    public void login(View view) {
        Intent intent = new Intent(RegActivity.this, LoginActivity.class);
        startActivity(intent);
    }

    public void signin(View view) {
        Intent intent = new Intent(RegActivity.this, MainActivity.class);
        startActivity(intent);
    }
}