package com.example.letstravel;

import androidx.appcompat.app.AppCompatActivity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.TextView;
import android.widget.Toast;

import java.util.Random;

public class CheckoutActivity extends AppCompatActivity {
    TextView name, phone, address, amount;
    RadioButton radio, radio2;
    String payment;
    Button btn;
    String userId, am;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_checkout);
        name = findViewById(R.id.name);
        phone = findViewById(R.id.Phonenumber);
        address = findViewById(R.id.address);
        radio = findViewById(R.id.radioButton);
        radio2 = findViewById(R.id.radioButton3);
        amount = findViewById(R.id.amount_text);
        btn = findViewById(R.id.checkout_btn);

        if (radio2.isChecked()) {
            payment = "Credit Card";
        } else {
            payment = "JzCash";
        }
        amount.setText("0.00");

        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String name1 = name.getText().toString().trim();
                String phone1 = phone.getText().toString().trim();
                String address1 = address.getText().toString().trim();

                Toast.makeText(CheckoutActivity.this, "Booked Successfully", Toast.LENGTH_SHORT).show();
                startActivity(new Intent(getApplicationContext(), MainMenu.class));
            }
        });
    }
}