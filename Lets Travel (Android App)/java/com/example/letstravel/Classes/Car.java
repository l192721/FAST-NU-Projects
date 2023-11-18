package com.example.letstravel.Classes;
import com.example.letstravel.DbHelper;
public class Car {
    String destination,source,date,car;
    DbHelper db;
    public Car()
    {
        db=new DbHelper();
    }
    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
    public void insert(String type,String from1,String to1,String car1,String date1)
    {
        db.insertCarBookings(type,from1,to1,car1,date1);
    }
}
