CREATE TABLE `Buraco` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `localizacao_id` integer,
  `tamanho_id` integer,
  `endereco_id` integer
);

CREATE TABLE `Tamanho` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `escala` integer,
  `prioridade_id` integer
);

CREATE TABLE `Localizacao` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `local` text NOT NULL
);

CREATE TABLE `Bairro` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `nome` text NOT NULL,
  `cidade_id` integer
);

CREATE TABLE `Prioridade` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `descricao` text NOT NULL
);

CREATE TABLE `DadosOrdemTrabalho` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `horas_trabalhadas` integer NOT NULL,
  `material_utilizado` integer NOT NULL,
  `custo` float NOT NULL,
  `buraco_id` integer,
  `equipe_id` integer,
  `equipamento_id` integer,
  `status_reparo_id` integer
);

CREATE TABLE `Equipe` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `tamanho_equipe` integer NOT NULL
);

CREATE TABLE `Equipamento` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `descricao` text NOT NULL
);

CREATE TABLE `StatusReparo` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `descricao` text NOT NULL
);

CREATE TABLE `Endereco` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `cep` varchar(14) NOT NULL,
  `rua` varchar(20),
  `quadra` integer,
  `lote` integer,
  `numero` integer,
  `bairro_id` integer
);

CREATE TABLE `Estado` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `nome` text NOT NULL
);

CREATE TABLE `Cidade` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `estado_id` integer,
  `nome` text NOT NULL
);

CREATE TABLE `Cidadao` (
  `cpf` integer PRIMARY KEY,
  `nome` text NOT NULL,
  `cargo_id` integer,
  `escolaridade_id` integer,
  `estado_civil_id` integer,
  `genero_id` integer,
  `naturalidade_id` integer,
  `endereco_id` integer
);

CREATE TABLE `DanosOcorridos` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `valor` float NOT NULL,
  `cidadao_id` integer,
  `tipo_dano_id` integer
);

CREATE TABLE `TipoDano` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `descricao` text NOT NULL
);

CREATE TABLE `Telefone` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `usuario_id` integer,
  `ddd` varchar(2) NOT NULL,
  `numero` varchar(10) NOT NULL
);

CREATE TABLE `Email` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `usuario_id` integer,
  `email` text NOT NULL
);

CREATE TABLE `Cargo` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `descricao` text NOT NULL
);

CREATE TABLE `EstadoCivil` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `descricao` text
);

CREATE TABLE `Escolaridade` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `nome` text NOT NULL,
  `curso` text
);

CREATE TABLE `Genero` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `nome` text
);

CREATE TABLE `Naturalidade` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `descricao` text
);

CREATE TABLE `Localizacao_Buraco` (
  `Localizacao_id` integer NOT NULL,
  `Buraco_localizacao_id` integer NOT NULL,
  PRIMARY KEY (`Localizacao_id`, `Buraco_localizacao_id`)
);

ALTER TABLE `Localizacao_Buraco` ADD FOREIGN KEY (`Localizacao_id`) REFERENCES `Localizacao` (`id`);

ALTER TABLE `Localizacao_Buraco` ADD FOREIGN KEY (`Buraco_localizacao_id`) REFERENCES `Buraco` (`localizacao_id`);


CREATE TABLE `Tamanho_Buraco` (
  `Tamanho_id` integer NOT NULL,
  `Buraco_tamanho_id` integer NOT NULL,
  PRIMARY KEY (`Tamanho_id`, `Buraco_tamanho_id`)
);

ALTER TABLE `Tamanho_Buraco` ADD FOREIGN KEY (`Tamanho_id`) REFERENCES `Tamanho` (`id`);

ALTER TABLE `Tamanho_Buraco` ADD FOREIGN KEY (`Buraco_tamanho_id`) REFERENCES `Buraco` (`tamanho_id`);


ALTER TABLE `Buraco` ADD FOREIGN KEY (`endereco_id`) REFERENCES `Endereco` (`id`);

ALTER TABLE `Tamanho` ADD FOREIGN KEY (`prioridade_id`) REFERENCES `Prioridade` (`id`);

ALTER TABLE `Bairro` ADD FOREIGN KEY (`cidade_id`) REFERENCES `Cidade` (`id`);

ALTER TABLE `DadosOrdemTrabalho` ADD FOREIGN KEY (`buraco_id`) REFERENCES `Buraco` (`id`);

ALTER TABLE `DadosOrdemTrabalho` ADD FOREIGN KEY (`equipe_id`) REFERENCES `Equipe` (`id`);

CREATE TABLE `Equipamento_DadosOrdemTrabalho` (
  `Equipamento_id` integer NOT NULL,
  `DadosOrdemTrabalho_equipamento_id` integer NOT NULL,
  PRIMARY KEY (`Equipamento_id`, `DadosOrdemTrabalho_equipamento_id`)
);

ALTER TABLE `Equipamento_DadosOrdemTrabalho` ADD FOREIGN KEY (`Equipamento_id`) REFERENCES `Equipamento` (`id`);

ALTER TABLE `Equipamento_DadosOrdemTrabalho` ADD FOREIGN KEY (`DadosOrdemTrabalho_equipamento_id`) REFERENCES `DadosOrdemTrabalho` (`equipamento_id`);


ALTER TABLE `DadosOrdemTrabalho` ADD FOREIGN KEY (`status_reparo_id`) REFERENCES `StatusReparo` (`id`);

ALTER TABLE `Endereco` ADD FOREIGN KEY (`bairro_id`) REFERENCES `Bairro` (`id`);

ALTER TABLE `Cidade` ADD FOREIGN KEY (`estado_id`) REFERENCES `Estado` (`id`);

ALTER TABLE `Cidadao` ADD FOREIGN KEY (`cargo_id`) REFERENCES `Cargo` (`id`);

ALTER TABLE `Cidadao` ADD FOREIGN KEY (`escolaridade_id`) REFERENCES `Escolaridade` (`id`);

ALTER TABLE `Cidadao` ADD FOREIGN KEY (`estado_civil_id`) REFERENCES `EstadoCivil` (`id`);

ALTER TABLE `Cidadao` ADD FOREIGN KEY (`genero_id`) REFERENCES `Genero` (`id`);

ALTER TABLE `Cidadao` ADD FOREIGN KEY (`naturalidade_id`) REFERENCES `Naturalidade` (`id`);

ALTER TABLE `Cidadao` ADD FOREIGN KEY (`endereco_id`) REFERENCES `Endereco` (`id`);

CREATE TABLE `Cidadao_DanosOcorridos` (
  `Cidadao_cpf` integer NOT NULL,
  `DanosOcorridos_cidadao_id` integer NOT NULL,
  PRIMARY KEY (`Cidadao_cpf`, `DanosOcorridos_cidadao_id`)
);

ALTER TABLE `Cidadao_DanosOcorridos` ADD FOREIGN KEY (`Cidadao_cpf`) REFERENCES `Cidadao` (`cpf`);

ALTER TABLE `Cidadao_DanosOcorridos` ADD FOREIGN KEY (`DanosOcorridos_cidadao_id`) REFERENCES `DanosOcorridos` (`cidadao_id`);


ALTER TABLE `DanosOcorridos` ADD FOREIGN KEY (`tipo_dano_id`) REFERENCES `TipoDano` (`id`);

ALTER TABLE `Telefone` ADD FOREIGN KEY (`usuario_id`) REFERENCES `Cidadao` (`cpf`);

ALTER TABLE `Email` ADD FOREIGN KEY (`usuario_id`) REFERENCES `Cidadao` (`cpf`);
