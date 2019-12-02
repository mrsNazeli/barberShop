package db;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DBConnectionProvider {

    private static DBConnectionProvider ourInstance = new DBConnectionProvider();
    private Connection connection = null;

    private static String dbUrl;
    private static String dbUsername;
    private static String dbPassword;

    private DBConnectionProvider() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            loadProperties();
        } catch (ClassNotFoundException e) {
            System.err.print("error when loading sql driver" + e);
        } catch (IOException e) {
            System.err.print("error when loading properties for sql " + e);
        }

    }

    private void loadProperties() throws IOException {
        Properties properties = new Properties();
        properties.load(new FileInputStream("D:\\BarberShop\\src\\main\\resources\\dbConf.properties"));
        dbUrl = properties.getProperty("db.url");
        dbUsername = properties.getProperty("db.username");
        dbPassword = properties.getProperty("db.password");
    }

    public Connection getConnection() {
        if (connection == null) {
            try {
                connection = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
            } catch (SQLException e) {
                System.out.println("error while creating connection: " + e);
            }
        }
        return connection;
    }

    public static DBConnectionProvider getInstance() {
        return ourInstance;
    }

}
