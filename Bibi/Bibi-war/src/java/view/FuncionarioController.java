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
import model.Funcionario;
import view.util.JsfUtil;
import view.util.PagingInfo;

/**
 *
 * @author Mikaele
 */
public class FuncionarioController {

    public FuncionarioController() {
        pagingInfo = new PagingInfo();
        converter = new FuncionarioConverter();
    }
    private Funcionario funcionario = null;
    private List<Funcionario> funcionarioItems = null;
    private FuncionarioFacade jpaController = null;
    private FuncionarioConverter converter = null;
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

    public FuncionarioFacade getJpaController() {
        if (jpaController == null) {
            FacesContext facesContext = FacesContext.getCurrentInstance();
            jpaController = (FuncionarioFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "funcionarioJpa");
        }
        return jpaController;
    }

    public SelectItem[] getFuncionarioItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), false);
    }

    public SelectItem[] getFuncionarioItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), true);
    }

    public Funcionario getFuncionario() {
        if (funcionario == null) {
            funcionario = (Funcionario) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentFuncionario", converter, null);
        }
        if (funcionario == null) {
            funcionario = new Funcionario();
        }
        return funcionario;
    }

    public String listSetup() {
        reset(true);
        return "funcionario_list";
    }

    public String createSetup() {
        reset(false);
        funcionario = new Funcionario();
        return "funcionario_create";
    }

    public String create() {
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().create(funcionario);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Funcionario was successfully created.");
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
        return scalarSetup("funcionario_detail");
    }

    public String editSetup() {
        return scalarSetup("funcionario_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        funcionario = (Funcionario) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentFuncionario", converter, null);
        if (funcionario == null) {
            String requestFuncionarioString = JsfUtil.getRequestParameter("jsfcrud.currentFuncionario");
            JsfUtil.addErrorMessage("The funcionario with id " + requestFuncionarioString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String funcionarioString = converter.getAsString(FacesContext.getCurrentInstance(), null, funcionario);
        String currentFuncionarioString = JsfUtil.getRequestParameter("jsfcrud.currentFuncionario");
        if (funcionarioString == null || funcionarioString.length() == 0 || !funcionarioString.equals(currentFuncionarioString)) {
            String outcome = editSetup();
            if ("funcionario_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit funcionario. Try again.");
            }
            return outcome;
        }
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().edit(funcionario);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Funcionario was successfully updated.");
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
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentFuncionario");
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
                JsfUtil.addSuccessMessage("Funcionario was successfully deleted.");
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

    public List<Funcionario> getFuncionarioItems() {
        if (funcionarioItems == null) {
            getPagingInfo();
            funcionarioItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
        }
        return funcionarioItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "funcionario_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "funcionario_list";
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
        funcionario = null;
        funcionarioItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        Funcionario newFuncionario = new Funcionario();
        String newFuncionarioString = converter.getAsString(FacesContext.getCurrentInstance(), null, newFuncionario);
        String funcionarioString = converter.getAsString(FacesContext.getCurrentInstance(), null, funcionario);
        if (!newFuncionarioString.equals(funcionarioString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }
    
}
