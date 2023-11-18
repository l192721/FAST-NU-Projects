package com.example.letstravel;

import androidx.appcompat.app.AppCompatActivity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import com.example.letstravel.Classes.Bookings;
import com.example.letstravel.Classes.Hotel;
import com.example.letstravel.Classes.UserLog;

public class HotelActivity extends AppCompatActivity {

    EditText cityEditText, hotelEditText, daysEditText, roomsEditText, dateEditText;
    Button bookButton;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_hotel);

        cityEditText = findViewById(R.id.city_1);
        hotelEditText = findViewById(R.id.spinner2);
        daysEditText = findViewById(R.id.days);
        roomsEditText = findViewById(R.id.room_number);
        dateEditText = findViewById(R.id.dat1);
        bookButton = findViewById(R.id.book_hotel);

        bookButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String type = "Hotel Bookings";
                String city = cityEditText.getText().toString().trim();
                String hotel = hotelEditText.getText().toString().trim();
                String days = daysEditText.getText().toString().trim();
                String rooms = roomsEditText.getText().toString().trim();
                String date = dateEditText.getText().toString().trim();

                Hotel hotelObj = new Hotel();
                Bookings bookings = new Bookings();
                UserLog userLog = new UserLog();

                hotelObj.insert(type, city, hotel, days, date, rooms);
                userLog.insert("Hotel Booking Successful");
                bookings.insert("Hotel Booked", date);

                startActivity(new Intent(getApplicationContext(), CheckoutActivity.class));
            }
        });
    }
}
