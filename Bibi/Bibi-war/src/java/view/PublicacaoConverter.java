/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package view;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import model.Publicacao;

/**
 *
 * @author Mikaele
 */
public class PublicacaoConverter implements Converter {

    public Object getAsObject(FacesContext facesContext, UIComponent component, String string) {
        if (string == null || string.length() == 0) {
            return null;
        }
        String id = string;
        PublicacaoController controller = (PublicacaoController) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "publicacao");
        return controller.getJpaController().find(id);
    }

    public String getAsString(FacesContext facesContext, UIComponent component, Object object) {
        if (object == null) {
            return null;
        }
        if (object instanceof Publicacao) {
            Publicacao o = (Publicacao) object;
            return o.getIsbn() == null ? "" : o.getIsbn().toString();
        } else {
            throw new IllegalArgumentException("object " + object + " is of type " + object.getClass().getName() + "; expected type: model.Publicacao");
        }
    }
    
}
