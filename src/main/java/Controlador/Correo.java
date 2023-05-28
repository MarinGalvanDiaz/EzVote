package Controlador;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
public class Correo {

    private String host;
    private String port;
    private String username;
    private String password;
    private boolean sslEnabled;

    public Correo(String host, String port, String username, String password, boolean sslEnabled) {
        this.host = host;
        this.port = port;
        this.username = username;
        this.password = password;
        this.sslEnabled = sslEnabled;
    }

    public void sendEmail(String to, String subject, String message) throws Exception {
        Properties properties = new Properties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", port);
        properties.put("mail.smtp.auth", "true");

        if (sslEnabled) {
            properties.put("mail.smtp.socketFactory.port", port);
            properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        }

        Session session = Session.getInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        Message mimeMessage = new MimeMessage(session);
        mimeMessage.setFrom(new InternetAddress(username));
        mimeMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
        mimeMessage.setSubject(subject);
        mimeMessage.setText(message);

        Transport.send(mimeMessage);
    }
   
    
}
