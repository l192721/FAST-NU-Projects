package com.example.letstravel;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.SearchView;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import android.content.Context;
import android.os.Bundle;
import com.example.letstravel.Classes.Bookings;
import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.firestore.FirebaseFirestore;
import com.google.firebase.firestore.QueryDocumentSnapshot;
import com.google.firebase.firestore.QuerySnapshot;

import java.util.ArrayList;

public class mybookingActivity extends AppCompatActivity {
    private RecyclerView recyclerview;
    private SearchView searchview;
    private BookingsAdapter notif_adapter;
    boolean isfound=true;
    Context context=this;
    FirebaseAuth firebase;
    FirebaseFirestore fire;
    String UserId;
	AirplaneModeChangeReceiver airplaneModeChangeReceiver = new AirplaneModeChangeReceiver();
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_mybooking);
        recyclerview = (RecyclerView) findViewById(R.id.bookings);
        recyclerview.setLayoutManager(new LinearLayoutManager(context));
        firebase=FirebaseAuth.getInstance();
        fire=FirebaseFirestore.getInstance();
        UserId=firebase.getCurrentUser().getUid();

        String headings[]={"Sample Booking"};
        String time[]={"5 May 2023"};
        ArrayList<Bookings> notes=new ArrayList<>();
        Bookings obj=new Bookings(headings[0],time[0]);
        notes.add(obj);
        fire.collection("users").
                document(UserId).collection("My Bookings").get().addOnCompleteListener(new OnCompleteListener<QuerySnapshot>() {
                    @Override
                    public void onComplete(@NonNull Task<QuerySnapshot> task) {
                        for(QueryDocumentSnapshot document: task.getResult())
                        {
                            Bookings notes1= document.toObject(Bookings.class);
                            notes.add(notes1);
                        }
                        notif_adapter = new BookingsAdapter(mybookingActivity.this,notes);
                        recyclerview.setAdapter(notif_adapter);
                        notif_adapter.notifyDataSetChanged();
                    }
                });


    }
	@Override
    protected void onStart() {
        super.onStart();
        IntentFilter filter = new IntentFilter(Intent.ACTION_AIRPLANE_MODE_CHANGED);
        registerReceiver(airplaneModeChangeReceiver, filter);
    }

    @Override
    protected void onStop() {
        super.onStop();
        unregisterReceiver(airplaneModeChangeReceiver);
    }
}