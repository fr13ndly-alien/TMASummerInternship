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
public class ListDir {
    public static void main(String[] args) {
        File file = null;
        String[] paths;

        try {      
            // create new file object
            file = new File("dirs");
            // array of files and directory
            paths = file.list();

            // for each name in the path array
            for(String path:paths) {
             // prints filename and directory name
             System.out.println(path);
            }
        } catch (Exception e) {
            // if any error occurs
            e.printStackTrace();
        }
   }
}
