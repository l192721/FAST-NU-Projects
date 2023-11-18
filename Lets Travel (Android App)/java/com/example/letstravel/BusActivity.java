package com.example.letstravel;

import androidx.appcompat.app.AppCompatActivity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import com.example.letstravel.Classes.Bus;
import com.example.letstravel.Classes.Bookings;
import com.example.letstravel.Classes.UserLog;

public class BusActivity extends AppCompatActivity {
    EditText fromEditText, toEditText, dateEditText, seatsEditText, busServiceEditText;
    Button bookButton;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_bus);

        fromEditText = findViewById(R.id.source1);
        toEditText = findViewById(R.id.dest);
        dateEditText = findViewById(R.id.date_txt);
        seatsEditText = findViewById(R.id.seats_no);
        busServiceEditText = findViewById(R.id.air_txt);
        bookButton = findViewById(R.id.book_btn);

        bookButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String type = "Bus Booking";
                String from = fromEditText.getText().toString().trim();
                String to = toEditText.getText().toString().trim();
                String date = dateEditText.getText().toString().trim();
                String seats = seatsEditText.getText().toString().trim();
                String busService = busServiceEditText.getText().toString().trim();

                UserLog userLog = new UserLog();
                Bookings bookings = new Bookings();
                Bus bus = new Bus();
                bus.insert(type, from, to, seats, date, busService);
                userLog.insert("Bus Booking Successful");
                bookings.insert("Bus Ticket", date);

                startActivity(new Intent(getApplicationContext(), CheckoutActivity.class));
            }
        });
    }
}