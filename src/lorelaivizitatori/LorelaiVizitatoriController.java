package lorelaivizitatori;

import java.net.URL;
import java.sql.*;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.application.Platform;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;

public class LorelaiVizitatoriController {

    Connection cnx = null;
    Statement stmt;

    int index = -1;

    @FXML
    private ResourceBundle resources;

    @FXML
    private URL location;

    @FXML
    private Label label;

    @FXML
    private TableView<Vizitator> tabel;

    @FXML
    private TableColumn<Vizitator, Integer> cID;

    @FXML
    private TableColumn<Vizitator, String> cNume;

    @FXML
    private TableColumn<Vizitator, String> cPrenume;

    @FXML
    private TableColumn<Vizitator, String> cEmail;

    @FXML
    private TableColumn<Vizitator, String> cMesaj;

    @FXML
    private TextArea mesaj;

    @FXML
    private TextField nume;

    @FXML
    private TextField prenume;

    @FXML
    private TextField email;

    @FXML
    private Button badauga;

    @FXML
    private Button bmodifica;

    @FXML
    private Button bsterge;

    @FXML
    private Button biesire;

    private String apostrof(String s) {
        return "'" + s + "'";
    }

    @FXML
    void adauga(ActionEvent event) {
        try {
            //  Inserez un nou articol in tabelul Vizitatori
            String cda = "INSERT INTO vizitatori "
                    + "VALUES (null, "
                    + apostrof(nume.getText()) + ", " + apostrof(prenume.getText())
                    + ", " + apostrof(email.getText()) + "," + apostrof(mesaj.getText()) + ")";
            // System.out.println(cda); //  Pt. testare
            // System.out.println(cda); //  Pt. testare
            stmt.executeUpdate(cda);
            //  Preiau cheia primara
            //  Vezi https://dev.mysql.com/doc/connector-j/5.1/en/connector-j-usagenotes-last-insert-id.html
            ResultSet rs = null;
            rs = stmt.executeQuery("SELECT LAST_INSERT_id()");
            int idNou = -1;
            if (rs.next()) {
                idNou = rs.getInt(1);
            }
            //  Creez un obiect Vizitator
            Vizitator v = new Vizitator(idNou, nume.getText(), prenume.getText(), email.getText(), mesaj.getText());
            populez();

            //  Golesc controalele
            nume.setText(null);
            prenume.setText(null);
            email.setText(null);
            mesaj.setText(null);

        } catch (SQLException ex) {
            Logger.getLogger(LorelaiVizitatori.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @FXML
    void iesire(ActionEvent event) {
        try {
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(LorelaiVizitatori.class.getName()).log(Level.SEVERE, null, ex);
        }
        Platform.exit();
    }

    @FXML
    void modifica(ActionEvent event) {
        // Corectez datele in baza de date
        if (index >= 0) {  //  E selectat un vizitator
            Vizitator v = tabel.getItems().get(index);
            int idViz = v.id.get();
            String cda = "UPDATE vizitatori "
                    + "SET nume = " + apostrof(nume.getText())
                    + ", PRENUME = " + apostrof(prenume.getText())
                    + ", EMAIL = " + apostrof(email.getText())
                    + ", Mesaj = " + apostrof(mesaj.getText())
                    + "WHERE id=" + idViz;
            //System.out.println("cda: " + cda); //  Pt. testare
            try {
                stmt.executeUpdate(cda);
            } catch (SQLException ex) {
                Logger.getLogger(LorelaiVizitatori.class.getName()).log(Level.SEVERE, null, ex);
            }
            //  Repopulez tabelul
            populez();
        }
    }

    private void afisez() {

    }

    @FXML
    void sterge(ActionEvent event) {
        if (index >= 0) {  //  E selectat un vizitator
            Vizitator v = tabel.getItems().get(index);
            int idViz = v.id.get();
            try {
                String cda = "DELETE FROM vizitatori WHERE id = " + idViz;
                System.out.println("cda: " + cda); //  Pt. testare
                stmt.executeUpdate(cda);
                //  Repopulez tabelul
                populez();
                //  Golesc controalele
                nume.setText(null);
                prenume.setText(null);
                email.setText(null);
                mesaj.setText(null);
            } catch (SQLException ex) {
                Logger.getLogger(LorelaiVizitatori.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @FXML
    void initialize() {

        cID.setCellValueFactory(cellData -> cellData.getValue().id.asObject());
        cNume.setCellValueFactory(cellData -> cellData.getValue().nume);
        cPrenume.setCellValueFactory(cellData -> cellData.getValue().prenume);
        cEmail.setCellValueFactory(cellData -> cellData.getValue().email);
        cMesaj.setCellValueFactory(cellData -> cellData.getValue().mesaj);

        try {
            Class.forName("com.mysql.jdbc.Driver");
            cnx = DriverManager.getConnection("jdbc:mysql://localhost/lorelai?characterEncoding=utf8", "root", "");
            // Conexiune reusita, se poate accesa baza de date
            System.out.println("Conectare OK.");

            // cnx apartine clasei Connection
            // Conexiune reusita, se poate accesa baza de date
            //  Creez stmt 
            stmt = cnx.createStatement();
            //  Creez multimea de selectie continand datele din 
            //  tabelul vizitatori
            populez();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(LorelaiVizitatori.class
                    .getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(LorelaiVizitatori.class
                    .getName()).log(Level.SEVERE, null, ex);
        }

        tabel.getSelectionModel().selectedIndexProperty().
                addListener((ov, valVeche, valNoua) -> {
                    // Se trateaza schimbarea starii. 
                    // valNoua da pozitia noii valori selectate în tabel
                    index = (int) valNoua;
                    // Pun in controalele TextField informatiile din linie
                    if (index >= 0) {
                        Vizitator a = tabel.getItems().get(index);
                        nume.setText(a.nume.get());
                        prenume.setText(a.prenume.get());
                        email.setText(a.email.get());
                        mesaj.setText(a.mesaj.get());
                    }
                });
    }

    void populez() {
        try {
            tabel.getItems().clear();
            String cda = "select * from vizitatori order by nume";
            ResultSet rs = stmt.executeQuery(cda);
            while (rs.next()) {
                int id = rs.getInt("ID");
                String numeViz = rs.getString("NUME");
                String prenumeViz = rs.getString("PRENUME");
                String email = rs.getString("EMAIL");
                String mesaj = rs.getString("MESAJ");
                //  Creez un obiect din clasa Vizitator
                Vizitator viz = new Vizitator(id, numeViz, prenumeViz, email, mesaj);
                tabel.getItems().add(viz);
            }
        } catch (SQLException ex) {
            Logger.getLogger(LorelaiVizitatori.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
