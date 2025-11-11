package com.devcalc;

import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/")
public class CalculatorController {

    private final CalculatorService service;

    public CalculatorController(CalculatorService service) {
        this.service = service;
    }

    @GetMapping("add")
    public double add(@RequestParam double a, @RequestParam double b) {
        return service.add(a, b);
    }

    @GetMapping("subtract")
    public double subtract(@RequestParam double a, @RequestParam double b) {
        return service.subtract(a, b);
    }

    @GetMapping("multiply")
    public double multiply(@RequestParam double a, @RequestParam double b) {
        return service.multiply(a, b);
    }

    @GetMapping("divide")
    public double divide(@RequestParam double a, @RequestParam double b) {
        return service.divide(a, b);
    }
}
