package com.example.letstravel.Classes;
import com.example.letstravel.DbHelper;
public class Bus {

    String destination;
    String source;
    String service;
    String seat;
    String date;
    DbHelper db;
    public Bus()
    {
         db=new DbHelper();
    }
    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
    public void insert(String type,String from1,String to1,String seat1,String date1,String service)
    {
        db.insertBusBookings(type,from1,to1,seat1,date1,service);
    }
}
