package fact.it.userservice.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Entity
@Table(name = "users")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String emailAddress;
    private String firstName;
    private String lastName;
    private String countryName;
    private String postalCode;
    private String addressLine;
    private String hashPassw;
    @OneToMany(cascade = CascadeType.ALL)
    private List<Role> roleList;
}
