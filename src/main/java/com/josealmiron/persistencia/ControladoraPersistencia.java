package com.josealmiron.persistencia;

import com.josealmiron.logica.Citizen;
import com.josealmiron.logica.Appointment;
import com.josealmiron.persistencia.exceptions.NonexistentEntityException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ControladoraPersistencia {

    CitizenJpaController citizenJPA = new CitizenJpaController();
    AppointmentJpaController appointmentJPA = new AppointmentJpaController();

    public void crearCitizen(Citizen citizen) {
        citizenJPA.create(citizen);
    }

    public void eliminarCitizen(Long id) {
        try {
            citizenJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Citizen> traerCitizens() {
        return citizenJPA.findCitizenEntities();
    }

    public void editarCitizen(Citizen citizen) {
        try {
            citizenJPA.edit(citizen);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Citizen getCitizen(Long id) {
        return citizenJPA.findCitizen(id);
    }

    public void crearAppointment(Appointment appointment) {
        appointmentJPA.create(appointment);
    }

    public void eliminarAppointment(Long id) {
        try {
            appointmentJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Appointment> traerAppointments() {
        return appointmentJPA.findAppointmentEntities();
    }

    public void editarAppointment(Appointment appointment) {
        try {
            appointmentJPA.edit(appointment);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Appointment getAppointment(Long id) {
        return appointmentJPA.findAppointment(id);
    }
    
}
