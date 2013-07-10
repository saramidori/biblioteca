/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package view;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import model.Emprestimo;

/**
 *
 * @author Mikaele
 */
public class EmprestimoConverter implements Converter {

    public Object getAsObject(FacesContext facesContext, UIComponent component, String string) {
        if (string == null || string.length() == 0) {
            return null;
        }
        Integer id = new Integer(string);
        EmprestimoController controller = (EmprestimoController) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "emprestimo");
        return controller.getJpaController().find(id);
    }

    public String getAsString(FacesContext facesContext, UIComponent component, Object object) {
        if (object == null) {
            return null;
        }
        if (object instanceof Emprestimo) {
            Emprestimo o = (Emprestimo) object;
            return o.getCodigo() == null ? "" : o.getCodigo().toString();
        } else {
            throw new IllegalArgumentException("object " + object + " is of type " + object.getClass().getName() + "; expected type: model.Emprestimo");
        }
    }
    
}
