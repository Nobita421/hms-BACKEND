package com.klu.hospital;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

@SpringBootTest
@ActiveProfiles("test")
class HospitalApplicationTests {

    @Test
    void contextLoads() {
        // verifies that the Spring context can start
    }
}
