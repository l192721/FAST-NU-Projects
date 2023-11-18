package com.example.letstravel;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;
import com.example.letstravel.Classes.UserLog;
import java.util.ArrayList;

public class UserLogAdapter extends RecyclerView.Adapter<UserLogAdapter.notification_view_holder>{
    private Context context;
    private ArrayList<UserLog> userLogs;
    private ArrayList<UserLog> notificationsFull;

    public UserLogAdapter(Context context, ArrayList<UserLog> list){
        this.context=context;
        this.userLogs =list;
        this.notificationsFull =new ArrayList<UserLog>();
    }

    @NonNull
    @Override
    public UserLogAdapter.notification_view_holder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        return new notification_view_holder(LayoutInflater.from(context).inflate(R.layout.activity_sample_notifications,parent,false));
    }
	@Override
    public int getItemCount() {
        return userLogs.size();
    }

    @Override
    public void onBindViewHolder(@NonNull UserLogAdapter.notification_view_holder holder, int position) {
        holder.notification_name.setText(userLogs.get(position).getHeading());
        holder.notification_date.setText(userLogs.get(position).getTime());

    }
    public class notification_view_holder extends RecyclerView.ViewHolder{
        private TextView notification_name;
        private TextView notification_date;

        public notification_view_holder(@NonNull View itemView) {
            super(itemView);
            notification_name=itemView.findViewById(R.id.notification_name);
            notification_date=itemView.findViewById(R.id.notification_date);

        }
    }
}
