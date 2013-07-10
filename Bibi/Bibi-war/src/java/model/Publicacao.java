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
@Table(name = "publicacao")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Publicacao.findAll", query = "SELECT p FROM Publicacao p"),
    @NamedQuery(name = "Publicacao.findByIsbn", query = "SELECT p FROM Publicacao p WHERE p.isbn = :isbn"),
    @NamedQuery(name = "Publicacao.findByTitulo", query = "SELECT p FROM Publicacao p WHERE p.titulo = :titulo"),
    @NamedQuery(name = "Publicacao.findByAutor", query = "SELECT p FROM Publicacao p WHERE p.autor = :autor"),
    @NamedQuery(name = "Publicacao.findByEditora", query = "SELECT p FROM Publicacao p WHERE p.editora = :editora")})
public class Publicacao implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 12)
    @Column(name = "ISBN")
    private String isbn;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 40)
    @Column(name = "Titulo")
    private String titulo;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 35)
    @Column(name = "Autor")
    private String autor;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "Editora")
    private String editora;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "publicacao")
    private Collection<Exemplar> exemplarCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "isbn")
    private Collection<Reserva> reservaCollection;

    public Publicacao() {
    }

    public Publicacao(String isbn) {
        this.isbn = isbn;
    }

    public Publicacao(String isbn, String titulo, String autor, String editora) {
        this.isbn = isbn;
        this.titulo = titulo;
        this.autor = autor;
        this.editora = editora;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public String getEditora() {
        return editora;
    }

    public void setEditora(String editora) {
        this.editora = editora;
    }

    @XmlTransient
    public Collection<Exemplar> getExemplarCollection() {
        return exemplarCollection;
    }

    public void setExemplarCollection(Collection<Exemplar> exemplarCollection) {
        this.exemplarCollection = exemplarCollection;
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
        hash += (isbn != null ? isbn.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Publicacao)) {
            return false;
        }
        Publicacao other = (Publicacao) object;
        if ((this.isbn == null && other.isbn != null) || (this.isbn != null && !this.isbn.equals(other.isbn))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Publicacao[ isbn=" + isbn + " ]";
    }
    
}
