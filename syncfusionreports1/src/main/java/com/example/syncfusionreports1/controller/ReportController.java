package com.example.syncfusionreports1.controller;


import com.example.syncfusionreports1.model.Report;
import com.example.syncfusionreports1.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/reports")
public class ReportController {
    @Autowired
    private ReportService reportService;

    @GetMapping
    public String listReports(Model model) {
        List<Report> reports = reportService.getAllReports();
        model.addAttribute("reports", reports);
        return "index";  // JSP file
    }

    @PostMapping
    public String createReport(@ModelAttribute Report report) {
        reportService.createReport(report);
        return "redirect:/reports";  // Redirect to the report list
    }

    @GetMapping("/delete/{id}")
    public String deleteReport(@PathVariable String id) {
        reportService.deleteReport(id);
        return "redirect:/reports";  // Redirect to the report list
    }
}

