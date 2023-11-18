package com.example.letstravel.Classes;
import com.example.letstravel.DbHelper;
public class Bookings {
    public String heading;
    public String time;
    DbHelper db;
    public Bookings(){
        db=new DbHelper();
    }
    public Bookings(String name,  String time){
        this.heading=name;

        this.time=time;
    }
    public String getHeading(){
        return this.heading;
    }

    public String getTime(){
        return this.time;
    }

    public void insert(String type1,String date)
    {
        db.myBookings(type1,date);
    }
}
