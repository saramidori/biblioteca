/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Mikaele
 */
@Entity
@Table(name = "exemplar")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Exemplar.findAll", query = "SELECT e FROM Exemplar e"),
    @NamedQuery(name = "Exemplar.findByNumero", query = "SELECT e FROM Exemplar e WHERE e.exemplarPK.numero = :numero"),
    @NamedQuery(name = "Exemplar.findByIsbn", query = "SELECT e FROM Exemplar e WHERE e.exemplarPK.isbn = :isbn"),
    @NamedQuery(name = "Exemplar.findByPreco", query = "SELECT e FROM Exemplar e WHERE e.preco = :preco")})
public class Exemplar implements Serializable {
    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected ExemplarPK exemplarPK;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "Preco")
    private Float preco;
    @JoinColumn(name = "ISBN", referencedColumnName = "ISBN", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Publicacao publicacao;

    public Exemplar() {
    }

    public Exemplar(ExemplarPK exemplarPK) {
        this.exemplarPK = exemplarPK;
    }

    public Exemplar(int numero, String isbn) {
        this.exemplarPK = new ExemplarPK(numero, isbn);
    }

    public ExemplarPK getExemplarPK() {
        return exemplarPK;
    }

    public void setExemplarPK(ExemplarPK exemplarPK) {
        this.exemplarPK = exemplarPK;
    }

    public Float getPreco() {
        return preco;
    }

    public void setPreco(Float preco) {
        this.preco = preco;
    }

    public Publicacao getPublicacao() {
        return publicacao;
    }

    public void setPublicacao(Publicacao publicacao) {
        this.publicacao = publicacao;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (exemplarPK != null ? exemplarPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Exemplar)) {
            return false;
        }
        Exemplar other = (Exemplar) object;
        if ((this.exemplarPK == null && other.exemplarPK != null) || (this.exemplarPK != null && !this.exemplarPK.equals(other.exemplarPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Exemplar[ exemplarPK=" + exemplarPK + " ]";
    }
    
}
