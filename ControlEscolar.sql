CREATE DATABASE IF NOT EXISTS ControlEscolar;
USE ControlEscolar;

CREATE TABLE CEstados (
    idEstado INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL
);

CREATE TABLE CMunicipio (
    idMunicipio INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    idEstado INT NOT NULL,
    FOREIGN KEY (idEstado) REFERENCES CEstados(idEstado) ON DELETE CASCADE
);

CREATE TABLE CLocalidad (
    idLocalidad INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    idMunicipio INT NOT NULL,
    FOREIGN KEY (idMunicipio) REFERENCES CMunicipio(idMunicipio) ON DELETE CASCADE
);

CREATE TABLE Genero (
    idGenero INT AUTO_INCREMENT PRIMARY KEY,
    Genero VARCHAR(100) NOT NULL
);

CREATE TABLE CCarreras (
    idCarrera INT AUTO_INCREMENT PRIMARY KEY,
    NombreCarreras VARCHAR(50) NOT NULL,
    Estatus BOOLEAN DEFAULT TRUE
);

CREATE TABLE CTipoPersonal (
    idTipo INT AUTO_INCREMENT PRIMARY KEY,
    Personal VARCHAR(100) NOT NULL
);

CREATE TABLE CDatosEscuela (
    CCT VARCHAR(10) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Telefono VARCHAR(10),
    Email VARCHAR(100),
    calle VARCHAR(80),
    NumE INT,
    NumI INT,
    idLocalidad INT NOT NULL,
    idMunicipio INT NOT NULL,
    idEstado INT NOT NULL,
    CP INT,
    FOREIGN KEY (idLocalidad) REFERENCES CLocalidad(idLocalidad),
    FOREIGN KEY (idMunicipio) REFERENCES CMunicipio(idMunicipio),
    FOREIGN KEY (idEstado) REFERENCES CEstados(idEstado)
);

CREATE TABLE CDatosPersonales (
    idDatosP INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    FechaNacimiento DATE,
    Curp VARCHAR(20) NOT NULL,
    Email VARCHAR(100),
    Telefono VARCHAR(10),
    Calle VARCHAR(80),
    NumE INT,
    NumI INT,
    CP INT,
    idLocalidad INT NOT NULL,
    idMunicipio INT NOT NULL,
    idEstado INT NOT NULL,
    idGenero INT NOT NULL,
    FOREIGN KEY (idLocalidad) REFERENCES CLocalidad(idLocalidad),
    FOREIGN KEY (idMunicipio) REFERENCES CMunicipio(idMunicipio),
    FOREIGN KEY (idEstado) REFERENCES CEstados(idEstado),
    FOREIGN KEY (idGenero) REFERENCES Genero(idGenero)
);

CREATE TABLE CAlumnos (
    Matricula VARCHAR(20) PRIMARY KEY,
    idCarrera INT NOT NULL,
    idDatosP INT NOT NULL,
    Status CHAR(1) DEFAULT 'A',
    FOREIGN KEY (idCarrera) REFERENCES CCarreras(idCarrera),
    FOREIGN KEY (idDatosP) REFERENCES CDatosPersonales(idDatosP) ON DELETE CASCADE
);

CREATE TABLE CPersonal (
    idPersonal INT AUTO_INCREMENT PRIMARY KEY,
    idDatosP INT NOT NULL,
    idTipo INT NOT NULL,
    ClaveEmp VARCHAR(10) NOT NULL,
    Status BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (idDatosP) REFERENCES CDatosPersonales(idDatosP) ON DELETE CASCADE,
    FOREIGN KEY (idTipo) REFERENCES CTipoPersonal(idTipo)
);