import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;

public class TimeServer {

    public static void main(String[] args) {
        int serverPort = 12345; // Change this to the desired server port

        try (DatagramSocket serverSocket = new DatagramSocket(serverPort)) {
            System.out.println("Time server is running...");

            while (true) {
                byte[] receiveBuffer = new byte[1024];
                DatagramPacket receivePacket = new DatagramPacket(receiveBuffer, receiveBuffer.length);
                serverSocket.receive(receivePacket);

                String timeZone = new String(receivePacket.getData(), 0, receivePacket.getLength());
                System.out.println("Received request for time in time zone: " + timeZone);

                LocalDateTime now = LocalDateTime.now();
                ZoneId requestedZoneId = ZoneId.of(timeZone);
                ZonedDateTime zonedDateTime = now.atZone(ZoneId.systemDefault()).withZoneSameInstant(requestedZoneId);

                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                String serverTime = zonedDateTime.format(formatter);

                byte[] sendBuffer = serverTime.getBytes();
                InetAddress clientAddress = receivePacket.getAddress();
                int clientPort = receivePacket.getPort();
                DatagramPacket sendPacket = new DatagramPacket(sendBuffer, sendBuffer.length, clientAddress,
                        clientPort);

                serverSocket.send(sendPacket);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
