package bean.java;

public class User {
    private int id;
    private String name;
    private String email;
    private String password;
    private String role;

    // ✅ Getter
    public String getName() {
        return name;
    }

    // ✅ Setter - fixed
    public void setName(String name) {
        this.name = name;
    }

    // Other getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
