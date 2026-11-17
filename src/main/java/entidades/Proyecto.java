package entidades;

import java.sql.Date;
import java.text.DecimalFormat;

public class Proyecto {
    private String nombre;
    private String descripcion;
    private Date fechaInicio;
    private Date fechaFin;
    private String asesorTecnico;
    private double presupuesto;

    public Proyecto() { super(); }

    // Recibe los valores crudos del formulario
    public Proyecto(String nombre, String descripcion, String fechaInicio, String fechaFin, String asesorTecnico, String presupuesto) {
        setNombre(nombre);
        setDescripcion(descripcion);
        setFechaInicio(fechaInicio);
        setFechaFin(fechaFin);
        setAsesorTecnico(asesorTecnico);
        setPresupuesto(presupuesto);
    }

    public String getNombre() { return nombre; }
    public String getDescripcion() { return descripcion; }
    public Date getFechaInicio() { return fechaInicio; }
    public Date getFechaFin() { return fechaFin; }
    public String getAsesorTecnico() { return asesorTecnico; }
    public double getPresupuesto() { return presupuesto; }

    //====================================================================

    public void setNombre(String nombre) {
        // Validación: debe tener de 4 a 60 caracteres
        if (nombre == null || nombre.trim().length() < 4 || nombre.trim().length() > 60) {
            throw new IllegalArgumentException("El nombre del proyecto es obligatorio y debe tener entre 4 y 60 caracteres.");
        }
        this.nombre = nombre.trim();
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = (descripcion != null) ? descripcion.trim() : "";
    }

    public void setFechaInicio(String fechaInicio) {
        this.fechaInicio = convertirFecha(fechaInicio);
    }

    public void setFechaFin(String fechaFin) {
    	this.fechaFin = convertirFecha(fechaFin);
    }

    public void setAsesorTecnico(String asesorTecnico) {
        if (asesorTecnico == null || asesorTecnico.trim().isEmpty()) {
            throw new IllegalArgumentException("El asesor técnico del proyecto es obligatorio.");
        }
        this.asesorTecnico = asesorTecnico.trim();
    }

    public void setPresupuesto(String presupuesto) {
        if (presupuesto == null || presupuesto.trim().isEmpty()) {
            throw new IllegalArgumentException("El presupuesto asignado es obligatorio.");
        }
        double valor = Double.parseDouble(presupuesto.trim());
        if (valor < 0) {
            throw new IllegalArgumentException("El presupuesto asignado no puede ser negativo.");
        }
        this.presupuesto = valor;
    }

    //===============================================================================================

    private Date convertirFecha(String valor) {
        if (valor == null || valor.trim().isEmpty()) {
            throw new IllegalArgumentException("La fecha del proyecto es obligatoria.");
        }
        return Date.valueOf(valor.trim());
    }

    public String getPresupuestoFormateado() {
        DecimalFormat formateador = new DecimalFormat("#,###.00");
        return "S/ " + formateador.format(this.presupuesto);
    }
}