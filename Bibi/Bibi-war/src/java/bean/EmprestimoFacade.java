/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import model.Emprestimo;

/**
 *
 * @author Mikaele
 */
@Stateless
public class EmprestimoFacade extends AbstractFacade<Emprestimo> {
    @PersistenceContext(unitName = "Bibi-warPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public EmprestimoFacade() {
        super(Emprestimo.class);
    }
    
}
