package com.example.letstravel.Classes;
import com.example.letstravel.DbHelper;
public class Hotel {
    String hotel,date,rooms,days,city;
    DbHelper db;
    public Hotel()
    {
        db=new DbHelper();
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public void insert(String type,String city1,String hotel1,String day1,String date1,String room1)
    {
        db.insertHotelBookings(type,city1,hotel1,day1,date1, room1);
    }
}

