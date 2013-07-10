/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package view;

import java.util.regex.Pattern;
import java.util.regex.Matcher;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import model.Exemplar;
import model.ExemplarPK;
import view.ExemplarFacade;

/**
 *
 * @author Mikaele
 */
public class ExemplarConverter implements Converter {

    public Object getAsObject(FacesContext facesContext, UIComponent component, String string) {
        if (string == null || string.length() == 0) {
            return null;
        }
        ExemplarPK id = getId(string);
        ExemplarController controller = (ExemplarController) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "exemplar");
        return controller.getJpaController().find(id);
    }

    ExemplarPK getId(String string) {
        ExemplarPK id = new ExemplarPK();
        String[] params = new String[2];
        int p = 0;
        int grabStart = 0;
        String delim = "#";
        String escape = "~";
        Pattern pattern = Pattern.compile(escape + "*" + delim);
        Matcher matcher = pattern.matcher(string);
        while (matcher.find()) {
            String found = matcher.group();
            if (found.length() % 2 == 1) {
                params[p] = string.substring(grabStart, matcher.start());
                p++;
                grabStart = matcher.end();
            }
        }
        if (p != params.length - 1) {
            throw new IllegalArgumentException("string " + string + " is not in expected format. expected 2 ids delimited by " + delim);
        }
        params[p] = string.substring(grabStart);
        for (int i = 0; i < params.length; i++) {
            params[i] = params[i].replace(escape + delim, delim);
            params[i] = params[i].replace(escape + escape, escape);
        }
        id.setNumero(Integer.parseInt(params[0]));
        id.setIsbn(params[1]);
        return id;
    }

    public String getAsString(FacesContext facesContext, UIComponent component, Object object) {
        if (object == null) {
            return null;
        }
        if (object instanceof Exemplar) {
            Exemplar o = (Exemplar) object;
            ExemplarPK id = o.getExemplarPK();
            if (id == null) {
                return "";
            }
            String delim = "#";
            String escape = "~";
            String numero = String.valueOf(id.getNumero());
            numero = numero.replace(escape, escape + escape);
            numero = numero.replace(delim, escape + delim);
            String isbn = id.getIsbn();
            isbn = isbn == null ? "" : isbn.replace(escape, escape + escape);
            isbn = isbn.replace(delim, escape + delim);
            return numero + delim + isbn;
            // TODO: no setter methods were found in your primary key class
            //    model.ExemplarPK
            // and therefore getAsString() method could not be pre-generated.
        } else {
            throw new IllegalArgumentException("object " + object + " is of type " + object.getClass().getName() + "; expected type: model.Exemplar");
        }
    }
    
}
