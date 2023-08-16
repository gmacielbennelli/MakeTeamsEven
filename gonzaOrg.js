import { LightningElement, wire } from 'lwc';
import crearCuadros from '@salesforce/apex/CrearCuadros.devolverEquiposParejos'


export default class GonzaOrg extends LightningElement {

    teamA;
    teamB;

  

      refreshComponent(event){
        eval("$A.get('e.force:refreshView').fire();");
    }


   

    @wire(crearCuadros)
    crearCuadros({ data, error }) {
        if (data) {
            console.log(data);
            this.teamA = data[0];
            this.teamB = data[1];
            this.error = undefined;
        } else if (error) {
            // console.log(error); 
            this.error = error;
        }
    }
    

}