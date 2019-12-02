package models;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Master {
    private int id;
    private  String name;
    private  String surname;
    private String imagePath;
    private String profession;
}
