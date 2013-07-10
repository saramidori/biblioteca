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
import model.Emprestimo;
import view.util.JsfUtil;
import view.util.PagingInfo;

/**
 *
 * @author Mikaele
 */
public class EmprestimoController {

    public EmprestimoController() {
        pagingInfo = new PagingInfo();
        converter = new EmprestimoConverter();
    }
    private Emprestimo emprestimo = null;
    private List<Emprestimo> emprestimoItems = null;
    private EmprestimoFacade jpaController = null;
    private EmprestimoConverter converter = null;
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

    public EmprestimoFacade getJpaController() {
        if (jpaController == null) {
            FacesContext facesContext = FacesContext.getCurrentInstance();
            jpaController = (EmprestimoFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "emprestimoJpa");
        }
        return jpaController;
    }

    public SelectItem[] getEmprestimoItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), false);
    }

    public SelectItem[] getEmprestimoItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), true);
    }

    public Emprestimo getEmprestimo() {
        if (emprestimo == null) {
            emprestimo = (Emprestimo) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentEmprestimo", converter, null);
        }
        if (emprestimo == null) {
            emprestimo = new Emprestimo();
        }
        return emprestimo;
    }

    public String listSetup() {
        reset(true);
        return "emprestimo_list";
    }

    public String createSetup() {
        reset(false);
        emprestimo = new Emprestimo();
        return "emprestimo_create";
    }

    public String create() {
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().create(emprestimo);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Emprestimo was successfully created.");
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
        return scalarSetup("emprestimo_detail");
    }

    public String editSetup() {
        return scalarSetup("emprestimo_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        emprestimo = (Emprestimo) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentEmprestimo", converter, null);
        if (emprestimo == null) {
            String requestEmprestimoString = JsfUtil.getRequestParameter("jsfcrud.currentEmprestimo");
            JsfUtil.addErrorMessage("The emprestimo with id " + requestEmprestimoString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String emprestimoString = converter.getAsString(FacesContext.getCurrentInstance(), null, emprestimo);
        String currentEmprestimoString = JsfUtil.getRequestParameter("jsfcrud.currentEmprestimo");
        if (emprestimoString == null || emprestimoString.length() == 0 || !emprestimoString.equals(currentEmprestimoString)) {
            String outcome = editSetup();
            if ("emprestimo_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit emprestimo. Try again.");
            }
            return outcome;
        }
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().edit(emprestimo);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Emprestimo was successfully updated.");
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
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentEmprestimo");
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
                JsfUtil.addSuccessMessage("Emprestimo was successfully deleted.");
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

    public List<Emprestimo> getEmprestimoItems() {
        if (emprestimoItems == null) {
            getPagingInfo();
            emprestimoItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
        }
        return emprestimoItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "emprestimo_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "emprestimo_list";
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
        emprestimo = null;
        emprestimoItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        Emprestimo newEmprestimo = new Emprestimo();
        String newEmprestimoString = converter.getAsString(FacesContext.getCurrentInstance(), null, newEmprestimo);
        String emprestimoString = converter.getAsString(FacesContext.getCurrentInstance(), null, emprestimo);
        if (!newEmprestimoString.equals(emprestimoString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }
    
}
