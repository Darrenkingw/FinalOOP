import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBC {
    private static final String 
    JDBC_URL = 
    "jdbc:mysql://http://localhost/phpmyadmin/index.php?route=/database/structure&db=restomanagement";

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(JDBC_URL);
    }

    public static void main(String[] args){
        }
    }