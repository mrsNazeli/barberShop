package manager;

import db.DBConnectionProvider;

import models.Service;

import java.sql.*;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

public class ServicesManager {

    private Connection connection;


    public ServicesManager() {
        connection = DBConnectionProvider.getInstance().getConnection();

    }

    public void add(Service service) {

        try {
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO `services`(`name`,`description`,`image_path`,`price`) VALUES (?, ?, ?,?)");
            preparedStatement.setString(1, service.getName());
            preparedStatement.setString(2, service.getDescription());
            preparedStatement.setString(3, service.getImagePath());
            preparedStatement.setDouble(4, service.getPrice());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("error during create statement:" + e);
        }

    }

    public List<Service> getAllService() {
        List<Service> result = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery( "SELECT * FROM `services`" );
            while (resultSet.next()) {
                Service service = getServiceFromResultSet(resultSet);
                result.add(service);
            }
        } catch (SQLException | ParseException e) {
            e.printStackTrace();
        }
        return result;
    }


    public Service getServiceById(int id) {
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM `services` where id=?");
            statement.setLong(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return getServiceFromResultSet(resultSet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }

    private Service getServiceFromResultSet(ResultSet resultSet) throws SQLException, ParseException {
        return Service.builder()
                .id(resultSet.getInt(1))
                .name(resultSet.getString(2))
                .description(resultSet.getString(3))
                .imagePath(resultSet.getString(4))
                .price(resultSet.getDouble(5))
                .build();
    }
}
