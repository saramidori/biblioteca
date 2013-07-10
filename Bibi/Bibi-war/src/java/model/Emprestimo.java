/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Mikaele
 */
@Entity
@Table(name = "emprestimo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Emprestimo.findAll", query = "SELECT e FROM Emprestimo e"),
    @NamedQuery(name = "Emprestimo.findByCodigo", query = "SELECT e FROM Emprestimo e WHERE e.codigo = :codigo"),
    @NamedQuery(name = "Emprestimo.findByNroExemplar", query = "SELECT e FROM Emprestimo e WHERE e.nroExemplar = :nroExemplar"),
    @NamedQuery(name = "Emprestimo.findByIsbn", query = "SELECT e FROM Emprestimo e WHERE e.isbn = :isbn"),
    @NamedQuery(name = "Emprestimo.findByDataEmp", query = "SELECT e FROM Emprestimo e WHERE e.dataEmp = :dataEmp"),
    @NamedQuery(name = "Emprestimo.findByDataDevol", query = "SELECT e FROM Emprestimo e WHERE e.dataDevol = :dataDevol")})
public class Emprestimo implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "Codigo")
    private Integer codigo;
    @Basic(optional = false)
    @NotNull
    @Column(name = "Nro_Exemplar")
    private int nroExemplar;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 12)
    @Column(name = "ISBN")
    private String isbn;
    @Basic(optional = false)
    @NotNull
    @Column(name = "Data_Emp")
    @Temporal(TemporalType.DATE)
    private Date dataEmp;
    @Column(name = "Data_Devol")
    @Temporal(TemporalType.DATE)
    private Date dataDevol;
    @JoinColumn(name = "Codigo_Assoc", referencedColumnName = "Codigo")
    @ManyToOne(optional = false)
    private Associado codigoAssoc;

    public Emprestimo() {
    }

    public Emprestimo(Integer codigo) {
        this.codigo = codigo;
    }

    public Emprestimo(Integer codigo, int nroExemplar, String isbn, Date dataEmp) {
        this.codigo = codigo;
        this.nroExemplar = nroExemplar;
        this.isbn = isbn;
        this.dataEmp = dataEmp;
    }

    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public int getNroExemplar() {
        return nroExemplar;
    }

    public void setNroExemplar(int nroExemplar) {
        this.nroExemplar = nroExemplar;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public Date getDataEmp() {
        return dataEmp;
    }

    public void setDataEmp(Date dataEmp) {
        this.dataEmp = dataEmp;
    }

    public Date getDataDevol() {
        return dataDevol;
    }

    public void setDataDevol(Date dataDevol) {
        this.dataDevol = dataDevol;
    }

    public Associado getCodigoAssoc() {
        return codigoAssoc;
    }

    public void setCodigoAssoc(Associado codigoAssoc) {
        this.codigoAssoc = codigoAssoc;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (codigo != null ? codigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Emprestimo)) {
            return false;
        }
        Emprestimo other = (Emprestimo) object;
        if ((this.codigo == null && other.codigo != null) || (this.codigo != null && !this.codigo.equals(other.codigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Emprestimo[ codigo=" + codigo + " ]";
    }
    
}
