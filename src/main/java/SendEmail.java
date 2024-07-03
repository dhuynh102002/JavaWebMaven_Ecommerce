
import com.mycompany.model.UserModel;
import com.mycompany.service.impl.UserService;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author ASUS
 */
public class SendEmail {

    public static void main(String[] args) {
        UserService userService = new UserService();
        UserModel userModel = userService.findOne("truongdiemhuynh1@gmail.com");
        userModel.setPassword("12345678");
        System.out.println("User: " + userModel.toString());
        userModel = userService.updateUser(userModel);
        System.out.println("User After Update: " + userModel.toString());
    }
}
