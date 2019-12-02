package manager;

import db.DBConnectionProvider;
import models.Appointment;

import java.sql.*;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

public class AppointManager {
    private Connection connection;
    private ServicesManager serviceManager;
    private MasterManager masterManager;

    public AppointManager() {
        connection = DBConnectionProvider.getInstance().getConnection();
        serviceManager = new  ServicesManager();
        masterManager = new MasterManager();

    }
    public void add(Appointment appointment) {

        try {
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO appointments(`name`,`time`,`service_id`,`master_id`, `phone_number`,`email`) VALUES (?, ?, ?, ?, ?,?)");
            preparedStatement.setString(1, appointment.getName());
            preparedStatement.setString(2, appointment.getTime());
            preparedStatement.setInt(3, appointment.getService().getId());
            preparedStatement.setInt(4, appointment.getMaster().getId());
            preparedStatement.setString(5, appointment.getPhoneNumber());
            preparedStatement.setString(6, appointment.getEmail());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("error during create statement:" + e);
        }

    }
    public List<Appointment> getAllAppointment() {
        List<Appointment> result = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM appointments");
            while (resultSet.next()) {
                Appointment appointment = getAppointmentFromResultSet(resultSet);
                result.add(appointment);
            }
        } catch (SQLException | ParseException e) {
            e.printStackTrace();
        }
        return result;
    }

    private Appointment getAppointmentFromResultSet(ResultSet resultSet) throws SQLException, ParseException {
        return Appointment.builder()
                .id(resultSet.getInt(1))
                .name(resultSet.getString(2))
                .time(resultSet.getString(3))
                .service(serviceManager.getServiceById(resultSet.getInt(4)))
                .master(masterManager.getMasterById(resultSet.getInt(5)))
                .phoneNumber(resultSet.getString(6))
                .email(resultSet.getString(7))
                .build();
    }
}
