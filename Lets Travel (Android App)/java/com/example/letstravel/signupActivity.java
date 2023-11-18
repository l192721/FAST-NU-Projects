package com.example.letstravel;
import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;
import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.OnSuccessListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.auth.AuthResult;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.firestore.DocumentReference;
import com.google.firebase.firestore.FirebaseFirestore;
import java.util.HashMap;
import java.util.Map;

public class SignupActivity extends AppCompatActivity {
    EditText username, password, phone_no, memail;
    Button register_btn;
    FirebaseAuth firebaseAuth;
    FirebaseFirestore firestore;
    String userId;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_signup);

        username = findViewById(R.id.username);
        phone_no = findViewById(R.id.Phonenumber1);
        password = findViewById(R.id.password);
        memail = findViewById(R.id.email);
        register_btn = findViewById(R.id.signupbtn);

        firebaseAuth = FirebaseAuth.getInstance();
        firestore = FirebaseFirestore.getInstance();

        register_btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String email = memail.getText().toString().trim();
                String password1 = password.getText().toString().trim();
                String uname = username.getText().toString().trim();
                String phone = phone_no.getText().toString().trim();

                if (TextUtils.isEmpty(email)) {
                    memail.setError("Email is required");
                    return;
                }

                if (TextUtils.isEmpty(password1)) {
                    password.setError("Password is required");
                    return;
                }
				

                firebaseAuth.createUserWithEmailAndPassword(email, password1)
                        .addOnCompleteListener(new OnCompleteListener<AuthResult>() {
                            @Override
                            public void onComplete(@NonNull Task<AuthResult> task) {
                                if (task.isSuccessful()) {
                                    userId = firebaseAuth.getCurrentUser().getUid();
                                    DocumentReference documentReference = firestore.collection("users").document(userId);
                                    Map<String, Object> user = new HashMap<>();
                                    user.put("username", uname);
                                    user.put("email", email);
                                    user.put("phone", phone);

                                    documentReference.set(user).addOnSuccessListener(new OnSuccessListener<Void>() {
                                        @Override
                                        public void onSuccess(Void unused) {
                                            Toast.makeText(SignupActivity.this, "User Created", Toast.LENGTH_SHORT).show();
                                        }
                                    });

                                    startActivity(new Intent(getApplicationContext(), UserLogin.class));
                                } else {
                                    Toast.makeText(SignupActivity.this, "Error", Toast.LENGTH_SHORT).show();
                                }
                            }
                        });
            }
        });
    }
}
