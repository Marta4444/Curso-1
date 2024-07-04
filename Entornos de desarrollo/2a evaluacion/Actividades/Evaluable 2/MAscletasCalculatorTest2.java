
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
public class MAscletasCalculatorTest2 {
    
    private LocalTime horaInicio;
    private LocalTime horaFin;
    private int intensidadSonido;
    private int duracionFuegosArtificiales;
    private int duracionTotal;
    
    //Para que se acumule el valor de la duracion de las sucesivas llamadas a calcularduracionMascleta()
    private static MascletasCalculator instance; 
    
    
    public MAscletasCalculatorTest2(LocalTime horaInicio, LocalTime horaFin, int intensidadSonido, int duracionFuegosArtificiales, int duracionTotal){
        this.horaInicio = horaInicio;
        this.horaFin = horaFin;
        this.intensidadSonido = intensidadSonido;
        this.duracionFuegosArtificiales = duracionFuegosArtificiales;
        
        this.duracionTotal = duracionTotal;
    }
    
   
    
    @BeforeClass
    public static void setUpClass() {
        
        instance = new MascletasCalculator(); 
        
        /*Sólo se instancia un objeto y se hacen sucesivas llamadas el método calcularduracionMascleta()
        para acumular el valor de duracion de cada llamada en la variable duracionTotal. De lo
        contrario, el valor de duracionTotal se restablece a 0 con cada test de la prueba
        parametrizada.
        */
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
        {LocalTime.of(23,15), LocalTime.of(23,45), 5, 10, 76},
        {LocalTime.of(14,30), LocalTime.of(15,0), 5, 10, 126}, 
        {LocalTime.of(12,0), LocalTime.of(13,0), 0, 0, 186}, 
        {LocalTime.of(0,0), LocalTime.of(0,0), 0, 0, 186}});
    }
    
   
    @Test
    public void testGetDuracionTotal() {
        System.out.println("getDuracionTotal");
                      
        instance.calcularduracionMascleta(this.horaInicio, this.horaFin, this.intensidadSonido, this.duracionFuegosArtificiales);
               
        assertEquals(this.duracionTotal, instance.getDuracionTotal());
    }
    
}


