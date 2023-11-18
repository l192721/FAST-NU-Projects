package com.example.letstravel;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.firestore.DocumentReference;
import com.google.firebase.firestore.DocumentSnapshot;
import com.google.firebase.firestore.EventListener;
import com.google.firebase.firestore.FirebaseFirestore;
import com.google.firebase.firestore.FirebaseFirestoreException;
import com.google.android.gms.ads.AdRequest;
import com.google.android.gms.ads.AdView;
import com.google.android.gms.ads.MobileAds;
import java.util.Calendar;

public class MyAccountActivity extends AppCompatActivity {
    Button logout;
    public AdView banner;
    FirebaseFirestore firestore;
    FirebaseAuth firebaseAuth;
    TextView name, email, number;
    String userId;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_user_account);
        ImageView img;
        img = findViewById(R.id.img);
        name = findViewById(R.id.name);
        number = findViewById(R.id.contact);
        email = findViewById(R.id.email);
        firebaseAuth = FirebaseAuth.getInstance();
        firestore = FirebaseFirestore.getInstance();
        userId = firebaseAuth.getCurrentUser().getUid();
        logout = findViewById(R.id.logout_btn);
        DocumentReference documentReference = firestore.collection("users").document(userId);
        documentReference.addSnapshotListener(this, new EventListener<DocumentSnapshot>() {
            @Override
            public void onEvent(@Nullable DocumentSnapshot value, @Nullable FirebaseFirestoreException error) {
                if (value != null) {
                    name.setText(value.getString("username"));
                    number.setText(value.getString("phone"));
                    email.setText(value.getString("email"));
                }
            }
        });
        banner = findViewById(R.id.banner);
        initializeBannerAd("ca-app-pub-516155808935912~3847166187");
        loadBannerAd();

        logout = findViewById(R.id.logout_btn);
        logout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(MyAccountActivity.this, UserLogin.class);
                startActivity(intent);
            }
        });
		);
    }

    private void initializeBannerAd(String bannerId) {
        MobileAds.initialize(this, bannerId);
    }

    private void loadBannerAd() {
        AdRequest adRequest = new AdRequest.Builder().build();
        banner.loadAd(adRequest);
    }
}