
package eddexamen_ej1;

/**
 *
 * @author marta.c.lopez
 */
public class StringUtils {
    
    public static String reverse(String str){
        
        if (str == null){
            return null;
        }
        
        StringBuilder reversed = new StringBuilder(str).reverse();
        return reversed.toString();
    }
    
}
