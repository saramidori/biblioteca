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
import model.Associado;
import view.util.JsfUtil;
import view.util.PagingInfo;

/**
 *
 * @author Mikaele
 */
public class AssociadoController {

    public AssociadoController() {
        pagingInfo = new PagingInfo();
        converter = new AssociadoConverter();
    }
    private Associado associado = null;
    private List<Associado> associadoItems = null;
    private AssociadoFacade jpaController = null;
    private AssociadoConverter converter = null;
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

    public AssociadoFacade getJpaController() {
        if (jpaController == null) {
            FacesContext facesContext = FacesContext.getCurrentInstance();
            jpaController = (AssociadoFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "associadoJpa");
        }
        return jpaController;
    }

    public SelectItem[] getAssociadoItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), false);
    }

    public SelectItem[] getAssociadoItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), true);
    }

    public Associado getAssociado() {
        if (associado == null) {
            associado = (Associado) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentAssociado", converter, null);
        }
        if (associado == null) {
            associado = new Associado();
        }
        return associado;
    }

    public String listSetup() {
        reset(true);
        return "associado_list";
    }

    public String createSetup() {
        reset(false);
        associado = new Associado();
        return "associado_create";
    }

    public String create() {
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().create(associado);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Associado was successfully created.");
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
        return scalarSetup("associado_detail");
    }

    public String editSetup() {
        return scalarSetup("associado_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        associado = (Associado) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentAssociado", converter, null);
        if (associado == null) {
            String requestAssociadoString = JsfUtil.getRequestParameter("jsfcrud.currentAssociado");
            JsfUtil.addErrorMessage("The associado with id " + requestAssociadoString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String associadoString = converter.getAsString(FacesContext.getCurrentInstance(), null, associado);
        String currentAssociadoString = JsfUtil.getRequestParameter("jsfcrud.currentAssociado");
        if (associadoString == null || associadoString.length() == 0 || !associadoString.equals(currentAssociadoString)) {
            String outcome = editSetup();
            if ("associado_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit associado. Try again.");
            }
            return outcome;
        }
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().edit(associado);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Associado was successfully updated.");
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
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentAssociado");
        Integer id = new Integer(idAsString);
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
                JsfUtil.addSuccessMessage("Associado was successfully deleted.");
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

    public List<Associado> getAssociadoItems() {
        if (associadoItems == null) {
            getPagingInfo();
            associadoItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
        }
        return associadoItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "associado_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "associado_list";
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
        associado = null;
        associadoItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        Associado newAssociado = new Associado();
        String newAssociadoString = converter.getAsString(FacesContext.getCurrentInstance(), null, newAssociado);
        String associadoString = converter.getAsString(FacesContext.getCurrentInstance(), null, associado);
        if (!newAssociadoString.equals(associadoString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }
    
}
