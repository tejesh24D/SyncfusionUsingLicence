package com.example.syncfusionreports1.repository;


import com.example.syncfusionreports1.model.Report;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface ReportRepository extends MongoRepository<Report, String> {
}
