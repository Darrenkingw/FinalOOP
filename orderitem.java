import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class orderitem {

    public static void processOrder(int reservationId, int menuId, int quantity) {
        try {
            if (isReservationInReserve(reservationId)) {
                updateReservationStatus(reservationId, "In Order");
                addMenuToOrder(reservationId, menuId, quantity);

                System.out.println("Pesanan diubah menjadi 'In Order' dan menu ditambahkan");
            } else {
                System.out.println("Pesanan tidak dalam status 'In Reserve'");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void checkout(int reservationId) {
        try {
            if (isReservationInOrder(reservationId)) {
                updateReservationStatus(reservationId, "Finalized");
                displayBill(reservationId);

                System.out.println("Checkout, Pesanan selesai");
            } else {
                System.out.println("Pesanan tidak dalam status 'In Order'");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private static boolean isReservationInReserve(int reservationId) throws SQLException {
        return true;
    }

    private static boolean isReservationInOrder(int reservationId) throws SQLException {
        return true;
    }

    private static void updateReservationStatus(int reservationId, String status) throws SQLException {
        String url = 
        		"jdbc:mysql://http://localhost/phpmyadmin/index.php?route=/database/structure&db=restomanagement";

        try (Connection connection = DriverManager.getConnection(url)) {
            String sql = "UPDATE Reservation SET reservationStatus = '' WHERE reservationId = ''";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, status);
                statement.setInt(2, reservationId);
                statement.executeUpdate();
            }
        }
    }

    private static void addMenuToOrder(int reservationId, int menuId, int quantity) throws SQLException {
    }

    private static void displayBill(int reservationId) throws SQLException {
    }
}