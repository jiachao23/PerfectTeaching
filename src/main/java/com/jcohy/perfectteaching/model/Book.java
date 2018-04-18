package com.jcohy.perfectteaching.model;

import javax.persistence.*;
import java.io.Serializable;

/**
 * ClassName: Book
 * Description:
 **/
@Entity
@Table(name = "book")
public class Book implements Serializable{
    private static final long serialVersionUID = 2L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "name")
    private String name;
    @Column(name = "upload_url")
    private String uploadUrl;
    @Column(name = "download_url")
    private String downloadUrl;
    @Column(name = "status")
    private String status;
    @OneToOne
    @JoinColumn(name = "lab_id")
    private Lab lab;

    public Lab getLab() {
        return lab;
    }

    public void setLab(Lab lab) {
        this.lab = lab;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUploadUrl() {
        return uploadUrl;
    }

    public void setUploadUrl(String uploadUrl) {
        this.uploadUrl = uploadUrl;
    }

    public String getDownloadUrl() {
        return downloadUrl;
    }

    public void setDownloadUrl(String downloadUrl) {
        this.downloadUrl = downloadUrl;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("Book{");
        sb.append("id=").append(id);
        sb.append(", name='").append(name).append('\'');
        sb.append(", uploadUrl='").append(uploadUrl).append('\'');
        sb.append(", downloadUrl='").append(downloadUrl).append('\'');
        sb.append(", status='").append(status).append('\'');
        sb.append(", lab=").append(lab);
        sb.append('}');
        return sb.toString();
    }
}
