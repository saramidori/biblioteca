/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package view;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import model.Reserva;

/**
 *
 * @author Mikaele
 */
public class ReservaConverter implements Converter {

    public Object getAsObject(FacesContext facesContext, UIComponent component, String string) {
        if (string == null || string.length() == 0) {
            return null;
        }
        Integer id = new Integer(string);
        ReservaController controller = (ReservaController) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "reserva");
        return controller.getJpaController().find(id);
    }

    public String getAsString(FacesContext facesContext, UIComponent component, Object object) {
        if (object == null) {
            return null;
        }
        if (object instanceof Reserva) {
            Reserva o = (Reserva) object;
            return o.getCodigo() == null ? "" : o.getCodigo().toString();
        } else {
            throw new IllegalArgumentException("object " + object + " is of type " + object.getClass().getName() + "; expected type: model.Reserva");
        }
    }
    
}
