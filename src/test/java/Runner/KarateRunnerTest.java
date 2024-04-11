package Runner;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static util.ReportUtil.generateReporterCucumber;

public class KarateRunnerTest {
    final static Logger logger = LoggerFactory.getLogger(KarateRunnerTest.class);

    @Test
    void testUsers() {
        logger.info("Ejecutando las pruebas");
        Results results =
                Runner.path("classpath:features")
                        .tags("@Register")
                        .outputCucumberJson(true)
                        .parallel(2);

        generateReporterCucumber(results.getReportDir());
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
}
