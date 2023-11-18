package com.example.letstravel.Classes;
import com.example.letstravel.DbHelper;
public class Bike {
    String destination,source,date,car;
    DbHelper db;
    public Bike()
    {
        db=new DbHelper();
    }

    public Bike(String destination, String source, String date, String car) {
        this.destination = destination;
        this.source = source;
        this.date = date;
        this.car = car;
    }
    public String getDate() {
        return date;
    }
    public void setDate(String date) {
        this.date = date;
    }
}
