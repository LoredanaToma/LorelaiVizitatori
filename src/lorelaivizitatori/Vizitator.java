/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lorelaivizitatori;

import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleStringProperty;

public class Vizitator {

    SimpleIntegerProperty id;
    SimpleStringProperty nume;
    SimpleStringProperty prenume;
    SimpleStringProperty email;
    SimpleStringProperty mesaj;
    
    public Vizitator(int id, String nume, String prenume, String email, String mesaj) {
   this.id = new SimpleIntegerProperty(id);
   this.nume = new SimpleStringProperty(nume);
   this.prenume = new SimpleStringProperty(prenume);
   this.email = new SimpleStringProperty(email);
   this.mesaj = new SimpleStringProperty(mesaj);
}
}