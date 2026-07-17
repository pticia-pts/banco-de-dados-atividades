


CREATE TABLE Pessoa (
    cpf CHAR(11) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    endereco VARCHAR(200),
    data_nascimento DATE NOT NULL
);




CREATE TABLE Paciente (
    cpf_pessoa CHAR(11) PRIMARY KEY,
    plano_de_saude BOOLEAN NOT NULL,
    senha          VARCHAR(100) NOT NULL,

    CONSTRAINT fk_paciente_pessoa
        FOREIGN KEY (cpf_pessoa)
        REFERENCES Pessoa(cpf)
        ON DELETE CASCADE
);



CREATE TABLE Medico (
    crm VARCHAR(20) PRIMARY KEY,
    cpf_pessoa CHAR(11) UNIQUE NOT NULL,

    CONSTRAINT fk_medico_pessoa
        FOREIGN KEY (cpf_pessoa)
        REFERENCES Pessoa(cpf)
        ON DELETE CASCADE
);




CREATE TABLE Especialidade (
    identificador SERIAL PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL
);




CREATE TABLE Medico_Especialidade (
    crm_medico VARCHAR(20),
    id_especialidade INT,

    PRIMARY KEY (crm_medico, id_especialidade),

    CONSTRAINT fk_me_medico
        FOREIGN KEY (crm_medico)
        REFERENCES Medico(crm)
        ON DELETE CASCADE,

    CONSTRAINT fk_me_especialidade
        FOREIGN KEY (id_especialidade)
        REFERENCES Especialidade(identificador)
        ON DELETE CASCADE
);




CREATE TABLE Agendamento (
    id_agendamento SERIAL PRIMARY KEY,

    cpf_paciente CHAR(11) NOT NULL,
    crm_medico VARCHAR(20) NOT NULL,

    data_hora_agendamento TIMESTAMP NOT NULL,
    data_hora_consulta TIMESTAMP NOT NULL,

    valor_consulta NUMERIC(10,2) NOT NULL,

    CONSTRAINT fk_agendamento_paciente
        FOREIGN KEY (cpf_paciente)
        REFERENCES Paciente(cpf_pessoa)
        ON DELETE CASCADE,

    CONSTRAINT fk_agendamento_medico
        FOREIGN KEY (crm_medico)
        REFERENCES Medico(crm)
        ON DELETE CASCADE
);