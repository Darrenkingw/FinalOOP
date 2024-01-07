import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class Employee {

    private static final Scanner scanner = new Scanner(System.in);
    public static void addMenu() {
        try {
            Connection connection = JDBC.getConnection();
            if (connection != null) {
                int currentRestaurantId = getRestaurantId();
                
                System.out.println("Masukkan menu baru:");
                System.out.print("Nama Menu: ");
                String menuName = scanner.nextLine();
                System.out.print("Harga Menu: ");
                double menuPrice = scanner.nextDouble();
                
                if (isEmployeeAllowedToManage(currentRestaurantId)) {
                    String insertMenuQuery = "INSERT INTO Menu (restaurantId, menuName, menuPrice) VALUES ('', '', '')";
                    try (PreparedStatement preparedStatement = connection.prepareStatement(insertMenuQuery)) {
                        preparedStatement.setInt(1, currentRestaurantId);
                        preparedStatement.setString(2, menuName);
                        preparedStatement.setDouble(3, menuPrice);
                        int rowsAffected = preparedStatement.executeUpdate();
                        if (rowsAffected > 0) {
                            System.out.println("Menu ter-input");
                        } else {
                            System.out.println("Gagal menginput menu");
                        }
                    }
                } else {
                    System.out.println("Anda tidak diizinkan untuk mengedit cabang ini");
                }
            } else {
                System.out.println("Gagal terhubung");
            }
        } catch (SQLException e) {
            System.err.println("Kesalahan koneksi database: " + e.getMessage());
        }
    }

    public static void addReservation() {
        try {
            Connection connection = JDBC.getConnection();
            if (connection != null) {
                int currentEmployeeId = getEmployeeId();
                int currentRestaurantId = getRestaurantId();
                
                System.out.println("Masukkan reservasi baru:");
                System.out.print("Nama Tamu: ");
                String customerName = scanner.nextLine();
                System.out.print("Jumlah Meja: ");
                int tableCount = scanner.nextInt();
                System.out.print("Tipe Meja (Romantic/General/Family): ");
                String tableType = scanner.next();
                System.out.print("Jumlah Orang: ");
                int numberOfPeople = scanner.nextInt();
                
                if (isEmployeeAllowedToManage(currentRestaurantId)) {
                    String insertReservationQuery = "INSERT INTO Reservation (employeeId, customerName, tableCount, tableType, numberOfPeople, reservationStatus) VALUES ('', '', '', '', '', '')";
                    try (PreparedStatement preparedStatement = connection.prepareStatement(insertReservationQuery)) {
                        preparedStatement.setInt(1, currentEmployeeId);
                        preparedStatement.setString(2, customerName);
                        preparedStatement.setInt(3, tableCount);
                        preparedStatement.setString(4, tableType);
                        preparedStatement.setInt(5, numberOfPeople);
                        preparedStatement.setString(6, "in reserve");
                        int rowsAffected = preparedStatement.executeUpdate();
                        if (rowsAffected > 0) {
                            System.out.println("Reservasi berhasil");
                        } else {
                            System.out.println("Gagal menambahkan reservasi");
                        }
                    }
                } else {
                    System.out.println("Anda tidak diizinkan untuk mengedit cabang ini");
                }
            } else {
                System.out.println("Gagal terhubung");
            }
        } catch (SQLException e) {
            System.err.println("Kesalahan koneksi database: " + e.getMessage());
        }
    }

    private static int getRestaurantId() {
        return 1;
    }

    private static int getEmployeeId() {
        return 1;
    }


    private static boolean isEmployeeAllowedToManage(int currentRestaurantId) {
        int employeeId = getEmployeeId();
        return (employeeId == 1 && currentRestaurantId == 1);
    }

    public static void main(String[] args) {
        addMenu();
        addReservation();
    }
}