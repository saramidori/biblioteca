/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Mikaele
 */
@Entity
@Table(name = "associado")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Associado.findAll", query = "SELECT a FROM Associado a"),
    @NamedQuery(name = "Associado.findByCodigo", query = "SELECT a FROM Associado a WHERE a.codigo = :codigo"),
    @NamedQuery(name = "Associado.findByNome", query = "SELECT a FROM Associado a WHERE a.nome = :nome"),
    @NamedQuery(name = "Associado.findByEndereco", query = "SELECT a FROM Associado a WHERE a.endereco = :endereco"),
    @NamedQuery(name = "Associado.findByEmail", query = "SELECT a FROM Associado a WHERE a.email = :email"),
    @NamedQuery(name = "Associado.findByStatus", query = "SELECT a FROM Associado a WHERE a.status = :status")})
public class Associado implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "Codigo")
    private Integer codigo;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 35)
    @Column(name = "Nome")
    private String nome;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "Endereco")
    private String endereco;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="E-mail inválido")//if the field contains email address consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "Email")
    private String email;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 7)
    @Column(name = "Status")
    private String status;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "codigoAssoc")
    private Collection<Emprestimo> emprestimoCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "codigoAssoc")
    private Collection<Reserva> reservaCollection;

    public Associado() {
    }

    public Associado(Integer codigo) {
        this.codigo = codigo;
    }

    public Associado(Integer codigo, String nome, String endereco, String email, String status) {
        this.codigo = codigo;
        this.nome = nome;
        this.endereco = endereco;
        this.email = email;
        this.status = status;
    }

    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @XmlTransient
    public Collection<Emprestimo> getEmprestimoCollection() {
        return emprestimoCollection;
    }

    public void setEmprestimoCollection(Collection<Emprestimo> emprestimoCollection) {
        this.emprestimoCollection = emprestimoCollection;
    }

    @XmlTransient
    public Collection<Reserva> getReservaCollection() {
        return reservaCollection;
    }

    public void setReservaCollection(Collection<Reserva> reservaCollection) {
        this.reservaCollection = reservaCollection;
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
        if (!(object instanceof Associado)) {
            return false;
        }
        Associado other = (Associado) object;
        if ((this.codigo == null && other.codigo != null) || (this.codigo != null && !this.codigo.equals(other.codigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Associado[ codigo=" + codigo + " ]";
    }
    
}
