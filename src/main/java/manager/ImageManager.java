package manager;

import db.DBConnectionProvider;
import models.Img;

import java.sql.*;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

public class ImageManager {
    private static String ADD = "INSERT INTO image(`image_path`) VALUES (?)";
    private static String GEL_ALL_IMAGE = "SELECT * FROM image";

    private Connection connection;

    public ImageManager() {
        connection = DBConnectionProvider.getInstance().getConnection();
    }

    public void add(Img image) {

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(ADD);
            preparedStatement.setString(1, image.getImgPath());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("error during create statement:" + e);
        }
    }
    public List<Img> getAllImage() {
        List<Img> result = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(GEL_ALL_IMAGE);
            while (resultSet.next()) {
                Img image = getMasterFromResultSet(resultSet);
                result.add(image);
            }
        } catch (SQLException | ParseException e) {
            e.printStackTrace();
        }
        return result;
    }

    private Img getMasterFromResultSet(ResultSet resultSet) throws SQLException, ParseException {
        return Img.builder()
                .imgPath(resultSet.getString(1))
                .build();
    }
}

