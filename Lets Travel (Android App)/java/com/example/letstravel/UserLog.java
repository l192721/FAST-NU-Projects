package com.example.letstravel;
import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import android.content.Context;
import android.os.Bundle;
import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.firestore.FirebaseFirestore;
import com.google.firebase.firestore.QueryDocumentSnapshot;
import com.google.firebase.firestore.QuerySnapshot;
import java.util.ArrayList;

public class UserLog extends AppCompatActivity {
    private RecyclerView recyclerview;
    private UserLogAdapter notif_adapter;
    //private SearchView searchview;
    boolean isfound=true;
    Context context=this;
    FirebaseAuth firebase;
    FirebaseFirestore fire;
    String UserId;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_notification);
        recyclerview = (RecyclerView) findViewById(R.id.notifications);
        recyclerview.setLayoutManager(new LinearLayoutManager(context));
        firebase=FirebaseAuth.getInstance();
        fire=FirebaseFirestore.getInstance();
        UserId=firebase.getCurrentUser().getUid();

        String headings[]={"Sample"};
        String time[]={"5 May 2023"};


        ArrayList<com.example.smdproject.Classes.UserLog> notes=new ArrayList<>();
            com.example.smdproject.Classes.UserLog obj=new com.example.smdproject.Classes.UserLog(headings[0],time[0]);
            notes.add(obj);
         fire.collection("users").
                document(UserId).collection("Notifications").get().addOnCompleteListener(new OnCompleteListener<QuerySnapshot>() {
                    @Override
                    public void onComplete(@NonNull Task<QuerySnapshot> task) {
                        for(QueryDocumentSnapshot document: task.getResult())
                        {
                            com.example.smdproject.Classes.UserLog notes1= document.toObject(com.example.smdproject.Classes.UserLog.class);
                            notes.add(notes1);
                        }
                        notif_adapter = new UserLogAdapter(UserLog.this,notes);
                        recyclerview.setAdapter(notif_adapter);
                        notif_adapter.notifyDataSetChanged();
                    }
                });

    }
}