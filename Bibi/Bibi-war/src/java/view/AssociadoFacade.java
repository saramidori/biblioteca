/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package view;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import model.Associado;

/**
 *
 * @author Mikaele
 */
@Stateless
public class AssociadoFacade extends AbstractFacade<Associado> {
    @PersistenceContext(unitName = "Bibi-warPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AssociadoFacade() {
        super(Associado.class);
    }
    
}
