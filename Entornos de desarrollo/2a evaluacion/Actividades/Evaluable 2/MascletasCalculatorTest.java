/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package evaluable2edd;

import java.time.LocalTime;
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
public class MascletasCalculatorTest {
    
    private LocalTime horaInicio;
    private LocalTime horaFin;
    private int intensidadSonido;
    private int duracionFuegosArtificiales;
    private int duracion;
    
    public MascletasCalculatorTest(LocalTime horaInicio, LocalTime horaFin, int intensidadSonido, int duracionFuegosArtificiales, int duracion){
        this.horaInicio = horaInicio;
        this.horaFin = horaFin;
        this.intensidadSonido = intensidadSonido;
        this.duracionFuegosArtificiales = duracionFuegosArtificiales;
        this.duracion = duracion;
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
    public static Collection<Object[]> opciones(){
        return Arrays.asList(new Object[][]{{LocalTime.of(13, 0), LocalTime.of(13,15), 3, 5, 26},
        {LocalTime.of(23,15), LocalTime.of(23,45), 5, 10, 50},
        {LocalTime.of(14,30), LocalTime.of(15,0), 5, 10, 50}, 
        {LocalTime.of(12,0), LocalTime.of(13,0), 0, 0, 60}, 
        {LocalTime.of(0,0), LocalTime.of(0,0), 0, 0, 0}});
    }
    
    
    
    @Test
    public void testCalcularduracionMascleta() {
        System.out.println("calcularduracionMascleta");
        
        MascletasCalculator instance = new MascletasCalculator();
        int expResult = this.duracion;
        int result = instance.calcularduracionMascleta(horaInicio, horaFin, intensidadSonido, duracionFuegosArtificiales);
        assertEquals(expResult, result);
                
    }

    
    
}
