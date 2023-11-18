package com.example.letstravel;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;
import com.example.letstravel.Classes.Bookings;

import java.util.ArrayList;

public class BookingsAdapter extends RecyclerView.Adapter<BookingsAdapter.BookingViewHolder> {
    private Context context;
    private ArrayList<Bookings> bookings;
    private ArrayList<Bookings> fullBookings;

    public BookingsAdapter(Context context, ArrayList<Bookings> bookingsList) {
        this.context = context;
        this.bookings = bookingsList;
        this.fullBookings = new ArrayList<>(bookingsList);
    }

    @NonNull
    @Override
    public BookingViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(context).inflate(R.layout.item_booking, parent, false);
        return new BookingViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull BookingViewHolder holder, int position) {
        Bookings booking = bookings.get(position);
        holder.bookingNameTextView.setText(booking.getHeading());
        holder.bookingDateTextView.setText(booking.getTime());
    }

    @Override
    public int getItemCount() {
        return bookings.size();
    }

    public class BookingViewHolder extends RecyclerView.ViewHolder {
        private TextView bookingNameTextView;
        private TextView bookingDateTextView;

        public BookingViewHolder(@NonNull View itemView) {
            super(itemView);
            bookingNameTextView = itemView.findViewById(R.id.booking_name);
            bookingDateTextView = itemView.findViewById(R.id.booking_date);
        }
    }
}