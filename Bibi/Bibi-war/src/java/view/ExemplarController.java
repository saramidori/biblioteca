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
import model.Exemplar;
import view.util.JsfUtil;
import model.ExemplarPK;
import view.util.PagingInfo;

/**
 *
 * @author Mikaele
 */
public class ExemplarController {

    public ExemplarController() {
        pagingInfo = new PagingInfo();
        converter = new ExemplarConverter();
    }
    private Exemplar exemplar = null;
    private List<Exemplar> exemplarItems = null;
    private ExemplarFacade jpaController = null;
    private ExemplarConverter converter = null;
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

    public ExemplarFacade getJpaController() {
        if (jpaController == null) {
            FacesContext facesContext = FacesContext.getCurrentInstance();
            jpaController = (ExemplarFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "exemplarJpa");
        }
        return jpaController;
    }

    public SelectItem[] getExemplarItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), false);
    }

    public SelectItem[] getExemplarItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), true);
    }

    public Exemplar getExemplar() {
        if (exemplar == null) {
            exemplar = (Exemplar) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentExemplar", converter, null);
        }
        if (exemplar == null) {
            exemplar = new Exemplar();
        }
        return exemplar;
    }

    public String listSetup() {
        reset(true);
        return "exemplar_list";
    }

    public String createSetup() {
        reset(false);
        exemplar = new Exemplar();
        exemplar.setExemplarPK(new ExemplarPK());
        return "exemplar_create";
    }

    public String create() {
        exemplar.getExemplarPK().setIsbn(exemplar.getPublicacao().getIsbn());
        // TODO: no setter methods were found in your primary key class
        //    model.ExemplarPK
        // and therefore initialization code need manual adjustments.
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().create(exemplar);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Exemplar was successfully created.");
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
        return scalarSetup("exemplar_detail");
    }

    public String editSetup() {
        return scalarSetup("exemplar_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        exemplar = (Exemplar) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentExemplar", converter, null);
        if (exemplar == null) {
            String requestExemplarString = JsfUtil.getRequestParameter("jsfcrud.currentExemplar");
            JsfUtil.addErrorMessage("The exemplar with id " + requestExemplarString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        exemplar.getExemplarPK().setIsbn(exemplar.getPublicacao().getIsbn());
        // TODO: no setter methods were found in your primary key class
        //    model.ExemplarPK
        // and therefore initialization code need manual adjustments.
        String exemplarString = converter.getAsString(FacesContext.getCurrentInstance(), null, exemplar);
        String currentExemplarString = JsfUtil.getRequestParameter("jsfcrud.currentExemplar");
        if (exemplarString == null || exemplarString.length() == 0 || !exemplarString.equals(currentExemplarString)) {
            String outcome = editSetup();
            if ("exemplar_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit exemplar. Try again.");
            }
            return outcome;
        }
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().edit(exemplar);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Exemplar was successfully updated.");
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
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentExemplar");
        ExemplarPK id = converter.getId(idAsString);
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
                JsfUtil.addSuccessMessage("Exemplar was successfully deleted.");
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

    public List<Exemplar> getExemplarItems() {
        if (exemplarItems == null) {
            getPagingInfo();
            exemplarItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
        }
        return exemplarItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "exemplar_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "exemplar_list";
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
        exemplar = null;
        exemplarItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        Exemplar newExemplar = new Exemplar();
        newExemplar.setExemplarPK(new ExemplarPK());
        String newExemplarString = converter.getAsString(FacesContext.getCurrentInstance(), null, newExemplar);
        String exemplarString = converter.getAsString(FacesContext.getCurrentInstance(), null, exemplar);
        if (!newExemplarString.equals(exemplarString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }
    
}
