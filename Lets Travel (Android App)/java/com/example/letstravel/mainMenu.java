package com.example.letstravel;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.cardview.widget.CardView;

import android.content.Intent;
import android.os.Bundle;
import android.view.MenuItem;
import android.view.View;
import android.widget.GridLayout;
import android.widget.Toast;

import com.google.android.material.bottomnavigation.BottomNavigationView;
import com.google.android.material.navigation.NavigationBarView;

public class MainMenuActivity extends AppCompatActivity {

    GridLayout mainGrid;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main_menu);
        
        mainGrid = findViewById(R.id.mainGrid);
        setSingleEvent(mainGrid);

        BottomNavigationView bottomNavigationView = findViewById(R.id.bottomNav);
        bottomNavigationView.setOnItemSelectedListener(new NavigationBarView.OnItemSelectedListener() {
            @Override
            public boolean onNavigationItemSelected(@NonNull MenuItem item) {
                int id = item.getItemId();

                if (id == R.id.nav_home) {
                    Intent intent = new Intent(MainMenuActivity.this, MainMenuActivity.class);
                    startActivity(intent);
                    return true;
                } else {
                    Intent intent = new Intent(MainMenuActivity.this, MyAccountActivity.class);
                    startActivity(intent);
                    return true;
                }
            }
        });
    }

    private void setSingleEvent(GridLayout mainGrid) {
        for (int i = 0; i < mainGrid.getChildCount(); i++) {
            CardView cardView = (CardView) mainGrid.getChildAt(i);
            final int finalIndex = i;
            cardView.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    if (finalIndex == 0) {
                        Intent intent = new Intent(MainMenuActivity.this, CarActivity.class);
                        startActivity(intent);
                    } else if (finalIndex == 1) {
                        Intent intent = new Intent(MainMenuActivity.this, BusActivity.class);
                        startActivity(intent);
                    } else if (finalIndex == 2) {
                        Intent intent = new Intent(MainMenuActivity.this, BikeActivity.class);
                        startActivity(intent);
                    } else if (finalIndex == 3) {
                        Intent intent = new Intent(MainMenuActivity.this, HotelActivity.class);
                        startActivity(intent);
                    } else {
                        Toast.makeText(MainMenuActivity.this, "Please Try Again", Toast.LENGTH_SHORT).show();
                    }
                }
            });
        }
    }
}
