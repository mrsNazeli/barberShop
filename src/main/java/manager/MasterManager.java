package manager;

import db.DBConnectionProvider;
import models.Master;

import java.sql.*;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

public class MasterManager {

    private Connection connection;


    public MasterManager() {
        connection = DBConnectionProvider.getInstance().getConnection();

    }

    public void add(Master master) {

        try {
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO `masters`(`name`,`surname`,`image_path`,`profession`) VALUES (?, ?, ?,?)");
            preparedStatement.setString(1, master.getName());
            preparedStatement.setString(2, master.getSurname());
            preparedStatement.setString(3, master.getImagePath());
            preparedStatement.setString(4, master.getProfession());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("error during create statement:" + e);
        }

    }

    public List<Master> getAllMaster() {
        List<Master> result = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM `masters`");
            while (resultSet.next()) {
                Master master = getMasterFromResultSet(resultSet);
                result.add(master);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return result;
    }

    public Master getMasterById(int id) {
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM `masters` where id=?");
            statement.setLong(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return getMasterFromResultSet(resultSet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }

    private Master getMasterFromResultSet(ResultSet resultSet) throws SQLException, ParseException {
        return Master.builder()
                .id(resultSet.getInt(1))
                .name(resultSet.getString(2))
                .surname(resultSet.getString(3))
                .imagePath(resultSet.getString(4))
                .profession(resultSet.getString(5))
                .build();
    }
}
