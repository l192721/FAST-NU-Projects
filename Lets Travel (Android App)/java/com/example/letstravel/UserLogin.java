package com.example.letstravel;
import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import android.content.Intent;
import android.os.Bundle;
import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.auth.AuthResult;
import com.google.firebase.auth.FirebaseAuth;
import android.text.TextUtils;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class UserLogin extends AppCompatActivity {
Button btn_login,sign_btn;
EditText user,pass;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        FirebaseAuth firebase;
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        user=(EditText) findViewById(R.id.edit_text_email) ;
        pass=(EditText) findViewById(R.id.edit_text_password) ;
        btn_login= (Button) findViewById(R.id.login_btn);
        sign_btn=(Button) findViewById(R.id.sign_btn);
        firebase=FirebaseAuth.getInstance();
        btn_login.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String email= user.getText().toString().trim();
                String password1= pass.getText().toString().trim();

                if(TextUtils.isEmpty(email))
                {
                    user.setError("Email is Required");
                    return;
                }
                if(TextUtils.isEmpty(password1))
                {
                    pass.setError("Password is Required");
                    return;
                }
                firebase.signInWithEmailAndPassword(email,password1).addOnCompleteListener(new OnCompleteListener<AuthResult>() {
                    @Override
                    public void onComplete(@NonNull Task<AuthResult> task) {
                        if(task.isSuccessful())
                        {
                            Toast.makeText(UserLogin.this,"User Logged in",Toast.LENGTH_SHORT).show();
                            Intent intent =new Intent(UserLogin.this, mainMenu.class);
                            startActivity(intent);

                        }
                        else
                        {
                            Toast.makeText(UserLogin.this,"Unable to login",Toast.LENGTH_SHORT).show();
                        }
                    }
                });
            }
        });

        sign_btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent1=new Intent(UserLogin.this, signupActivity.class);
                startActivity(intent1);
            }
        });
    }
}