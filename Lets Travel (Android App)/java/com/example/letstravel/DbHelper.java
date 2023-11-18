package com.example.letstravel;

import com.google.android.gms.tasks.OnSuccessListener;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.firestore.DocumentReference;
import com.google.firebase.firestore.FirebaseFirestore;
import java.util.HashMap;
import java.util.Map;
public class DbHelper {
    private FirebaseAuth firebaseAuth;
    private FirebaseFirestore firestore;
    private String userId;

    public DbHelper() {
        firebaseAuth = FirebaseAuth.getInstance();
        firestore = FirebaseFirestore.getInstance();
        userId = firebaseAuth.getCurrentUser().getUid();
    }
	
	public void insertBikeBookings(String type, String from1, String to1, String bike1, String date1) {
		Map<String, Object> booked = new HashMap<>();
		booked.put("type", type);
		booked.put("Source", from1);
		booked.put("Destination", to1);
		booked.put("bike", bike1);
		booked.put("Date", date1);
		firestore.collection("users").document(userId).collection("Bookings")
				.add(booked)
				.addOnSuccessListener(new OnSuccessListener<DocumentReference>() {
					@Override
					public void onSuccess(DocumentReference documentReference) {

					}
				});
    }

    public void insertCarBookings(String type, String from1, String to1, String car1, String date1) {
        Map<String, Object> booked = new HashMap<>();
        booked.put("type", type);
        booked.put("Source", from1);
        booked.put("Destination", to1);
        booked.put("car", car1);
        booked.put("Date", date1);
        firestore.collection("users").document(userId).collection("Bookings")
                .add(booked)
                .addOnSuccessListener(new OnSuccessListener<DocumentReference>() {
                    @Override
                    public void onSuccess(DocumentReference documentReference) {

                    }
                });
    }

    public void insertHotelBookings(String type, String city1, String hotel1, String day1, String date1, String room1) {
        Map<String, Object> booked = new HashMap<>();
        booked.put("type", type);
        booked.put("City", city1);
        booked.put("Hotel", hotel1);
        booked.put("Days", day1);
        booked.put("Date", date1);
        booked.put("rooms", room1);

        firestore.collection("users").document(userId).collection("Bookings")
                .add(booked)
                .addOnSuccessListener(new OnSuccessListener<DocumentReference>() {
                    @Override
                    public void onSuccess(DocumentReference documentReference) {

                    }
                });
    }

    public void insertBusBookings(String type, String from1, String to1, String seat1, String date1, String service) {
        Map<String, Object> booked = new HashMap<>();
        booked.put("type", type);
        booked.put("Source", from1);
        booked.put("Destination", to1);
        booked.put("Seats", seat1);
        booked.put("Date", date1);
        booked.put("Service", service);

        firestore.collection("users").document(userId).collection("Bookings")
                .add(booked)
                .addOnSuccessListener(new OnSuccessListener<DocumentReference>() {
                    @Override
                    public void onSuccess(DocumentReference documentReference) {

                    }
                });
    }

    public void insertUserLog(String type1, String date1) {
        Map<String, Object> booked = new HashMap<>();
        booked.put("time", date1);
        booked.put("heading", type1);
        firestore.collection("users").document(userId)
                .collection("UserLog")
                .add(booked)
                .addOnSuccessListener(new OnSuccessListener<DocumentReference>() {
                    @Override
                    public void onSuccess(DocumentReference documentReference) {

                    }
                });
    }

    public void insertMyBookings(String type1, String date) {
        Map<String, Object> booked = new HashMap<>();
        booked.put("Time", date);
        booked.put("heading", type1);
        firestore.collection("users").document(userId)
                .collection("Bookings")
                .add(booked)
                .addOnSuccessListener(new OnSuccessListener<DocumentReference>() {
                    @Override
                    public void onSuccess(DocumentReference documentReference) {

                    }
                });
    }
}
