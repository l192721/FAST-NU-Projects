import javax.swing.*;
import javax.swing.*;
import java.awt.*;
import java.io.*;
import java.net.*;
import java.time.*;
import java.time.format.*;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import javax.sound.sampled.*;

public class ClockApp {
    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> createAndShowGUI());
    }

    private static void createAndShowGUI() {
        JFrame frame = new JFrame("Clock App");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        ClockPanel clockPanel = new ClockPanel();
        frame.add(clockPanel);

        frame.pack();
        frame.setVisible(true);
    }

    private static class ClockPanel extends JPanel {
        private JLabel timeLabel;
        private JButton setAlarmButton;
        private LocalDateTime alarmTime;
        private JButton setTimerButton;
        private java.util.List<TimerInfo> timers;
        private int SnoozeCount;
        private JButton setTimezoneButton;
        private String timeZone;
        private ArrayList<String> tones;

        public ClockPanel() {
            tones=new ArrayList<String>();
            SnoozeCount = 2;
            timers = new ArrayList<>();
            timeZone = "Asia/Karachi"; // Set default time zone to Pakistan

            setLayout(new GridBagLayout());

            timeLabel = new JLabel();
            timeLabel.setFont(new Font("Monospaced", Font.BOLD, 24));

            setTimerButton = new JButton("Add a Timer");
            setTimerButton.addActionListener(f -> setTimer());

            setAlarmButton = new JButton("Add an Alarm");
            setAlarmButton.addActionListener(e -> setAlarm());

            setTimezoneButton = new JButton("Set Time Zone");
            setTimezoneButton.addActionListener(g -> setTimezone());

            GridBagConstraints constraints = new GridBagConstraints();
            constraints.gridx = 0;
            constraints.gridy = 0;

            add(timeLabel, constraints);
            updateClock();

            constraints.gridy = 1;
            add(setTimerButton, constraints);
            constraints.gridy = 2;
            add(setAlarmButton, constraints);
            constraints.gridy = 3;
            add(setTimezoneButton, constraints);

            Timer timer = new Timer(1000, f -> updateClock());
            timer.start();
        }

        private void setTimezone() {
            String input = JOptionPane.showInputDialog("Enter time zone (e.g., America/New_York):");
            try {
                ZoneId.of(input); // Check if the input is a valid time zone
                timeZone = input;
                JOptionPane.showMessageDialog(this, "Time zone set to: " + input);
            } catch (DateTimeException e) {
                JOptionPane.showMessageDialog(this, "Invalid time zone. Please enter a valid time zone.");
            }
        }

        private LocalDateTime getTimeFromServer() {
            int serverPort = 12345; // Change this to the port your server is listening on
            String serverHost = "localhost"; // Change this to the server's IP address or hostname

            try (DatagramSocket socket = new DatagramSocket()) {
                byte[] sendBuffer = timeZone.getBytes();
                InetAddress serverAddress = InetAddress.getByName(serverHost);
                DatagramPacket sendPacket = new DatagramPacket(sendBuffer, sendBuffer.length, serverAddress,
                        serverPort);

                socket.send(sendPacket);

                byte[] receiveBuffer = new byte[1024];
                DatagramPacket receivePacket = new DatagramPacket(receiveBuffer, receiveBuffer.length);
                socket.receive(receivePacket);

                String serverTime = new String(receivePacket.getData(), 0, receivePacket.getLength());
                return LocalDateTime.parse(serverTime, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
            } catch (IOException e)
            {
                JOptionPane.showMessageDialog(this, "Run the Timing Server !!!");
                return null;
            }
        }

        private void updateClock() {
            LocalDateTime now = getTimeFromServer();
            if (now == null) {
                now = LocalDateTime.now();
            }
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            String timeText = now.format(formatter);
            timeLabel.setText(timeText);

            // Remaining code for updateClock()
            checkTimers(now); // Checking Timers

            // Chhecking Alarms
            if (alarmTime != null
                    && now.truncatedTo(ChronoUnit.SECONDS).isEqual(alarmTime.truncatedTo(ChronoUnit.SECONDS))) {
                playAlarmSound();

                if (SnoozeCount > 0) // In case SnoozeCounts are zero. No option to snooze the alarm shall be
                                     // provided.
                {
                    int reply = JOptionPane.showConfirmDialog(null, "Do you want to snooze the alarm ?", "Close?",
                            JOptionPane.YES_NO_OPTION);
                    if (reply == JOptionPane.YES_OPTION) {
                        SnoozeCount--;
                        alarmTime = alarmTime.plusSeconds(30);
                        JOptionPane.showMessageDialog(this, "Alarm snoozed for 20 Seconds !!! ");
                    } else
                        SnoozeCount = 2;
                }
            }
        }

        // Remaining code for ClockPanel class
        private void setAlarm() {
            String input = JOptionPane.showInputDialog("Enter alarm time in the format 'yyyy-MM-dd HH:mm:ss'");
            try {
                alarmTime = LocalDateTime.parse(input, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
                JOptionPane.showMessageDialog(this, "Alarm set for: " + input);

                String ip = JOptionPane.showInputDialog("Enter alarm tone name:");
                for (int i=0;i<tones.size();i++)
                    {
                        if (tones.get(i)==ip)
                        {
                            JOptionPane.showMessageDialog(this, "Tone choosen for Alarm: " + ip);
                            return;
                        }
                    }
                    JOptionPane.showMessageDialog(this, "Invalid Tone entered. Choosen Default tone.");

            } catch (DateTimeParseException e) {
                JOptionPane.showMessageDialog(this, "Invalid input. Please use the format 'yyyy-MM-dd HH:mm:ss'");
            }
        }

        private void playAlarmSound() {
            try {
                // System.out.println("Playing sound");
                File soundFile = new File("./alarm.wav");
                AudioInputStream audioInputStream = AudioSystem.getAudioInputStream(soundFile);
                Clip clip = AudioSystem.getClip();
                clip.open(audioInputStream);
                clip.start();
            } catch (UnsupportedAudioFileException | IOException | LineUnavailableException e) {
                e.printStackTrace();
            }
        }

        private void setTimer() {
            LocalDateTime curr = getTimeFromServer();
            String input = JOptionPane.showInputDialog("Enter timer duration in seconds:");
            try {
                int durationInSeconds = Integer.parseInt(input);
                TimerInfo timerInfo = new TimerInfo(curr.plusSeconds(durationInSeconds));
                timers.add(timerInfo);
                JOptionPane.showMessageDialog(this, "Timer set for " + durationInSeconds + " seconds.");
            } catch (NumberFormatException e) {
                JOptionPane.showMessageDialog(this, "Invalid input. Please enter a number.");
            }
        }

        private void checkTimers(LocalDateTime now) {
            try {
                timers.removeIf(timerInfo -> {
                    if (now.isEqual(timerInfo.endTime) || now.isAfter(timerInfo.endTime)) {
                        try {
                            // System.out.println("Playing sound");
                            File soundFile = new File("./timer.wav");
                            AudioInputStream audioInputStream = AudioSystem.getAudioInputStream(soundFile);
                            Clip clip = AudioSystem.getClip();
                            clip.open(audioInputStream);
                            clip.start();
                        } catch (UnsupportedAudioFileException | IOException | LineUnavailableException e) {
                            e.printStackTrace();
                        }
                        JOptionPane.showMessageDialog(this, "Timer has expired!");
                        return true;
                    }
                    return false;
                });
            } catch (Exception e) {
                JOptionPane.showMessageDialog(this, "NUll array Exception in this line !!!");
            }
        }
    }

    // Remaining code for ClockApp class
    private static class TimerInfo {
        private LocalDateTime endTime;

        public TimerInfo(LocalDateTime endTime) {
            this.endTime = endTime;
        }
    }
}