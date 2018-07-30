/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javadirection;
import java.io.File;
/**
 *
 * @author Huu Hien
 */
public class MyFiles {
    
    public static void main(String[] args) {
        File myFile = new File("myFile.txt");
        myFile.mkdir();
    }
}
