package com.example.letstravel.Classes;
import com.example.letstravel.DbHelper;
import java.util.Calendar;
import java.util.Date;

public class UserLog {
    public String heading;
    public String time;
    DbHelper db;
    public UserLog(){
        db=new DbHelper();
    }
    public UserLog(String name, String time){
        this.heading=name;

        this.time=time;
    }
    public String getHeading(){
        return this.heading;
    }

    public String getTime(){
        return this.time;
    }

    public void insert(String type1)
    {
        Date d= Calendar.getInstance().getTime();
        String date= d.toString().trim();
        db.DbNotifications(type1,date);
    }
}
