package com.example.letstravel;

import androidx.appcompat.app.AppCompatActivity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import com.example.letstravel.Classes.Bookings;
import com.example.letstravel.Classes.Car;
import com.example.letstravel.Classes.UserLog;

public class CarActivity extends AppCompatActivity {
    EditText fromEditText, toEditText, dateEditText, carEditText;
    Button bookButton;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_car);

        fromEditText = findViewById(R.id.source);
        toEditText = findViewById(R.id.dest);
        dateEditText = findViewById(R.id.date_txt);
        carEditText = findViewById(R.id.enter_car);
        bookButton = findViewById(R.id.search_car);

        bookButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String type = "Car Booking";
                String from = fromEditText.getText().toString().trim();
                String to = toEditText.getText().toString().trim();
                String date = dateEditText.getText().toString().trim();
                String car = carEditText.getText().toString().trim();

                Car carObj = new Car();
                Bookings bookings = new Bookings();
                carObj.insert(type, from, to, car, date);
                UserLog userLog = new UserLog();
                userLog.insert("Car Booking Successful");
                bookings.insert("Car Booked", date);

                startActivity(new Intent(getApplicationContext(), CheckoutActivity.class));
            }
        });
    }
}
