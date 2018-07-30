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
public class JavaDirection {
    
    public static void main(String args[]) {
      String dirname = "dirs/dirs1/dirs1.1";
      File d = new File(dirname);
      
      // Create directory now.
        System.out.println(d.mkdirs());
   }
    
}
