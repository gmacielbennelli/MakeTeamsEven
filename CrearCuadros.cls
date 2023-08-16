public class CrearCuadros {
    
    @Auraenabled(cacheable=true)   
    public static List<List<Persona__c>> devolverEquiposParejos(){
        
        List<List<Persona__c>> equiposParejos = corroborarParidad(); // listas vacias o cuadros parejos.
         
         while(equiposParejos.isEmpty()) {
            equiposParejos = corroborarParidad();
        }
        
         return equiposParejos;
    }
    
    
    public static List<List<Persona__c>> corroborarParidad() {
        
        List<List<Persona__c>> cuadrosCreados = crearRandomCuadros();
        List<Persona__c> equipoA = cuadrosCreados[0]; 
        List<Persona__c> equipoB = cuadrosCreados[1]; 
        decimal sumaPuntajeA = 0;
        decimal sumaPuntajeB = 0;
        
        for(Persona__c p : equipoA) {
            sumaPuntajeA += p.Puntaje__c;
        }
          for(Persona__c p : equipoB) {
            sumaPuntajeB += p.Puntaje__c;
        }
        
        decimal dPuntAyB = sumaPuntajeA/sumaPuntajeB;
        
        if( dPuntAyB >= 0.9 && dPuntAyB <= 1.1 ) { 
            
           return cuadrosCreados; //si entra al if es porque ya de una encontro los cuadros parejos y termina la funcion.
        }
           cuadrosCreados.clear(); //si no entra, entonces vacío la lista de cuadros desparejos.
        
        return cuadrosCreados; // en este caso retorna lista vacia.
    }

    
    public static List<List<Persona__c>> crearRandomCuadros() { 
        
        List<Persona__c> listaPersonas = [select Puntaje__c	,Posicion__c,Name from Persona__c limit 10];
        List<Persona__c> equipoA = new List<Persona__c>();
        List<Persona__c> equipoB = new List<Persona__c>();
        List<Persona__c> equipoCompleto = new List<Persona__c>();
        List<List<Persona__c>> equiposFinales = new List<List<Persona__c>>();
      
        while(equipoCompleto.size() < 10) {
            
        Integer randomNumber = Integer.valueof((Math.random() * 10));
            
           if(!equipoCompleto.contains(listaPersonas[randomNumber])) {
               
           equipoCompleto.add(listaPersonas[randomNumber]);  
      }   
    }
        
        for(integer i=0 ; i<10; i++) {
            
            if(i<5) {
                equipoA.add(equipoCompleto[i]);
               }
            
            else {
                 equipoB.add(equipoCompleto[i]);
            }
          }
        
        equiposFinales.add(equipoA);
        equiposFinales.add(equipoB);
        
        return equiposFinales;
        
    }
  }