package com.smart.module.car.entity;

import com.smart.common.model.PageBean;
import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

/**
 * @sunzijin
 * 
 */
@Data
@Entity
@Table(name = "app_car_safemenu")
public class AppCarSafemenu extends PageBean implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false, length = 20)
    private Long id;

    @Column(name = "name", length = 500)
    private String name;

    @Column(name = "text", length = 500)
    private String text;

}