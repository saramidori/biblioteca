/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package view;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import model.Publicacao;

/**
 *
 * @author Mikaele
 */
@Stateless
public class PublicacaoFacade extends AbstractFacade<Publicacao> {
    @PersistenceContext(unitName = "Bibi-warPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PublicacaoFacade() {
        super(Publicacao.class);
    }
    
}
