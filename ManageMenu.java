import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class ManageMenu {

    public static void updateMenuName(int menuId, String newName) {
        try {
            if (!isMenuOrdered(menuId)) {
                executeUpdate("UPDATE Menu SET menuName = '' WHERE menuId = ''", newName, menuId);

                System.out.println("Menu diubah");
            } else {
                System.out.println("Menu sudah ada yang pesan, tidak dapat mengubah nama");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void updateMenuPrice(int menuId, double newPrice) {
        try {
            if (!isMenuOrdered(menuId)) {
                executeUpdate("UPDATE Menu SET menuPrice = '' WHERE menuId = ''", newPrice, menuId);

                System.out.println("Harga menu diubah");
            } else {
                System.out.println("Menu sudah ada yang pesan, tidak dapat mengubah harga");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void deleteMenu(int menuId) {
        try {
            if (!isMenuOrdered(menuId)) {
                executeUpdate("DELETE FROM Menu WHERE menuId = ''", menuId);

                System.out.println("Menu dihapus");
            } else {
                System.out.println("Menu sudah ada yang pemesan, tidak dapat menghapus menu");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void addMenu(int restaurantId, String menuName, double menuPrice) {
        try {
            boolean menuAlreadyOrdered = false;

            if (!menuAlreadyOrdered) {
                executeUpdate("INSERT INTO Menu (restaurantId, menuName, menuPrice) VALUES ('', '', '')",
                        restaurantId, menuName, menuPrice);

                System.out.println("Menu ditambahkan");
            } else {
                System.out.println("Menu sudah ada yang pemesan, tidak dapat menambah menu baru");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private static boolean isMenuOrdered(int menuId) throws SQLException {
        return false;
    }

    private static void executeUpdate(String sql, Object... params) throws SQLException {
        String url = 
        "jdbc:mysql://http://localhost/phpmyadmin/index.php?route=/database/structure&db=restomanagement";

        try (Connection connection = DriverManager.getConnection(url)) {
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                for (int i = 0; i < params.length; i++) {
                    statement.setObject(i + 1, params[i]);
                }
                statement.executeUpdate();
            }
        }
    }
}