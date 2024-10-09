package com.example.syncfusionreports1.service;

import com.example.syncfusionreports1.model.Report;
import com.example.syncfusionreports1.repository.ReportRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReportService {
    @Autowired
    private ReportRepository reportRepository;

    public List<Report> getAllReports() {
        return reportRepository.findAll();
    }

    public Report createReport(Report report) {
        return reportRepository.save(report);
    }

    public Report updateReport(Report report) {
        return reportRepository.save(report);
    }

    public void deleteReport(String id) {
        reportRepository.deleteById(id);
    }
}

