/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package view;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import model.Exemplar;

/**
 *
 * @author Mikaele
 */
@Stateless
public class ExemplarFacade extends AbstractFacade<Exemplar> {
    @PersistenceContext(unitName = "Bibi-warPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ExemplarFacade() {
        super(Exemplar.class);
    }
    
}
