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
import model.Reserva;
import view.util.JsfUtil;
import view.util.PagingInfo;

/**
 *
 * @author Mikaele
 */
public class ReservaController {

    public ReservaController() {
        pagingInfo = new PagingInfo();
        converter = new ReservaConverter();
    }
    private Reserva reserva = null;
    private List<Reserva> reservaItems = null;
    private ReservaFacade jpaController = null;
    private ReservaConverter converter = null;
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

    public ReservaFacade getJpaController() {
        if (jpaController == null) {
            FacesContext facesContext = FacesContext.getCurrentInstance();
            jpaController = (ReservaFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "reservaJpa");
        }
        return jpaController;
    }

    public SelectItem[] getReservaItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), false);
    }

    public SelectItem[] getReservaItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), true);
    }

    public Reserva getReserva() {
        if (reserva == null) {
            reserva = (Reserva) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentReserva", converter, null);
        }
        if (reserva == null) {
            reserva = new Reserva();
        }
        return reserva;
    }

    public String listSetup() {
        reset(true);
        return "reserva_list";
    }

    public String createSetup() {
        reset(false);
        reserva = new Reserva();
        return "reserva_create";
    }

    public String create() {
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().create(reserva);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Reserva was successfully created.");
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
        return scalarSetup("reserva_detail");
    }

    public String editSetup() {
        return scalarSetup("reserva_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        reserva = (Reserva) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentReserva", converter, null);
        if (reserva == null) {
            String requestReservaString = JsfUtil.getRequestParameter("jsfcrud.currentReserva");
            JsfUtil.addErrorMessage("The reserva with id " + requestReservaString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String reservaString = converter.getAsString(FacesContext.getCurrentInstance(), null, reserva);
        String currentReservaString = JsfUtil.getRequestParameter("jsfcrud.currentReserva");
        if (reservaString == null || reservaString.length() == 0 || !reservaString.equals(currentReservaString)) {
            String outcome = editSetup();
            if ("reserva_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit reserva. Try again.");
            }
            return outcome;
        }
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().edit(reserva);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Reserva was successfully updated.");
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
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentReserva");
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
                JsfUtil.addSuccessMessage("Reserva was successfully deleted.");
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

    public List<Reserva> getReservaItems() {
        if (reservaItems == null) {
            getPagingInfo();
            reservaItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
        }
        return reservaItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "reserva_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "reserva_list";
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
        reserva = null;
        reservaItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        Reserva newReserva = new Reserva();
        String newReservaString = converter.getAsString(FacesContext.getCurrentInstance(), null, newReserva);
        String reservaString = converter.getAsString(FacesContext.getCurrentInstance(), null, reserva);
        if (!newReservaString.equals(reservaString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }
    
}
