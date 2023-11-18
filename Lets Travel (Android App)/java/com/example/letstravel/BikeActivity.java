package com.example.letstravel;

import androidx.appcompat.app.AppCompatActivity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import com.example.letstravel.Classes.Bookings;
import com.example.letstravel.Classes.UserLog;

public class BikeActivity extends AppCompatActivity {
    EditText fromEditText, toEditText, dateEditText, bikeEditText;
    Button bookButton;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_bike);

        toEditText = findViewById(R.id.dest);
        fromEditText = findViewById(R.id.source);
        dateEditText = findViewById(R.id.date_txt);
        bikeEditText = findViewById(R.id.enter_bike);
        bookButton = findViewById(R.id.search_bike);

        bookButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String type = "Bike Booking";
                String from = fromEditText.getText().toString().trim();
                String to = toEditText.getText().toString().trim();
                String date = dateEditText.getText().toString().trim();
                String bike = bikeEditText.getText().toString().trim();
                Bike bikeObj = new Bike();
                Bookings bookings = new Bookings();
                bikeObj.insert(type, from, to, bike, date);
                UserLog userLog = new UserLog();
                userLog.insert("Bike Booking Successful");
                bookings.insert("Bike Booked", date);
                startActivity(new Intent(getApplicationContext(), CheckoutActivity.class));
            }
        });
    }
}
