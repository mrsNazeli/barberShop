package models;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Service {
    private int id;
    private String name;
    private String description;
    private String imagePath;
    private double price;
}
