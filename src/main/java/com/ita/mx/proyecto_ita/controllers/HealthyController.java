package com.ita.mx.proyecto_ita.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/healthy")
public class HealthyController {
    @GetMapping("/check")
    public String check() {
        return "I'm alive!";
    }
}
