package com.josealmiron.logica;

import com.josealmiron.persistencia.ControladoraPersistencia;
import java.util.List;

public class Controladora {

    ControladoraPersistencia controlPersis = new ControladoraPersistencia();

    public void crearCitizen(Citizen citizen) {
        controlPersis.crearCitizen(citizen);
    }

    public void eliminarCitizen(Long id) {
        controlPersis.eliminarCitizen(id);
    }

    public List<Citizen> traerCitizens() {
        return controlPersis.traerCitizens();
    }

    public void editarCitizen(Citizen citizen) {
        controlPersis.editarCitizen(citizen);
    }
    
    public Citizen getCitizen(Long id) {
        return controlPersis.getCitizen(id);
    }
    
    public void crearAppointment(Appointment appointment, Long idCitizen) {
        Citizen citizen = controlPersis.getCitizen(idCitizen);
        appointment.setCitizen(citizen);
        controlPersis.crearAppointment(appointment);
    }

    public void eliminarAppointment(Long id) {
        controlPersis.eliminarAppointment(id);
    }

    public List<Appointment> traerAppointments() {
        return controlPersis.traerAppointments();
    }

    public void editarAppointment(Appointment appointment, Long idCitizen) {
        Citizen citizen = controlPersis.getCitizen(idCitizen);
        appointment.setCitizen(citizen);
        controlPersis.editarAppointment(appointment);
    }
    
    public Appointment getAppointment(Long id) {
        return controlPersis.getAppointment(id);
    }

}
