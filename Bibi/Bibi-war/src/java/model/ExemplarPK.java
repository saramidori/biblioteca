/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author Mikaele
 */
@Embeddable
public class ExemplarPK implements Serializable {
    @Basic(optional = false)
    @NotNull
    @Column(name = "Numero")
    private int numero;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 12)
    @Column(name = "ISBN")
    private String isbn;

    public ExemplarPK() {
    }

    public ExemplarPK(int numero, String isbn) {
        this.numero = numero;
        this.isbn = isbn;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) numero;
        hash += (isbn != null ? isbn.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ExemplarPK)) {
            return false;
        }
        ExemplarPK other = (ExemplarPK) object;
        if (this.numero != other.numero) {
            return false;
        }
        if ((this.isbn == null && other.isbn != null) || (this.isbn != null && !this.isbn.equals(other.isbn))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.ExemplarPK[ numero=" + numero + ", isbn=" + isbn + " ]";
    }
    
}
