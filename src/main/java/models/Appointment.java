package models;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Appointment {
    private int id;
    private Master master;
    private String name;
    private String phoneNumber;
    private String email;
    private Service service;
    private String time;

}
