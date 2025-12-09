package com.devcalc;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class CalculatorServiceTest {

    private final CalculatorService service = new CalculatorService();

    @Test
    void testAdd() {
        assertEquals(8.0, service.add(5, 3));
    }

    @Test
    void testSubtract() {
        assertEquals(2.0, service.subtract(5, 3));
    }

    @Test
    void testMultiply() {
        assertEquals(15.0, service.multiply(5, 3));
    }

    @Test
    void testDivide() {
        assertEquals(2.0, service.divide(6, 3));
    }

    @Test
    void testDivideByZero() {
        Exception exception = assertThrows(IllegalArgumentException.class, () -> service.divide(10, 0));
        assertEquals("Divisão por zero não é permitida", exception.getMessage());
    }
}
