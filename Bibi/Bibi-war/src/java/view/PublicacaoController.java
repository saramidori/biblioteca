/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package view;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;
import javax.faces.FacesException;
import javax.annotation.Resource;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.model.SelectItem;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.transaction.UserTransaction;
import model.Publicacao;
import view.util.JsfUtil;
import view.util.PagingInfo;

/**
 *
 * @author Mikaele
 */
public class PublicacaoController {

    public PublicacaoController() {
        pagingInfo = new PagingInfo();
        converter = new PublicacaoConverter();
    }
    private Publicacao publicacao = null;
    private List<Publicacao> publicacaoItems = null;
    private PublicacaoFacade jpaController = null;
    private PublicacaoConverter converter = null;
    private PagingInfo pagingInfo = null;
    @Resource
    private UserTransaction utx = null;
    @PersistenceUnit(unitName = "Bibi-warPU")
    private EntityManagerFactory emf = null;

    public PagingInfo getPagingInfo() {
        if (pagingInfo.getItemCount() == -1) {
            pagingInfo.setItemCount(getJpaController().count());
        }
        return pagingInfo;
    }

    public PublicacaoFacade getJpaController() {
        if (jpaController == null) {
            FacesContext facesContext = FacesContext.getCurrentInstance();
            jpaController = (PublicacaoFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "publicacaoJpa");
        }
        return jpaController;
    }

    public SelectItem[] getPublicacaoItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), false);
    }

    public SelectItem[] getPublicacaoItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), true);
    }

    public Publicacao getPublicacao() {
        if (publicacao == null) {
            publicacao = (Publicacao) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentPublicacao", converter, null);
        }
        if (publicacao == null) {
            publicacao = new Publicacao();
        }
        return publicacao;
    }

    public String listSetup() {
        reset(true);
        return "publicacao_list";
    }

    public String createSetup() {
        reset(false);
        publicacao = new Publicacao();
        return "publicacao_create";
    }

    public String create() {
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().create(publicacao);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Publicacao was successfully created.");
            } else {
                JsfUtil.ensureAddErrorMessage(transactionException, "A persistence error occurred.");
            }
        } catch (Exception e) {
            try {
                utx.rollback();
            } catch (Exception ex) {
            }
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            return null;
        }
        return listSetup();
    }

    public String detailSetup() {
        return scalarSetup("publicacao_detail");
    }

    public String editSetup() {
        return scalarSetup("publicacao_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        publicacao = (Publicacao) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentPublicacao", converter, null);
        if (publicacao == null) {
            String requestPublicacaoString = JsfUtil.getRequestParameter("jsfcrud.currentPublicacao");
            JsfUtil.addErrorMessage("The publicacao with id " + requestPublicacaoString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String publicacaoString = converter.getAsString(FacesContext.getCurrentInstance(), null, publicacao);
        String currentPublicacaoString = JsfUtil.getRequestParameter("jsfcrud.currentPublicacao");
        if (publicacaoString == null || publicacaoString.length() == 0 || !publicacaoString.equals(currentPublicacaoString)) {
            String outcome = editSetup();
            if ("publicacao_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit publicacao. Try again.");
            }
            return outcome;
        }
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().edit(publicacao);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Publicacao was successfully updated.");
            } else {
                JsfUtil.ensureAddErrorMessage(transactionException, "A persistence error occurred.");
            }
        } catch (Exception e) {
            try {
                utx.rollback();
            } catch (Exception ex) {
            }
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            return null;
        }
        return detailSetup();
    }

    public String remove() {
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentPublicacao");
        String id = idAsString;
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().remove(getJpaController().find(id));
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Publicacao was successfully deleted.");
            } else {
                JsfUtil.ensureAddErrorMessage(transactionException, "A persistence error occurred.");
            }
        } catch (Exception e) {
            try {
                utx.rollback();
            } catch (Exception ex) {
            }
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            return null;
        }
        return relatedOrListOutcome();
    }

    private String relatedOrListOutcome() {
        String relatedControllerOutcome = relatedControllerOutcome();
        if (relatedControllerOutcome != null) {
            return relatedControllerOutcome;
        }
        return listSetup();
    }

    public List<Publicacao> getPublicacaoItems() {
        if (publicacaoItems == null) {
            getPagingInfo();
            publicacaoItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
        }
        return publicacaoItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "publicacao_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "publicacao_list";
    }

    private String relatedControllerOutcome() {
        String relatedControllerString = JsfUtil.getRequestParameter("jsfcrud.relatedController");
        String relatedControllerTypeString = JsfUtil.getRequestParameter("jsfcrud.relatedControllerType");
        if (relatedControllerString != null && relatedControllerTypeString != null) {
            FacesContext context = FacesContext.getCurrentInstance();
            Object relatedController = context.getApplication().getELResolver().getValue(context.getELContext(), null, relatedControllerString);
            try {
                Class<?> relatedControllerType = Class.forName(relatedControllerTypeString);
                Method detailSetupMethod = relatedControllerType.getMethod("detailSetup");
                return (String) detailSetupMethod.invoke(relatedController);
            } catch (ClassNotFoundException e) {
                throw new FacesException(e);
            } catch (NoSuchMethodException e) {
                throw new FacesException(e);
            } catch (IllegalAccessException e) {
                throw new FacesException(e);
            } catch (InvocationTargetException e) {
                throw new FacesException(e);
            }
        }
        return null;
    }

    private void reset(boolean resetFirstItem) {
        publicacao = null;
        publicacaoItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        Publicacao newPublicacao = new Publicacao();
        String newPublicacaoString = converter.getAsString(FacesContext.getCurrentInstance(), null, newPublicacao);
        String publicacaoString = converter.getAsString(FacesContext.getCurrentInstance(), null, publicacao);
        if (!newPublicacaoString.equals(publicacaoString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }
    
}
