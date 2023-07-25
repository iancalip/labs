CREATE TABLE IF NOT EXISTS exams (
    cpf VARCHAR(255),
    nome_paciente VARCHAR(255),
    email_paciente VARCHAR(255),
    data_nascimento_paciente DATE,
    endereço_rua_paciente VARCHAR(255),
    cidade_paciente VARCHAR(255),
    estado_patiente VARCHAR(255),
    crm_médico VARCHAR(255),
    crm_médico_estado VARCHAR(255),
    nome_médico VARCHAR(255),
    email_médico VARCHAR(255),
    token_resultado_exame VARCHAR(255),
    data_exame DATE,
    tipo_exame VARCHAR(255),
    limites_tipo_exame VARCHAR(255),
    resultado_tipo_exame VARCHAR(255)
);
