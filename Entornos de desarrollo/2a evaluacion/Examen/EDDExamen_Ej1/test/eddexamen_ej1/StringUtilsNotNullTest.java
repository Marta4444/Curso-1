/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package eddexamen_ej1;

import java.util.Arrays;
import java.util.Collection;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
import org.junit.runners.Parameterized.Parameters;

/**
 *
 * @author marta.c.lopez
 */
@RunWith(Parameterized.class)
public class StringUtilsNotNullTest {
    
    private String entrada;
    private String resultado;
    
    public StringUtilsNotNullTest(String entrada, String resultado) {
        this.entrada = entrada;
        this.resultado = resultado;
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }
    
    @Parameters
    public static Collection<Object[]> valores(){
        return Arrays.asList(new Object[][]{{"HoLa", "aLoH"}, {"hola que tal", "lat euq aloh"}, 
            {"cañada", "adañac"},{"pastel", "letsap"},{"buenos dias", "said soneub"}});
    }

    /**
     * Test of reverse method, of class StringUtils.
     */
    @Test
    public void testReverse() {
        System.out.println("reverse");
        StringUtils instance = new StringUtils();
        String resReal = instance.reverse(this.entrada);
        String resEsperado = this.resultado;
        assertEquals(resEsperado, resReal);
    }
    
}
