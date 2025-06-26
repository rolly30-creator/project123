import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class HttpdServiceMonitor {

    public static void main(String[] args) {
        try {
            // Check httpd status
            if (isHttpdRunning()) {
                System.out.println("httpd service is running.");
            } else {
                System.out.println("httpd service is NOT running. Attempting to start...");

                // Attempt to start httpd
                if (startHttpd()) {
                    System.out.println("httpd service started successfully.");
                } else {
                    System.out.println("Failed to start httpd service.");
                }
            }
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
    }

    private static boolean isHttpdRunning() throws IOException, InterruptedException {
        ProcessBuilder pb = new ProcessBuilder("systemctl", "is-active", "--quiet", "httpd");
        Process process = pb.start();
        int exitCode = process.waitFor();
        return exitCode == 0; // 0 means service is active
    }

    private static boolean startHttpd() throws IOException, InterruptedException {
        ProcessBuilder pb = new ProcessBuilder("sudo", "systemctl", "start", "httpd");
        pb.inheritIO(); // For sudo password input/output visibility
        Process process = pb.start();
        int exitCode = process.waitFor();
        return exitCode == 0;
    }
}
