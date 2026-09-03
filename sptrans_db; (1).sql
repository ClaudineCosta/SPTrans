-- Criar banco de dados
CREATE DATABASE sptrans_db;

-- Usar o banco
USE sptrans_db;

-- Tabela Linha
CREATE TABLE linha (
    id_linha INT PRIMARY KEY AUTO_INCREMENT,
    numero_linha VARCHAR(10) NOT NULL,   -- Ex.: 971R-10
    nome_linha VARCHAR(100) NOT NULL,    -- Ex.: Jd. Primavera - Santana
    origem VARCHAR(100) NOT NULL,        -- Ponto inicial
    destino VARCHAR(100) NOT NULL,       -- Ponto final
    qtde_frota INT NOT NULL              -- Quantidade de veículos alocados
);

-- Tabela Veículo
CREATE TABLE veiculo (
    id_veiculo INT PRIMARY KEY AUTO_INCREMENT,
    prefixo INT NOT NULL,            -- codigo operacional do onibus
    fabricante VARCHAR(50) NOT NULL,     -- Ex.: Mercedes-Benz
    modelo VARCHAR(50) NOT NULL,         -- Ex.: Caio Apache Vip
    tipo VARCHAR(20) NOT NULL,               -- Ex.: Convencional, Articulado, Micro
    capacidade_sentados INT NOT NULL,
    capacidade_em_pe INT NOT NULL
);

-- Tabela Operação
CREATE TABLE operacao (
    id_operacao INT PRIMARY KEY AUTO_INCREMENT,
    id_linha INT NOT NULL,
    id_veiculo INT NOT NULL,
    data_operacao DATE NOT NULL,
    horario_programado TIME NOT NULL,
    horario_real TIME NOT NULL,
    sentido ENUM ("ida", "volta") NOT NULL,
    FOREIGN KEY (id_linha) REFERENCES linha(id_linha),
    FOREIGN KEY (id_veiculo) REFERENCES veiculo(id_veiculo)
);


-- Inserindo linhas da Zona Norte (Consórcio Norte 2 - Sambaíba) = 30 linhas

INSERT INTO linha (numero_linha, nome_linha, origem, destino, qtde_frota)
VALUES
-- Santana
('971C-10', 'Brasilândia - Metrô Santana', 'Brasilândia', 'Metrô Santana', 7),
('971D-10', 'Center Norte - Metrô Santana', 'Center Norte', 'Metrô Santana', 6),
('971M-10', 'Vila Penteado - Metrô Santana', 'Vila Penteado', 'Metrô Santana', 8),
('971R-10', 'Jaraguá - Metrô Santana', 'Jaraguá', 'Metrô Santana', 9),
('174M-10', 'Jardim Brasil - Metrô Santana', 'Jardim Brasil', 'Metrô Santana', 6),
('175T-10', 'Jardim Damasceno - Metrô Santana', 'Jardim Damasceno', 'Metrô Santana', 7),
('178L-10', 'Lauzane Paulista - Metrô Santana', 'Lauzane Paulista', 'Metrô Santana', 8),
('271M-10', 'Parque Novo Mundo - Metrô Santana', 'Parque Novo Mundo', 'Metrô Santana', 7),
('1726-10', 'Limão - Metrô Santana', 'Limão', 'Metrô Santana', 6),
('1731-10', 'Vila Medeiros - Metrô Santana', 'Vila Medeiros', 'Metrô Santana', 6),

-- Tucuruvi
('971A-10', 'Tucuruvi - Jardim Tremembé', 'Terminal Tucuruvi', 'Tremembé', 7),
('971B-10', 'Tucuruvi - Cachoeirinha', 'Terminal Tucuruvi', 'Cachoeirinha', 8),
('971E-10', 'Tucuruvi - Jaçanã', 'Terminal Tucuruvi', 'Jaçanã', 8),
('971F-10', 'Tucuruvi - Vila Medeiros', 'Terminal Tucuruvi', 'Vila Medeiros', 7),
('971G-10', 'Tucuruvi - Tremembé', 'Terminal Tucuruvi', 'Tremembé', 6),
('971H-10', 'Tucuruvi - Vila Guilherme', 'Terminal Tucuruvi', 'Vila Guilherme', 7),
('971J-10', 'Tucuruvi - Casa Verde', 'Terminal Tucuruvi', 'Casa Verde', 8),
('971K-10', 'Tucuruvi - Santana', 'Terminal Tucuruvi', 'Metrô Santana', 9),
('972K-10', 'Tucuruvi - Brasilândia', 'Terminal Tucuruvi', 'Brasilândia', 7),
('972E-10', 'Tucuruvi - Mandaqui', 'Terminal Tucuruvi', 'Mandaqui', 8),

-- Jaçanã
('971L-10', 'Jaçanã - Santana', 'Jaçanã', 'Metrô Santana', 8),
('971M-10', 'Jaçanã - Tucuruvi', 'Jaçanã', 'Terminal Tucuruvi', 8),
('971N-10', 'Jaçanã - Cachoeirinha', 'Jaçanã', 'Cachoeirinha', 7),
('971P-10', 'Jaçanã - Limão', 'Jaçanã', 'Limão', 7),
('973K-10', 'Jaçanã - Mandaqui', 'Jaçanã', 'Mandaqui', 7),

-- Casa Verde
('972A-10', 'Casa Verde - Santana', 'Casa Verde', 'Metrô Santana', 7),
('972B-10', 'Casa Verde - Tucuruvi', 'Casa Verde', 'Terminal Tucuruvi', 7),
('972C-10', 'Casa Verde - Cachoeirinha', 'Casa Verde', 'Cachoeirinha', 8),
('972D-10', 'Casa Verde - Limão', 'Casa Verde', 'Limão', 6),
('972F-10', 'Casa Verde - Mandaqui', 'Casa Verde', 'Mandaqui', 7);



-- Inserindo veículos da frota Sambaíba (Zona Norte) = 217 veiculos (36% da operação)

INSERT INTO veiculo (prefixo, fabricante, modelo, tipo, capacidade_sentados, capacidade_em_pe)
VALUES
-- 120 convencionais:
('71001', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71002', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71003', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71004', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71005', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71006', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71007', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71008', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71009', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71010', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71011', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71012', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71013', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71014', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71015', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71016', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71017', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71018', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71019', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71020', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71021', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71022', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71023', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71024', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71025', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71026', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71027', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71028', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71029', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71030', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71031', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71032', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71033', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71034', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71035', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71036', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71037', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71038', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71039', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71040', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71041', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71042', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71043', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71044', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71045', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71046', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71047', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71048', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71049', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71050', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71051', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71052', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71053', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71054', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71055', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71056', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71057', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71058', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71059', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71060', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71061', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71062', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71063', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71064', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71065', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71066', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71067', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71068', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71069', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71070', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71071', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71072', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71073', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71074', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71075', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71076', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71077', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71078', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71079', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71080', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71081', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71082', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71083', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71084', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71085', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71086', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71087', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71088', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71089', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71090', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71091', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71092', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71093', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71094', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71095', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71096', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71097', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71098', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71099', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71100', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71101', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71102', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71103', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71104', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71105', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71106', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71107', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71108', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71109', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71110', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71111', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71112', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71113', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71114', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71115', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71116', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71117', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71118', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71119', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42),
('71120', 'Mercedes-Benz', 'Caio Apache Vip IV', 'Convencional', 38, 42);

--  75 Articulados
-- Articulados (Caio Millennium IV) - Bloco 4
INSERT INTO veiculo (prefixo, fabricante, modelo, tipo, capacidade_sentados, capacidade_em_pe)
VALUES
('72001', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72002', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72003', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72004', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72005', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72006', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72007', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72008', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72009', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72010', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72011', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72012', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72013', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72014', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72015', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72016', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72017', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72018', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72019', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72020', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72021', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72022', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72023', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72024', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72025', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72026', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72027', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72028', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72029', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72030', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72031', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72032', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72033', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72034', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72035', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72036', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72037', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72038', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72039', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72040', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72041', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72042', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72043', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72044', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72045', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72046', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72047', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72048', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72049', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72050', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72051', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72052', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72053', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72054', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72055', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72056', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72057', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72058', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72059', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72060', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72061', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72062', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72063', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72064', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72065', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72066', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72067', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72068', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72069', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72070', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72071', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72072', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72073', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72074', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
('72075', 'Mercedes-Benz', 'Caio Millennium IV', 'Articulado', 52, 78),
--  12 Micro-ônibus
('73001', 'Mercedes-Benz', 'Caio F2400', 'Micro', 24, 20),
('73002', 'Mercedes-Benz', 'Caio F2400', 'Micro', 24, 20),
('73003', 'Mercedes-Benz', 'Caio F2400', 'Micro', 24, 20),
('73004', 'Mercedes-Benz', 'Caio F2400', 'Micro', 24, 20),
('73005', 'Mercedes-Benz', 'Caio F2400', 'Micro', 24, 20),
('73006', 'Mercedes-Benz', 'Caio F2400', 'Micro', 24, 20),
('73007', 'Mercedes-Benz', 'Caio F2400', 'Micro', 24, 20),
('73008', 'Mercedes-Benz', 'Caio F2400', 'Micro', 24, 20),
('73009', 'Mercedes-Benz', 'Caio F2400', 'Micro', 24, 20),
('73010', 'Mercedes-Benz', 'Caio F2400', 'Micro', 24, 20),
('73011', 'Mercedes-Benz', 'Caio F2400', 'Micro', 24, 20),
('73012', 'Mercedes-Benz', 'Caio F2400', 'Micro', 24, 20),
-- 10  Elétricos
('74001', 'Mercedes-Benz', 'Marcopolo Attivi', 'Elétrico', 40, 40),
('74002', 'Mercedes-Benz', 'Marcopolo Attivi', 'Elétrico', 40, 40),
('74003', 'Mercedes-Benz', 'Marcopolo Attivi', 'Elétrico', 40, 40),
('74004', 'Mercedes-Benz', 'Marcopolo Attivi', 'Elétrico', 40, 40),
('74005', 'Mercedes-Benz', 'Marcopolo Attivi', 'Elétrico', 40, 40),
('74006', 'Mercedes-Benz', 'Marcopolo Attivi', 'Elétrico', 40, 40),
('74007', 'Mercedes-Benz', 'Marcopolo Attivi', 'Elétrico', 40, 40),
('74008', 'Mercedes-Benz', 'Marcopolo Attivi', 'Elétrico', 40, 40),
('74009', 'Mercedes-Benz', 'Marcopolo Attivi', 'Elétrico', 40, 40),
('74010', 'Mercedes-Benz', 'Marcopolo Attivi', 'Elétrico', 40, 40);



-- operação – dados do dia 06 de agosto de 2026 – quinta-feira



INSERT INTO operacao ( id_linha, id_veiculo, data_operacao, horario_programado, horario_real, sentido
) VALUES
-- '971C-10', 'Brasilândia - Metrô Santana', 7 onibus, 63 viagens
-- Turno MANHÃ
-- Primeira rodada (05h00–06h30)
(1, 1, '2026-08-06', '05:00:00', '05:02:00', 'ida'),       -- Santana → Brasilândia
(1, 2, '2026-08-06', '05:15:00', '05:20:00', 'volta'),     -- Brasilândia → Santana
(1, 3, '2026-08-06', '05:30:00', '05:32:00', 'ida'),
(1, 4, '2026-08-06', '05:45:00', '05:55:00', 'volta'),
(1, 5, '2026-08-06', '06:00:00', '06:12:00', 'ida'),
(1, 6, '2026-08-06', '06:15:00', '06:25:00', 'volta'),
(1, 7, '2026-08-06', '06:30:00', '06:40:00', 'ida'),
-- Segunda rodada (07h30–09h15)
(1, 1, '2026-08-06', '07:30:00', '07:40:00', 'volta'),
(1, 2, '2026-08-06', '07:45:00', '07:55:00', 'ida'),
(1, 3, '2026-08-06', '08:00:00', '08:08:00', 'volta'),
(1, 4, '2026-08-06', '08:15:00', '08:25:00', 'ida'),
(1, 5, '2026-08-06', '08:30:00', '08:40:00', 'volta'),
(1, 6, '2026-08-06', '08:45:00', '08:55:00', 'ida'),
(1, 7, '2026-08-06', '09:00:00', '09:12:00', 'volta'),
-- Terceira rodada (10h30–12h00)
(1, 1, '2026-08-06', '10:30:00', '10:33:00', 'ida'),
(1, 2, '2026-08-06', '10:45:00', '10:45:00', 'volta'),
(1, 3, '2026-08-06', '11:00:00', '11:02:00', 'ida'),
(1, 4, '2026-08-06', '11:15:00', '11:15:00', 'volta'),
(1, 5, '2026-08-06', '11:30:00', '11:32:00', 'ida'),
(1, 6, '2026-08-06', '11:45:00', '11:46:00', 'volta'),
(1, 7, '2026-08-06', '12:00:00', '12:02:00', 'ida'),
-- Turno TARDE
-- Primeira rodada (12h40–13h30)
(1, 1, '2026-08-06', '12:40:00', '12:42:00', 'ida'),
(1, 2, '2026-08-06', '12:55:00', '12:58:00', 'volta'),
(1, 3, '2026-08-06', '13:10:00', '13:12:00', 'ida'),
(1, 4, '2026-08-06', '13:25:00', '13:30:00', 'volta'),
(1, 5, '2026-08-06', '13:40:00', '13:43:00', 'ida'),
(1, 6, '2026-08-06', '13:55:00', '13:58:00', 'volta'),
(1, 7, '2026-08-06', '14:10:00', '14:15:00', 'ida'),
-- Segunda rodada (15h00–16h00)
(1, 1, '2026-08-06', '15:00:00', '15:05:00', 'volta'),
(1, 2, '2026-08-06', '15:15:00', '15:20:00', 'ida'),
(1, 3, '2026-08-06', '15:30:00', '15:35:00', 'volta'),
(1, 4, '2026-08-06', '15:45:00', '15:50:00', 'ida'),
(1, 5, '2026-08-06', '16:00:00', '16:05:00', 'volta'),
(1, 6, '2026-08-06', '16:15:00', '16:20:00', 'ida'),
(1, 7, '2026-08-06', '16:30:00', '16:35:00', 'volta'),
-- Terceira rodada (17h30–19h00, pico da tarde)
(1, 1, '2026-08-06', '17:30:00', '17:40:00', 'ida'),
(1, 2, '2026-08-06', '17:45:00', '17:55:00', 'volta'),
(1, 3, '2026-08-06', '18:00:00', '18:08:00', 'ida'),
(1, 4, '2026-08-06', '18:15:00', '18:22:00', 'volta'),
(1, 5, '2026-08-06', '18:30:00', '18:38:00', 'ida'),
(1, 6, '2026-08-06', '18:45:00', '18:52:00', 'volta'),
(1, 7, '2026-08-06', '19:00:00', '19:10:00', 'ida'),
-- Turno NOITE
-- Primeira rodada (20h00–21h30, atrasos leves)
(1, 1, '2026-08-06', '20:00:00', '20:02:00', 'ida'),
(1, 2, '2026-08-06', '20:15:00', '20:18:00', 'volta'),
(1, 3, '2026-08-06', '20:30:00', '20:33:00', 'ida'),
(1, 4, '2026-08-06', '20:45:00', '20:47:00', 'volta'),
(1, 5, '2026-08-06', '21:00:00', '21:03:00', 'ida'),
(1, 6, '2026-08-06', '21:15:00', '21:18:00', 'volta'),
(1, 7, '2026-08-06', '21:30:00', '21:32:00', 'ida'),
-- Segunda rodada (22h00–23h00, pico universitário)
(1, 1, '2026-08-06', '22:00:00', '22:10:00', 'volta'),
(1, 2, '2026-08-06', '22:15:00', '22:25:00', 'ida'),
(1, 3, '2026-08-06', '22:30:00', '22:40:00', 'volta'),
(1, 4, '2026-08-06', '22:45:00', '22:55:00', 'ida'),
(1, 5, '2026-08-06', '23:00:00', '23:12:00', 'volta'),
(1, 6, '2026-08-06', '23:15:00', '23:25:00', 'ida'),
(1, 7, '2026-08-06', '23:30:00', '23:31:00', 'volta'),
-- Terceira rodada (02h00–03h20, atrasos leves)
(1, 1, '2026-08-07', '02:00:00', '02:03:00', 'ida'),       -- Santana → Brasilândia
(1, 2, '2026-08-07', '02:15:00', '02:16:00', 'volta'),     -- Brasilândia → Santana
(1, 3, '2026-08-07', '02:30:00', '02:30:00', 'ida'),
(1, 4, '2026-08-07', '02:45:00', '02:46:00', 'volta'),
(1, 5, '2026-08-07', '03:00:00', '03:03:00', 'ida'),
(1, 6, '2026-08-07', '03:15:00', '03:18:00', 'volta'),
(1, 7, '2026-08-07', '03:20:00', '03:23:00', 'ida');

-- '971D-10', 'Center Norte - Metrô Santana',  6 onibus, 54 viagens
INSERT INTO operacao ( id_linha, id_veiculo, data_operacao, horario_programado, horario_real, sentido) VALUES
-- Turno MANHÃ (05h00–09h15)
(2, 1, '2026-08-06', '05:00:00', '05:02:00', 'ida'),
(2, 2, '2026-08-06', '05:15:00', '05:20:00', 'volta'),
(2, 3, '2026-08-06', '05:30:00', '05:32:00', 'ida'),
(2, 4, '2026-08-06', '05:45:00', '05:55:00', 'volta'),
(2, 5, '2026-08-06', '06:00:00', '06:12:00', 'ida'),
(2, 6, '2026-08-06', '06:15:00', '06:25:00', 'volta'),

(2, 1, '2026-08-06', '07:30:00', '07:40:00', 'volta'),
(2, 2, '2026-08-06', '07:45:00', '07:55:00', 'ida'),
(2, 3, '2026-08-06', '08:00:00', '08:08:00', 'volta'),
(2, 4, '2026-08-06', '08:15:00', '08:25:00', 'ida'),
(2, 5, '2026-08-06', '08:30:00', '08:40:00', 'volta'),
(2, 6, '2026-08-06', '09:00:00', '09:12:00', 'ida'),
-- Turno TARDE (15h00–19h00)
(2, 1, '2026-08-06', '15:00:00', '15:05:00', 'volta'),
(2, 2, '2026-08-06', '15:15:00', '15:20:00', 'ida'),
(2, 3, '2026-08-06', '15:30:00', '15:35:00', 'volta'),
(2, 4, '2026-08-06', '15:45:00', '15:50:00', 'ida'),
(2, 5, '2026-08-06', '16:00:00', '16:05:00', 'volta'),
(2, 6, '2026-08-06', '16:15:00', '16:20:00', 'ida'),

(2, 1, '2026-08-06', '17:30:00', '17:40:00', 'ida'),
(2, 2, '2026-08-06', '17:45:00', '17:55:00', 'volta'),
(2, 3, '2026-08-06', '18:00:00', '18:08:00', 'ida'),
(2, 4, '2026-08-06', '18:15:00', '18:22:00', 'volta'),
(2, 5, '2026-08-06', '18:30:00', '18:38:00', 'ida'),
(2, 6, '2026-08-06', '18:45:00', '18:52:00', 'volta'),
-- Turno NOITE (22h00–03h20)
(2, 1, '2026-08-06', '22:00:00', '22:10:00', 'volta'),
(2, 2, '2026-08-06', '22:15:00', '22:25:00', 'ida'),
(2, 3, '2026-08-06', '22:30:00', '22:40:00', 'volta'),
(2, 4, '2026-08-06', '22:45:00', '22:55:00', 'ida'),
(2, 5, '2026-08-06', '23:00:00', '23:12:00', 'volta'),
(2, 6, '2026-08-06', '23:15:00', '23:25:00', 'ida'),

(2, 1, '2026-08-07', '02:00:00', '02:03:00', 'ida'),
(2, 2, '2026-08-07', '02:15:00', '02:18:00', 'volta'),
(2, 3, '2026-08-07', '02:30:00', '02:33:00', 'ida'),
(2, 4, '2026-08-07', '02:45:00', '02:48:00', 'volta'),
(2, 5, '2026-08-07', '03:00:00', '03:03:00', 'ida'),
(2, 6, '2026-08-07', '03:15:00', '03:18:00', 'volta');

-- '971M-10', 'Vila Penteado - Metrô Santana', 8 onibus, 72 viagens
INSERT INTO operacao (id_linha, id_veiculo, data_operacao, horario_programado, horario_real, sentido) VALUES
-- Turno MANHÃ (05h00–09h15)
(3, 1, '2026-08-06', '05:00:00', '05:10:00', 'ida'),
(3, 2, '2026-08-06', '05:15:00', '05:25:00', 'volta'),
(3, 3, '2026-08-06', '05:30:00', '05:40:00', 'ida'),
(3, 4, '2026-08-06', '05:45:00', '05:55:00', 'volta'),
(3, 5, '2026-08-06', '06:00:00', '06:12:00', 'ida'),
(3, 6, '2026-08-06', '06:15:00', '06:25:00', 'volta'),
(3, 7, '2026-08-06', '06:30:00', '06:42:00', 'ida'),
(3, 8, '2026-08-06', '06:45:00', '06:55:00', 'volta'),

(3, 1, '2026-08-06', '07:30:00', '07:40:00', 'volta'),
(3, 2, '2026-08-06', '07:45:00', '07:55:00', 'ida'),
(3, 3, '2026-08-06', '08:00:00', '08:10:00', 'volta'),
(3, 4, '2026-08-06', '08:15:00', '08:25:00', 'ida'),
(3, 5, '2026-08-06', '08:30:00', '08:40:00', 'volta'),
(3, 6, '2026-08-06', '08:45:00', '08:55:00', 'ida'),
(3, 7, '2026-08-06', '09:00:00', '09:12:00', 'volta'),
(3, 8, '2026-08-06', '09:15:00', '09:25:00', 'ida'),

-- Turno TARDE (15h00–19h00)
(3, 1, '2026-08-06', '15:00:00', '15:05:00', 'volta'),
(3, 2, '2026-08-06', '15:15:00', '15:20:00', 'ida'),
(3, 3, '2026-08-06', '15:30:00', '15:35:00', 'volta'),
(3, 4, '2026-08-06', '15:45:00', '15:50:00', 'ida'),
(3, 5, '2026-08-06', '16:00:00', '16:05:00', 'volta'),
(3, 6, '2026-08-06', '16:15:00', '16:20:00', 'ida'),
(3, 7, '2026-08-06', '16:30:00', '16:35:00', 'volta'),
(3, 8, '2026-08-06', '16:45:00', '16:55:00', 'ida'),

(3, 1, '2026-08-06', '17:30:00', '17:40:00', 'ida'),
(3, 2, '2026-08-06', '17:45:00', '17:55:00', 'volta'),
(3, 3, '2026-08-06', '18:00:00', '18:08:00', 'ida'),
(3, 4, '2026-08-06', '18:15:00', '18:22:00', 'volta'),
(3, 5, '2026-08-06', '18:30:00', '18:38:00', 'ida'),
(3, 6, '2026-08-06', '18:45:00', '18:52:00', 'volta'),
(3, 7, '2026-08-06', '19:00:00', '19:10:00', 'ida'),
(3, 8, '2026-08-06', '19:15:00', '19:25:00', 'volta'),

-- Turno NOITE (22h00–03h20)
(3, 1, '2026-08-06', '22:00:00', '22:10:00', 'volta'),
(3, 2, '2026-08-06', '22:15:00', '22:25:00', 'ida'),
(3, 3, '2026-08-06', '22:30:00', '22:40:00', 'volta'),
(3, 4, '2026-08-06', '22:45:00', '22:55:00', 'ida'),
(3, 5, '2026-08-06', '23:00:00', '23:12:00', 'volta'),
(3, 6, '2026-08-06', '23:15:00', '23:25:00', 'ida'),
(3, 7, '2026-08-06', '23:30:00', '23:40:00', 'volta'),
(3, 8, '2026-08-06', '23:45:00', '23:55:00', 'ida'),

(3, 1, '2026-08-07', '02:00:00', '02:03:00', 'ida'),
(3, 2, '2026-08-07', '02:15:00', '02:18:00', 'volta'),
(3, 3, '2026-08-07', '02:30:00', '02:33:00', 'ida'),
(3, 4, '2026-08-07', '02:45:00', '02:48:00', 'volta'),
(3, 5, '2026-08-07', '03:00:00', '03:03:00', 'ida'),
(3, 6, '2026-08-07', '03:15:00', '03:18:00', 'volta'),
(3, 7, '2026-08-07', '03:20:00', '03:23:00', 'ida'),
(3, 8, '2026-08-07', '03:30:00', '03:35:00', 'volta');


-- '971R-10', 'Jaraguá - Metrô Santana', 9 onibus, 81 viagens
INSERT INTO operacao (id_linha, id_veiculo, data_operacao, horario_programado, horario_real, sentido) VALUES
-- Turno MANHÃ (05h00–09h15)
(4, 1, '2026-08-06', '05:00:00', '05:10:00', 'ida'),
(4, 2, '2026-08-06', '05:15:00', '05:25:00', 'volta'),
(4, 3, '2026-08-06', '05:30:00', '05:40:00', 'ida'),
(4, 4, '2026-08-06', '05:45:00', '05:55:00', 'volta'),
(4, 5, '2026-08-06', '06:00:00', '06:12:00', 'ida'),
(4, 6, '2026-08-06', '06:15:00', '06:25:00', 'volta'),
(4, 7, '2026-08-06', '06:30:00', '06:42:00', 'ida'),
(4, 8, '2026-08-06', '06:45:00', '06:55:00', 'volta'),
(4, 9, '2026-08-06', '07:00:00', '07:12:00', 'ida'),

(4, 1, '2026-08-06', '07:30:00', '07:40:00', 'volta'),
(4, 2, '2026-08-06', '07:45:00', '07:55:00', 'ida'),
(4, 3, '2026-08-06', '08:00:00', '08:10:00', 'volta'),
(4, 4, '2026-08-06', '08:15:00', '08:25:00', 'ida'),
(4, 5, '2026-08-06', '08:30:00', '08:40:00', 'volta'),
(4, 6, '2026-08-06', '08:45:00', '08:55:00', 'ida'),
(4, 7, '2026-08-06', '09:00:00', '09:12:00', 'volta'),
(4, 8, '2026-08-06', '09:15:00', '09:25:00', 'ida'),
(4, 9, '2026-08-06', '09:30:00', '09:40:00', 'volta'),

-- Turno TARDE (15h00–19h00)
(4, 1, '2026-08-06', '15:00:00', '15:05:00', 'volta'),
(4, 2, '2026-08-06', '15:15:00', '15:20:00', 'ida'),
(4, 3, '2026-08-06', '15:30:00', '15:35:00', 'volta'),
(4, 4, '2026-08-06', '15:45:00', '15:50:00', 'ida'),
(4, 5, '2026-08-06', '16:00:00', '16:05:00', 'volta'),
(4, 6, '2026-08-06', '16:15:00', '16:20:00', 'ida'),
(4, 7, '2026-08-06', '16:30:00', '16:35:00', 'volta'),
(4, 8, '2026-08-06', '16:45:00', '16:55:00', 'ida'),
(4, 9, '2026-08-06', '17:00:00', '17:10:00', 'volta'),

(4, 1, '2026-08-06', '17:30:00', '17:40:00', 'ida'),
(4, 2, '2026-08-06', '17:45:00', '17:55:00', 'volta'),
(4, 3, '2026-08-06', '18:00:00', '18:08:00', 'ida'),
(4, 4, '2026-08-06', '18:15:00', '18:22:00', 'volta'),
(4, 5, '2026-08-06', '18:30:00', '18:38:00', 'ida'),
(4, 6, '2026-08-06', '18:45:00', '18:52:00', 'volta'),
(4, 7, '2026-08-06', '19:00:00', '19:10:00', 'ida'),
(4, 8, '2026-08-06', '19:15:00', '19:25:00', 'volta'),
(4, 9, '2026-08-06', '19:30:00', '19:40:00', 'ida'),

-- Turno NOITE (22h00–03h20)
(4, 1, '2026-08-06', '22:00:00', '22:10:00', 'volta'),
(4, 2, '2026-08-06', '22:15:00', '22:25:00', 'ida'),
(4, 3, '2026-08-06', '22:30:00', '22:40:00', 'volta'),
(4, 4, '2026-08-06', '22:45:00', '22:55:00', 'ida'),
(4, 5, '2026-08-06', '23:00:00', '23:12:00', 'volta'),
(4, 6, '2026-08-06', '23:15:00', '23:25:00', 'ida'),
(4, 7, '2026-08-06', '23:30:00', '23:40:00', 'volta'),
(4, 8, '2026-08-06', '23:45:00', '23:55:00', 'ida'),
(4, 9, '2026-08-06', '00:00:00', '00:10:00', 'volta'),

(4, 1, '2026-08-07', '02:00:00', '02:03:00', 'ida'),
(4, 2, '2026-08-07', '02:15:00', '02:18:00', 'volta'),
(4, 3, '2026-08-07', '02:30:00', '02:33:00', 'ida'),
(4, 4, '2026-08-07', '02:45:00', '02:48:00', 'volta'),
(4, 5, '2026-08-07', '03:00:00', '03:03:00', 'ida'),
(4, 6, '2026-08-07', '03:15:00', '03:18:00', 'volta'),
(4, 7, '2026-08-07', '03:20:00', '03:23:00', 'ida'),
(4, 8, '2026-08-07', '03:30:00', '03:35:00', 'volta'),
(4, 9, '2026-08-07', '03:45:00', '03:50:00', 'ida');

-- '174M-10', 'Jardim Brasil - Metrô Santana', 6 onibus, 54 viagens
INSERT INTO operacao (id_linha, id_veiculo, data_operacao,horario_programado, horario_real, sentido) VALUES
-- Turno MANHÃ (05h00–09h15)
(5, 1, '2026-08-06', '05:00:00', '05:10:00', 'ida'),
(5, 2, '2026-08-06', '05:15:00', '05:25:00', 'volta'),
(5, 3, '2026-08-06', '05:30:00', '05:40:00', 'ida'),
(5, 4, '2026-08-06', '05:45:00', '05:55:00', 'volta'),
(5, 5, '2026-08-06', '06:00:00', '06:12:00', 'ida'),
(5, 6, '2026-08-06', '06:15:00', '06:25:00', 'volta'),

(5, 1, '2026-08-06', '07:30:00', '07:40:00', 'volta'),
(5, 2, '2026-08-06', '07:45:00', '07:55:00', 'ida'),
(5, 3, '2026-08-06', '08:00:00', '08:10:00', 'volta'),
(5, 4, '2026-08-06', '08:15:00', '08:25:00', 'ida'),
(5, 5, '2026-08-06', '08:30:00', '08:40:00', 'volta'),
(5, 6, '2026-08-06', '09:00:00', '09:12:00', 'ida'),

-- Turno TARDE (15h00–19h00)
(5, 1, '2026-08-06', '15:00:00', '15:05:00', 'volta'),
(5, 2, '2026-08-06', '15:15:00', '15:20:00', 'ida'),
(5, 3, '2026-08-06', '15:30:00', '15:35:00', 'volta'),
(5, 4, '2026-08-06', '15:45:00', '15:50:00', 'ida'),
(5, 5, '2026-08-06', '16:00:00', '16:05:00', 'volta'),
(5, 6, '2026-08-06', '16:15:00', '16:20:00', 'ida'),

(5, 1, '2026-08-06', '17:30:00', '17:40:00', 'ida'),
(5, 2, '2026-08-06', '17:45:00', '17:55:00', 'volta'),
(5, 3, '2026-08-06', '18:00:00', '18:08:00', 'ida'),
(5, 4, '2026-08-06', '18:15:00', '18:22:00', 'volta'),
(5, 5, '2026-08-06', '18:30:00', '18:38:00', 'ida'),
(5, 6, '2026-08-06', '18:45:00', '18:52:00', 'volta'),

-- Turno NOITE (22h00–03h20)
(5, 1, '2026-08-06', '22:00:00', '22:10:00', 'volta'),
(5, 2, '2026-08-06', '22:15:00', '22:25:00', 'ida'),
(5, 3, '2026-08-06', '22:30:00', '22:40:00', 'volta'),
(5, 4, '2026-08-06', '22:45:00', '22:55:00', 'ida'),
(5, 5, '2026-08-06', '23:00:00', '23:12:00', 'volta'),
(5, 6, '2026-08-06', '23:15:00', '23:25:00', 'ida'),

(5, 1, '2026-08-07', '02:00:00', '02:03:00', 'ida'),
(5, 2, '2026-08-07', '02:15:00', '02:18:00', 'volta'),
(5, 3, '2026-08-07', '02:30:00', '02:33:00', 'ida'),
(5, 4, '2026-08-07', '02:45:00', '02:48:00', 'volta'),
(5, 5, '2026-08-07', '03:00:00', '03:03:00', 'ida'),
(5, 6, '2026-08-07', '03:15:00', '03:18:00', 'volta');

-- ‘175T-10', 'Jardim Damasceno - Metrô Santana', 7 onibus, 63 viagens
INSERT INTO operacao ( id_linha, id_veiculo, data_operacao,horario_programado, horario_real, sentido) VALUES
-- Turno MANHÃ (05h00–09h15)
(6, 1, '2026-08-06', '05:00:00', '05:10:00', 'ida'),
(6, 2, '2026-08-06', '05:15:00', '05:25:00', 'volta'),
(6, 3, '2026-08-06', '05:30:00', '05:40:00', 'ida'),
(6, 4, '2026-08-06', '05:45:00', '05:55:00', 'volta'),
(6, 5, '2026-08-06', '06:00:00', '06:12:00', 'ida'),
(6, 6, '2026-08-06', '06:15:00', '06:25:00', 'volta'),
(6, 7, '2026-08-06', '06:30:00', '06:42:00', 'ida'),

(6, 1, '2026-08-06', '07:30:00', '07:40:00', 'volta'),
(6, 2, '2026-08-06', '07:45:00', '07:55:00', 'ida'),
(6, 3, '2026-08-06', '08:00:00', '08:10:00', 'volta'),
(6, 4, '2026-08-06', '08:15:00', '08:25:00', 'ida'),
(6, 5, '2026-08-06', '08:30:00', '08:40:00', 'volta'),
(6, 6, '2026-08-06', '08:45:00', '08:55:00', 'ida'),
(6, 7, '2026-08-06', '09:00:00', '09:12:00', 'volta'),

-- Turno TARDE (15h00–19h00)
(6, 1, '2026-08-06', '15:00:00', '15:05:00', 'volta'),
(6, 2, '2026-08-06', '15:15:00', '15:20:00', 'ida'),
(6, 3, '2026-08-06', '15:30:00', '15:35:00', 'volta'),
(6, 4, '2026-08-06', '15:45:00', '15:50:00', 'ida'),
(6, 5, '2026-08-06', '16:00:00', '16:05:00', 'volta'),
(6, 6, '2026-08-06', '16:15:00', '16:20:00', 'ida'),
(6, 7, '2026-08-06', '16:30:00', '16:35:00', 'volta'),

(6, 1, '2026-08-06', '17:30:00', '17:40:00', 'ida'),
(6, 2, '2026-08-06', '17:45:00', '17:55:00', 'volta'),
(6, 3, '2026-08-06', '18:00:00', '18:08:00', 'ida'),
(6, 4, '2026-08-06', '18:15:00', '18:22:00', 'volta'),
(6, 5, '2026-08-06', '18:30:00', '18:38:00', 'ida'),
(6, 6, '2026-08-06', '18:45:00', '18:52:00', 'volta'),
(6, 7, '2026-08-06', '19:00:00', '19:10:00', 'ida'),

-- Turno NOITE (22h00–03h20)
(6, 1, '2026-08-06', '22:00:00', '22:10:00', 'volta'),
(6, 2, '2026-08-06', '22:15:00', '22:25:00', 'ida'),
(6, 3, '2026-08-06', '22:30:00', '22:40:00', 'volta'),
(6, 4, '2026-08-06', '22:45:00', '22:55:00', 'ida'),
(6, 5, '2026-08-06', '23:00:00', '23:12:00', 'volta'),
(6, 6, '2026-08-06', '23:15:00', '23:25:00', 'ida'),
(6, 7, '2026-08-06', '23:30:00', '23:40:00', 'volta'),

(6, 1, '2026-08-07', '02:00:00', '02:03:00', 'ida'),
(6, 2, '2026-08-07', '02:15:00', '02:18:00', 'volta'),
(6, 3, '2026-08-07', '02:30:00', '02:33:00', 'ida'),
(6, 4, '2026-08-07', '02:45:00', '02:48:00', 'volta'),
(6, 5, '2026-08-07', '03:00:00', '03:03:00', 'ida'),
(6, 6, '2026-08-07', '03:15:00', '03:18:00', 'volta'),
(6, 7, '2026-08-07', '03:20:00', '03:23:00', 'ida');

-- '178L-10', 'Lauzane Paulista - Metrô Santana', 8onibus, 72 viagens
INSERT INTO operacao (id_linha, id_veiculo, data_operacao,horario_programado, horario_real, sentido) VALUES
-- Turno MANHÃ (05h00–09h15) com atrasos mais pesados
(7, 1, '2026-08-06', '05:00:00', '05:12:00', 'ida'),
(7, 2, '2026-08-06', '05:15:00', '05:30:00', 'volta'), -- atraso forte
(7, 3, '2026-08-06', '05:30:00', '05:40:00', 'ida'),
(7, 4, '2026-08-06', '05:45:00', '06:00:00', 'volta'), -- atraso forte
(7, 5, '2026-08-06', '06:00:00', '06:15:00', 'ida'),
(7, 6, '2026-08-06', '06:15:00', '06:28:00', 'volta'),
(7, 7, '2026-08-06', '06:30:00', '06:45:00', 'ida'),
(7, 8, '2026-08-06', '06:45:00', '07:00:00', 'volta'),

(7, 1, '2026-08-06', '07:30:00', '07:45:00', 'volta'),
(7, 2, '2026-08-06', '07:45:00', '08:00:00', 'ida'),
(7, 3, '2026-08-06', '08:00:00', '08:15:00', 'volta'),
(7, 4, '2026-08-06', '08:15:00', '08:30:00', 'ida'),
(7, 5, '2026-08-06', '08:30:00', '08:45:00', 'volta'),
(7, 6, '2026-08-06', '08:45:00', '09:00:00', 'ida'),
(7, 7, '2026-08-06', '09:00:00', '09:15:00', 'volta'),
(7, 8, '2026-08-06', '09:15:00', '09:30:00', 'ida'),

-- Turno TARDE (15h00–19h00) com atrasos médios
(7, 1, '2026-08-06', '15:00:00', '15:08:00', 'volta'),
(7, 2, '2026-08-06', '15:15:00', '15:25:00', 'ida'),
(7, 3, '2026-08-06', '15:30:00', '15:40:00', 'volta'),
(7, 4, '2026-08-06', '15:45:00', '15:55:00', 'ida'),
(7, 5, '2026-08-06', '16:00:00', '16:10:00', 'volta'),
(7, 6, '2026-08-06', '16:15:00', '16:25:00', 'ida'),
(7, 7, '2026-08-06', '16:30:00', '16:40:00', 'volta'),
(7, 8, '2026-08-06', '16:45:00', '16:55:00', 'ida'),

(7, 1, '2026-08-06', '17:30:00', '17:45:00', 'ida'),
(7, 2, '2026-08-06', '17:45:00', '18:00:00', 'volta'),
(7, 3, '2026-08-06', '18:00:00', '18:12:00', 'ida'),
(7, 4, '2026-08-06', '18:15:00', '18:28:00', 'volta'),
(7, 5, '2026-08-06', '18:30:00', '18:42:00', 'ida'),
(7, 6, '2026-08-06', '18:45:00', '18:55:00', 'volta'),
(7, 7, '2026-08-06', '19:00:00', '19:12:00', 'ida'),
(7, 8, '2026-08-06', '19:15:00', '19:25:00', 'volta'),

-- Turno NOITE (22h00–03h20) com atrasos fortes
(7, 1, '2026-08-06', '22:00:00', '22:15:00', 'volta'), -- atraso forte
(7, 2, '2026-08-06', '22:15:00', '22:30:00', 'ida'),
(7, 3, '2026-08-06', '22:30:00', '22:45:00', 'volta'),
(7, 4, '2026-08-06', '22:45:00', '23:00:00', 'ida'),
(7, 5, '2026-08-06', '23:00:00', '23:15:00', 'volta'),
(7, 6, '2026-08-06', '23:15:00', '23:30:00', 'ida'),
(7, 7, '2026-08-06', '23:30:00', '23:45:00', 'volta'),
(7, 8, '2026-08-06', '23:45:00', '00:00:00', 'ida'),

(7, 1, '2026-08-07', '02:00:00', '02:15:00', 'ida'), -- atraso forte
(7, 2, '2026-08-07', '02:15:00', '02:25:00', 'volta'),
(7, 3, '2026-08-07', '02:30:00', '02:40:00', 'ida'),
(7, 4, '2026-08-07', '02:45:00', '02:55:00', 'volta'),
(7, 5, '2026-08-07', '03:00:00', '03:12:00', 'ida'),
(7, 6, '2026-08-07', '03:15:00', '03:25:00', 'volta'),
(7, 7, '2026-08-07', '03:20:00', '03:35:00', 'ida'), -- atraso forte
(7, 8, '2026-08-07', '03:30:00', '03:45:00', 'volta');

-- '271M-10', 'Parque Novo Mundo - Metrô Santana', 7onibus, 63 viagens
INSERT INTO operacao (id_linha, id_veiculo, data_operacao, horario_programado, horario_real, sentido) VALUES
-- Turno MANHÃ (05h00–09h15) com atrasos fortes
(8, 1, '2026-08-06', '05:00:00', '05:15:00', 'ida'), -- atraso forte
(8, 2, '2026-08-06', '05:15:00', '05:28:00', 'volta'),
(8, 3, '2026-08-06', '05:30:00', '05:45:00', 'ida'),
(8, 4, '2026-08-06', '05:45:00', '06:00:00', 'volta'),
(8, 5, '2026-08-06', '06:00:00', '06:18:00', 'ida'), -- atraso forte
(8, 6, '2026-08-06', '06:15:00', '06:25:00', 'volta'),
(8, 7, '2026-08-06', '06:30:00', '06:45:00', 'ida'),

(8, 1, '2026-08-06', '07:30:00', '07:45:00', 'volta'),
(8, 2, '2026-08-06', '07:45:00', '08:00:00', 'ida'),
(8, 3, '2026-08-06', '08:00:00', '08:15:00', 'volta'),
(8, 4, '2026-08-06', '08:15:00', '08:30:00', 'ida'),
(8, 5, '2026-08-06', '08:30:00', '08:45:00', 'volta'),
(8, 6, '2026-08-06', '08:45:00', '09:00:00', 'ida'),
(8, 7, '2026-08-06', '09:00:00', '09:20:00', 'volta'), -- atraso forte

-- Turno TARDE (15h00–19h00) com atrasos médios
(8, 1, '2026-08-06', '15:00:00', '15:08:00', 'volta'),
(8, 2, '2026-08-06', '15:15:00', '15:25:00', 'ida'),
(8, 3, '2026-08-06', '15:30:00', '15:40:00', 'volta'),
(8, 4, '2026-08-06', '15:45:00', '15:55:00', 'ida'),
(8, 5, '2026-08-06', '16:00:00', '16:10:00', 'volta'),
(8, 6, '2026-08-06', '16:15:00', '16:25:00', 'ida'),
(8, 7, '2026-08-06', '16:30:00', '16:40:00', 'volta'),

(8, 1, '2026-08-06', '17:30:00', '17:45:00', 'ida'),
(8, 2, '2026-08-06', '17:45:00', '18:00:00', 'volta'),
(8, 3, '2026-08-06', '18:00:00', '18:12:00', 'ida'),
(8, 4, '2026-08-06', '18:15:00', '18:28:00', 'volta'),
(8, 5, '2026-08-06', '18:30:00', '18:42:00', 'ida'),
(8, 6, '2026-08-06', '18:45:00', '18:55:00', 'volta'),
(8, 7, '2026-08-06', '19:00:00', '19:15:00', 'ida'),

-- Turno NOITE (22h00–03h20) com atrasos fortes
(8, 1, '2026-08-06', '22:00:00', '22:18:00', 'volta'), -- atraso forte
(8, 2, '2026-08-06', '22:15:00', '22:30:00', 'ida'),
(8, 3, '2026-08-06', '22:30:00', '22:45:00', 'volta'),
(8, 4, '2026-08-06', '22:45:00', '23:00:00', 'ida'),
(8, 5, '2026-08-06', '23:00:00', '23:18:00', 'volta'), -- atraso forte
(8, 6, '2026-08-06', '23:15:00', '23:30:00', 'ida'),
(8, 7, '2026-08-06', '23:30:00', '23:45:00', 'volta'),

(8, 1, '2026-08-07', '02:00:00', '02:15:00', 'ida'),
(8, 2, '2026-08-07', '02:15:00', '02:25:00', 'volta'),
(8, 3, '2026-08-07', '02:30:00', '02:45:00', 'ida'),
(8, 4, '2026-08-07', '02:45:00', '02:55:00', 'volta'),
(8, 5, '2026-08-07', '03:00:00', '03:15:00', 'ida'),
(8, 6, '2026-08-07', '03:15:00', '03:28:00', 'volta'), -- atraso forte
(8, 7, '2026-08-07', '03:20:00', '03:35:00', 'ida');


-- '1726-10', 'Limão - Metrô Santana', 6 onibus, 54 viagens
INSERT INTO operacao (id_linha, id_veiculo, data_operacao,    horario_programado, horario_real, sentido) VALUES
-- Turno MANHÃ (05h00–09h15) com atrasos fortes
(9, 1, '2026-08-06', '05:00:00', '05:15:00', 'ida'), -- atraso forte
(9, 2, '2026-08-06', '05:15:00', '05:28:00', 'volta'),
(9, 3, '2026-08-06', '05:30:00', '05:45:00', 'ida'),
(9, 4, '2026-08-06', '05:45:00', '06:00:00', 'volta'),
(9, 5, '2026-08-06', '06:00:00', '06:18:00', 'ida'), -- atraso forte
(9, 6, '2026-08-06', '06:15:00', '06:25:00', 'volta'),

(9, 1, '2026-08-06', '07:30:00', '07:45:00', 'volta'),
(9, 2, '2026-08-06', '07:45:00', '08:00:00', 'ida'),
(9, 3, '2026-08-06', '08:00:00', '08:15:00', 'volta'),
(9, 4, '2026-08-06', '08:15:00', '08:30:00', 'ida'),
(9, 5, '2026-08-06', '08:30:00', '08:45:00', 'volta'),
(9, 6, '2026-08-06', '09:00:00', '09:20:00', 'ida'), -- atraso forte

-- Turno TARDE (15h00–19h00) com atrasos médios
(9, 1, '2026-08-06', '15:00:00', '15:08:00', 'volta'),
(9, 2, '2026-08-06', '15:15:00', '15:25:00', 'ida'),
(9, 3, '2026-08-06', '15:30:00', '15:40:00', 'volta'),
(9, 4, '2026-08-06', '15:45:00', '15:55:00', 'ida'),
(9, 5, '2026-08-06', '16:00:00', '16:10:00', 'volta'),
(9, 6, '2026-08-06', '16:15:00', '16:25:00', 'ida'),

(9, 1, '2026-08-06', '17:30:00', '17:45:00', 'ida'),
(9, 2, '2026-08-06', '17:45:00', '18:00:00', 'volta'),
(9, 3, '2026-08-06', '18:00:00', '18:12:00', 'ida'),
(9, 4, '2026-08-06', '18:15:00', '18:28:00', 'volta'),
(9, 5, '2026-08-06', '18:30:00', '18:42:00', 'ida'),
(9, 6, '2026-08-06', '18:45:00', '18:55:00', 'volta'),

-- Turno NOITE (22h00–03h20) com atrasos fortes
(9, 1, '2026-08-06', '22:00:00', '22:18:00', 'volta'), -- atraso forte
(9, 2, '2026-08-06', '22:15:00', '22:30:00', 'ida'),
(9, 3, '2026-08-06', '22:30:00', '22:45:00', 'volta'),
(9, 4, '2026-08-06', '22:45:00', '23:00:00', 'ida'),
(9, 5, '2026-08-06', '23:00:00', '23:18:00', 'volta'), -- atraso forte
(9, 6, '2026-08-06', '23:15:00', '23:30:00', 'ida'),

(9, 1, '2026-08-07', '02:00:00', '02:15:00', 'ida'),
(9, 2, '2026-08-07', '02:15:00', '02:25:00', 'volta'),
(9, 3, '2026-08-07', '02:30:00', '02:45:00', 'ida'),
(9, 4, '2026-08-07', '02:45:00', '02:55:00', 'volta'),
(9, 5, '2026-08-07', '03:00:00', '03:15:00', 'ida'),
(9, 6, '2026-08-07', '03:15:00', '03:28:00', 'volta'); -- atraso forte



-- '1731-10', 'Vila Medeiros - Metrô Santana', 6 onibus, 54 viagens
INSERT INTO operacao ( id_linha, id_veiculo, data_operacao,  horario_programado, horario_real, sentido) VALUES
-- Turno MANHÃ (05h00–09h15) com atrasos fortes
(10, 1, '2026-08-06', '05:00:00', '05:15:00', 'ida'), -- atraso forte
(10, 2, '2026-08-06', '05:15:00', '05:28:00', 'volta'),
(10, 3, '2026-08-06', '05:30:00', '05:45:00', 'ida'),
(10, 4, '2026-08-06', '05:45:00', '06:00:00', 'volta'),
(10, 5, '2026-08-06', '06:00:00', '06:18:00', 'ida'), -- atraso forte
(10, 6, '2026-08-06', '06:15:00', '06:25:00', 'volta'),

(10, 1, '2026-08-06', '07:30:00', '07:45:00', 'volta'),
(10, 2, '2026-08-06', '07:45:00', '08:00:00', 'ida'),
(10, 3, '2026-08-06', '08:00:00', '08:15:00', 'volta'),
(10, 4, '2026-08-06', '08:15:00', '08:30:00', 'ida'),
(10, 5, '2026-08-06', '08:30:00', '08:45:00', 'volta'),
(10, 6, '2026-08-06', '09:00:00', '09:20:00', 'ida'), -- atraso forte

-- Turno TARDE (15h00–19h00) com atrasos médios
(10, 1, '2026-08-06', '15:00:00', '15:08:00', 'volta'),
(10, 2, '2026-08-06', '15:15:00', '15:25:00', 'ida'),
(10, 3, '2026-08-06', '15:30:00', '15:40:00', 'volta'),
(10, 4, '2026-08-06', '15:45:00', '15:55:00', 'ida'),
(10, 5, '2026-08-06', '16:00:00', '16:10:00', 'volta'),
(10, 6, '2026-08-06', '16:15:00', '16:25:00', 'ida'),

(10, 1, '2026-08-06', '17:30:00', '17:45:00', 'ida'),
(10, 2, '2026-08-06', '17:45:00', '18:00:00', 'volta'),
(10, 3, '2026-08-06', '18:00:00', '18:12:00', 'ida'),
(10, 4, '2026-08-06', '18:15:00', '18:28:00', 'volta'),
(10, 5, '2026-08-06', '18:30:00', '18:42:00', 'ida'),
(10, 6, '2026-08-06', '18:45:00', '18:55:00', 'volta'),

-- Turno NOITE (22h00–03h20) com atrasos fortes
(10, 1, '2026-08-06', '22:00:00', '22:18:00', 'volta'), -- atraso forte
(10, 2, '2026-08-06', '22:15:00', '22:30:00', 'ida'),
(10, 3, '2026-08-06', '22:30:00', '22:45:00', 'volta'),
(10, 4, '2026-08-06', '22:45:00', '23:00:00', 'ida'),
(10, 5, '2026-08-06', '23:00:00', '23:18:00', 'volta'), -- atraso forte
(10, 6, '2026-08-06', '23:15:00', '23:30:00', 'ida'),

(10, 1, '2026-08-07', '02:00:00', '02:15:00', 'ida'),
(10, 2, '2026-08-07', '02:15:00', '02:25:00', 'volta'),
(10, 3, '2026-08-07', '02:30:00', '02:45:00', 'ida'),
(10, 4, '2026-08-07', '02:45:00', '02:55:00', 'volta'),
(10, 5, '2026-08-07', '03:00:00', '03:15:00', 'ida'),
(10, 6, '2026-08-07', '03:15:00', '03:28:00', 'volta'); -- atraso forte


-- Tucuruvi
-- '971A-10', 'Tucuruvi - Jardim Tremembé', 7 onibus, 63 viagens,
INSERT INTO operacao (id_linha, id_veiculo, data_operacao, horario_programado, horario_real, sentido) VALUES
-- Turno MANHÃ (05h00–09h15) com atrasos fortes
(11, 1, '2026-08-06', '05:00:00', '05:15:00', 'ida'),   -- atraso forte
(11, 2, '2026-08-06', '05:15:00', '05:28:00', 'volta'),
(11, 3, '2026-08-06', '05:30:00', '05:45:00', 'ida'),
(11, 4, '2026-08-06', '05:45:00', '06:00:00', 'volta'),
(11, 5, '2026-08-06', '06:00:00', '06:18:00', 'ida'),   -- atraso forte
(11, 6, '2026-08-06', '06:15:00', '06:25:00', 'volta'),
(11, 7, '2026-08-06', '06:30:00', '06:40:00', 'ida'),

(11, 1, '2026-08-06', '07:30:00', '07:45:00', 'volta'),
(11, 2, '2026-08-06', '07:45:00', '08:00:00', 'ida'),
(11, 3, '2026-08-06', '08:00:00', '08:15:00', 'volta'),
(11, 4, '2026-08-06', '08:15:00', '08:30:00', 'ida'),
(11, 5, '2026-08-06', '08:30:00', '08:45:00', 'volta'),
(11, 6, '2026-08-06', '09:00:00', '09:20:00', 'ida'),   -- atraso forte
(11, 7, '2026-08-06', '09:15:00', '09:30:00', 'volta'),

-- Turno TARDE (15h00–19h00) com atrasos médios
(11, 1, '2026-08-06', '15:00:00', '15:08:00', 'volta'),
(11, 2, '2026-08-06', '15:15:00', '15:25:00', 'ida'),
(11, 3, '2026-08-06', '15:30:00', '15:40:00', 'volta'),
(11, 4, '2026-08-06', '15:45:00', '15:55:00', 'ida'),
(11, 5, '2026-08-06', '16:00:00', '16:10:00', 'volta'),
(11, 6, '2026-08-06', '16:15:00', '16:25:00', 'ida'),
(11, 7, '2026-08-06', '16:30:00', '16:45:00', 'volta'), -- atraso médio

(11, 1, '2026-08-06', '17:30:00', '17:45:00', 'ida'),
(11, 2, '2026-08-06', '17:45:00', '18:00:00', 'volta'),
(11, 3, '2026-08-06', '18:00:00', '18:12:00', 'ida'),
(11, 4, '2026-08-06', '18:15:00', '18:28:00', 'volta'),
(11, 5, '2026-08-06', '18:30:00', '18:42:00', 'ida'),
(11, 6, '2026-08-06', '18:45:00', '18:55:00', 'volta'),
(11, 7, '2026-08-06', '19:00:00', '19:20:00', 'ida'),   -- atraso forte

-- Turno NOITE (22h00–03h20) com atrasos fortes
(11, 1, '2026-08-06', '22:00:00', '22:18:00', 'volta'), -- atraso forte
(11, 2, '2026-08-06', '22:15:00', '22:30:00', 'ida'),
(11, 3, '2026-08-06', '22:30:00', '22:45:00', 'volta'),
(11, 4, '2026-08-06', '22:45:00', '23:00:00', 'ida'),
(11, 5, '2026-08-06', '23:00:00', '23:18:00', 'volta'), -- atraso forte
(11, 6, '2026-08-06', '23:15:00', '23:30:00', 'ida'),
(11, 7, '2026-08-06', '23:30:00', '23:45:00', 'volta'),

(11, 1, '2026-08-07', '02:00:00', '02:15:00', 'ida'),
(11, 2, '2026-08-07', '02:15:00', '02:25:00', 'volta'),
(11, 3, '2026-08-07', '02:30:00', '02:45:00', 'ida'),
(11, 4, '2026-08-07', '02:45:00', '02:55:00', 'volta'),
(11, 5, '2026-08-07', '03:00:00', '03:15:00', 'ida'),
(11, 6, '2026-08-07', '03:15:00', '03:28:00', 'volta'), -- atraso forte
(11, 7, '2026-08-07', '03:20:00', '03:35:00', 'ida');


-- '971B-10', 'Tucuruvi - Cachoeirinha', 8 onibus, 72 viagens,
INSERT INTO operacao ( id_linha, id_veiculo, data_operacao,  horario_programado, horario_real, sentido) VALUES
-- Turno MANHÃ (05h00–09h15) com atrasos fortes
(12, 1, '2026-08-06', '05:00:00', '05:15:00', 'ida'), -- atraso forte
(12, 2, '2026-08-06', '05:15:00', '05:28:00', 'volta'),
(12, 3, '2026-08-06', '05:30:00', '05:45:00', 'ida'),
(12, 4, '2026-08-06', '05:45:00', '06:00:00', 'volta'),
(12, 5, '2026-08-06', '06:00:00', '06:18:00', 'ida'), -- atraso forte
(12, 6, '2026-08-06', '06:15:00', '06:25:00', 'volta'),
(12, 7, '2026-08-06', '06:30:00', '06:45:00', 'ida'),
(12, 8, '2026-08-06', '06:45:00', '07:00:00', 'volta'),

(12, 1, '2026-08-06', '07:30:00', '07:45:00', 'volta'),
(12, 2, '2026-08-06', '07:45:00', '08:00:00', 'ida'),
(12, 3, '2026-08-06', '08:00:00', '08:15:00', 'volta'),
(12, 4, '2026-08-06', '08:15:00', '08:30:00', 'ida'),
(12, 5, '2026-08-06', '08:30:00', '08:45:00', 'volta'),
(12, 6, '2026-08-06', '08:45:00', '09:00:00', 'ida'),
(12, 7, '2026-08-06', '09:00:00', '09:20:00', 'volta'), -- atraso forte
(12, 8, '2026-08-06', '09:15:00', '09:30:00', 'ida'),

-- Turno TARDE (15h00–19h00) com atrasos médios
(12, 1, '2026-08-06', '15:00:00', '15:08:00', 'volta'),
(12, 2, '2026-08-06', '15:15:00', '15:25:00', 'ida'),
(12, 3, '2026-08-06', '15:30:00', '15:40:00', 'volta'),
(12, 4, '2026-08-06', '15:45:00', '15:55:00', 'ida'),
(12, 5, '2026-08-06', '16:00:00', '16:10:00', 'volta'),
(12, 6, '2026-08-06', '16:15:00', '16:25:00', 'ida'),
(12, 7, '2026-08-06', '16:30:00', '16:40:00', 'volta'),
(12, 8, '2026-08-06', '16:45:00', '16:55:00', 'ida'),

(12, 1, '2026-08-06', '17:30:00', '17:45:00', 'ida'),
(12, 2, '2026-08-06', '17:45:00', '18:00:00', 'volta'),
(12, 3, '2026-08-06', '18:00:00', '18:12:00', 'ida'),
(12, 4, '2026-08-06', '18:15:00', '18:28:00', 'volta'),
(12, 5, '2026-08-06', '18:30:00', '18:42:00', 'ida'),
(12, 6, '2026-08-06', '18:45:00', '18:55:00', 'volta'),
(12, 7, '2026-08-06', '19:00:00', '19:15:00', 'ida'),
(12, 8, '2026-08-06', '19:15:00', '19:25:00', 'volta'),

-- Turno NOITE (22h00–03h20) com atrasos fortes
(12, 1, '2026-08-06', '22:00:00', '22:18:00', 'volta'), -- atraso forte
(12, 2, '2026-08-06', '22:15:00', '22:30:00', 'ida'),
(12, 3, '2026-08-06', '22:30:00', '22:45:00', 'volta'),
(12, 4, '2026-08-06', '22:45:00', '23:00:00', 'ida'),
(12, 5, '2026-08-06', '23:00:00', '23:18:00', 'volta'), -- atraso forte
(12, 6, '2026-08-06', '23:15:00', '23:30:00', 'ida'),
(12, 7, '2026-08-06', '23:30:00', '23:45:00', 'volta'),
(12, 8, '2026-08-06', '23:45:00', '00:00:00', 'ida'),

(12, 1, '2026-08-07', '02:00:00', '02:15:00', 'ida'),
(12, 2, '2026-08-07', '02:15:00', '02:25:00', 'volta'),
(12, 3, '2026-08-07', '02:30:00', '02:45:00', 'ida'),
(12, 4, '2026-08-07', '02:45:00', '02:55:00', 'volta'),
(12, 5, '2026-08-07', '03:00:00', '03:15:00', 'ida'),
(12, 6, '2026-08-07', '03:15:00', '03:28:00', 'volta'), -- atraso forte
(12, 7, '2026-08-07', '03:20:00', '03:35:00', 'ida'),
(12, 8, '2026-08-07', '03:30:00', '03:45:00', 'volta');


-- '971E-10', 'Tucuruvi - Jaçanã', 8 onibus, 72 viagens
INSERT INTO operacao ( id_linha, id_veiculo, data_operacao, horario_programado, horario_real, sentido) VALUES
-- Turno MANHÃ (05h00–09h15) com atrasos fortes
(13, 1, '2026-08-06', '05:00:00', '05:15:00', 'ida'), -- atraso forte
(13, 2, '2026-08-06', '05:15:00', '05:28:00', 'volta'),
(13, 3, '2026-08-06', '05:30:00', '05:45:00', 'ida'),
(13, 4, '2026-08-06', '05:45:00', '06:00:00', 'volta'),
(13, 5, '2026-08-06', '06:00:00', '06:18:00', 'ida'), -- atraso forte
(13, 6, '2026-08-06', '06:15:00', '06:25:00', 'volta'),
(13, 7, '2026-08-06', '06:30:00', '06:45:00', 'ida'),
(13, 8, '2026-08-06', '06:45:00', '07:00:00', 'volta'),

(13, 1, '2026-08-06', '07:30:00', '07:45:00', 'volta'),
(13, 2, '2026-08-06', '07:45:00', '08:00:00', 'ida'),
(13, 3, '2026-08-06', '08:00:00', '08:15:00', 'volta'),
(13, 4, '2026-08-06', '08:15:00', '08:30:00', 'ida'),
(13, 5, '2026-08-06', '08:30:00', '08:45:00', 'volta'),
(13, 6, '2026-08-06', '08:45:00', '09:00:00', 'ida'),
(13, 7, '2026-08-06', '09:00:00', '09:20:00', 'volta'), -- atraso forte
(13, 8, '2026-08-06', '09:15:00', '09:30:00', 'ida'),

-- Turno TARDE (15h00–19h00) com atrasos médios
(13, 1, '2026-08-06', '15:00:00', '15:08:00', 'volta'),
(13, 2, '2026-08-06', '15:15:00', '15:25:00', 'ida'),
(13, 3, '2026-08-06', '15:30:00', '15:40:00', 'volta'),
(13, 4, '2026-08-06', '15:45:00', '15:55:00', 'ida'),
(13, 5, '2026-08-06', '16:00:00', '16:10:00', 'volta'),
(13, 6, '2026-08-06', '16:15:00', '16:25:00', 'ida'),
(13, 7, '2026-08-06', '16:30:00', '16:40:00', 'volta'),
(13, 8, '2026-08-06', '16:45:00', '16:55:00', 'ida'),

(13, 1, '2026-08-06', '17:30:00', '17:45:00', 'ida'),
(13, 2, '2026-08-06', '17:45:00', '18:00:00', 'volta'),
(13, 3, '2026-08-06', '18:00:00', '18:12:00', 'ida'),
(13, 4, '2026-08-06', '18:15:00', '18:28:00', 'volta'),
(13, 5, '2026-08-06', '18:30:00', '18:42:00', 'ida'),
(13, 6, '2026-08-06', '18:45:00', '18:55:00', 'volta'),
(13, 7, '2026-08-06', '19:00:00', '19:15:00', 'ida'),
(13, 8, '2026-08-06', '19:15:00', '19:25:00', 'volta'),

-- Turno NOITE (22h00–03h20) com atrasos fortes
(13, 1, '2026-08-06', '22:00:00', '22:18:00', 'volta'), -- atraso forte
(13, 2, '2026-08-06', '22:15:00', '22:30:00', 'ida'),
(13, 3, '2026-08-06', '22:30:00', '22:45:00', 'volta'),
(13, 4, '2026-08-06', '22:45:00', '23:00:00', 'ida'),
(13, 5, '2026-08-06', '23:00:00', '23:18:00', 'volta'), -- atraso forte
(13, 6, '2026-08-06', '23:15:00', '23:30:00', 'ida'),
(13, 7, '2026-08-06', '23:30:00', '23:45:00', 'volta'),
(13, 8, '2026-08-06', '23:45:00', '00:00:00', 'ida'),

(13, 1, '2026-08-07', '02:00:00', '02:15:00', 'ida'),
(13, 2, '2026-08-07', '02:15:00', '02:25:00', 'volta'),
(13, 3, '2026-08-07', '02:30:00', '02:45:00', 'ida'),
(13, 4, '2026-08-07', '02:45:00', '02:55:00', 'volta'),
(13, 5, '2026-08-07', '03:00:00', '03:15:00', 'ida'),
(13, 6, '2026-08-07', '03:15:00', '03:28:00', 'volta'), -- atraso forte
(13, 7, '2026-08-07', '03:20:00', '03:35:00', 'ida'),
(13, 8, '2026-08-07', '03:30:00', '03:45:00', 'volta');


-- 971F-10', 'Tucuruvi - Vila Medeiros', 7onibus, 63 viagens
INSERT INTO operacao (id_linha, id_veiculo, data_operacao, horario_programado, horario_real, sentido) VALUES
-- Turno MANHÃ (05h00–09h15) com atrasos fortes
(14, 1, '2026-08-06', '05:00:00', '05:15:00', 'ida'), -- atraso forte
(14, 2, '2026-08-06', '05:15:00', '05:28:00', 'volta'),
(14, 3, '2026-08-06', '05:30:00', '05:45:00', 'ida'),
(14, 4, '2026-08-06', '05:45:00', '06:00:00', 'volta'),
(14, 5, '2026-08-06', '06:00:00', '06:18:00', 'ida'), -- atraso forte
(14, 6, '2026-08-06', '06:15:00', '06:25:00', 'volta'),
(14, 7, '2026-08-06', '06:30:00', '06:45:00', 'ida'),

(14, 1, '2026-08-06', '07:30:00', '07:45:00', 'volta'),
(14, 2, '2026-08-06', '07:45:00', '08:00:00', 'ida'),
(14, 3, '2026-08-06', '08:00:00', '08:15:00', 'volta'),
(14, 4, '2026-08-06', '08:15:00', '08:30:00', 'ida'),
(14, 5, '2026-08-06', '08:30:00', '08:45:00', 'volta'),
(14, 6, '2026-08-06', '08:45:00', '09:00:00', 'ida'),
(14, 7, '2026-08-06', '09:00:00', '09:20:00', 'volta'), -- atraso forte

-- Turno TARDE (15h00–19h00) com atrasos médios
(14, 1, '2026-08-06', '15:00:00', '15:08:00', 'volta'),
(14, 2, '2026-08-06', '15:15:00', '15:25:00', 'ida'),
(14, 3, '2026-08-06', '15:30:00', '15:40:00', 'volta'),
(14, 4, '2026-08-06', '15:45:00', '15:55:00', 'ida'),
(14, 5, '2026-08-06', '16:00:00', '16:10:00', 'volta'),
(14, 6, '2026-08-06', '16:15:00', '16:25:00', 'ida'),
(14, 7, '2026-08-06', '16:30:00', '16:40:00', 'volta'),

(14, 1, '2026-08-06', '17:30:00', '17:45:00', 'ida'),
(14, 2, '2026-08-06', '17:45:00', '18:00:00', 'volta'),
(14, 3, '2026-08-06', '18:00:00', '18:12:00', 'ida'),
(14, 4, '2026-08-06', '18:15:00', '18:28:00', 'volta'),
(14, 5, '2026-08-06', '18:30:00', '18:42:00', 'ida'),
(14, 6, '2026-08-06', '18:45:00', '18:55:00', 'volta'),
(14, 7, '2026-08-06', '19:00:00', '19:15:00', 'ida'),

-- Turno NOITE (22h00–03h20) com atrasos fortes
(14, 1, '2026-08-06', '22:00:00', '22:18:00', 'volta'), -- atraso forte
(14, 2, '2026-08-06', '22:15:00', '22:30:00', 'ida'),
(14, 3, '2026-08-06', '22:30:00', '22:45:00', 'volta'),
(14, 4, '2026-08-06', '22:45:00', '23:00:00', 'ida'),
(14, 5, '2026-08-06', '23:00:00', '23:18:00', 'volta'), -- atraso forte
(14, 6, '2026-08-06', '23:15:00', '23:30:00', 'ida'),
(14, 7, '2026-08-06', '23:30:00', '23:45:00', 'volta'),

(14, 1, '2026-08-07', '02:00:00', '02:15:00', 'ida'),
(14, 2, '2026-08-07', '02:15:00', '02:25:00', 'volta'),
(14, 3, '2026-08-07', '02:30:00', '02:45:00', 'ida'),
(14, 4, '2026-08-07', '02:45:00', '02:55:00', 'volta'),
(14, 5, '2026-08-07', '03:00:00', '03:15:00', 'ida'),
(14, 6, '2026-08-07', '03:15:00', '03:28:00', 'volta'), -- atraso forte
(14, 7, '2026-08-07', '03:20:00', '03:35:00', 'ida');


-- 971G-10', 'Tucuruvi - Tremembé'', 6 onibus, 54 viagens
INSERT INTO operacao (id_linha, id_veiculo, data_operacao, horario_programado, horario_real, sentido) VALUES
-- Turno MANHÃ (05h00–09h15) com atrasos fortes
(15, 1, '2026-08-06', '05:00:00', '05:15:00', 'ida'),   -- atraso forte
(15, 2, '2026-08-06', '05:15:00', '05:28:00', 'volta'),
(15, 3, '2026-08-06', '05:30:00', '05:45:00', 'ida'),
(15, 4, '2026-08-06', '05:45:00', '06:00:00', 'volta'),
(15, 5, '2026-08-06', '06:00:00', '06:18:00', 'ida'),   -- atraso forte
(15, 6, '2026-08-06', '06:15:00', '06:25:00', 'volta'),

(15, 1, '2026-08-06', '07:30:00', '07:45:00', 'volta'),
(15, 2, '2026-08-06', '07:45:00', '08:00:00', 'ida'),
(15, 3, '2026-08-06', '08:00:00', '08:15:00', 'volta'),
(15, 4, '2026-08-06', '08:15:00', '08:30:00', 'ida'),
(15, 5, '2026-08-06', '08:30:00', '08:45:00', 'volta'),
(15, 6, '2026-08-06', '08:45:00', '09:00:00', 'ida'),

-- Turno TARDE (15h00–19h00) com atrasos médios
(15, 1, '2026-08-06', '15:00:00', '15:08:00', 'volta'),
(15, 2, '2026-08-06', '15:15:00', '15:25:00', 'ida'),
(15, 3, '2026-08-06', '15:30:00', '15:40:00', 'volta'),
(15, 4, '2026-08-06', '15:45:00', '15:55:00', 'ida'),
(15, 5, '2026-08-06', '16:00:00', '16:10:00', 'volta'),
(15, 6, '2026-08-06', '16:15:00', '16:25:00', 'ida'),

(15, 1, '2026-08-06', '17:30:00', '17:45:00', 'ida'),
(15, 2, '2026-08-06', '17:45:00', '18:00:00', 'volta'),
(15, 3, '2026-08-06', '18:00:00', '18:12:00', 'ida'),
(15, 4, '2026-08-06', '18:15:00', '18:28:00', 'volta'),
(15, 5, '2026-08-06', '18:30:00', '18:42:00', 'ida'),
(15, 6, '2026-08-06', '18:45:00', '18:55:00', 'volta'),

-- Turno NOITE (22h00–03h20) com atrasos fortes
(15, 1, '2026-08-06', '22:00:00', '22:18:00', 'volta'), -- atraso forte
(15, 2, '2026-08-06', '22:15:00', '22:30:00', 'ida'),
(15, 3, '2026-08-06', '22:30:00', '22:45:00', 'volta'),
(15, 4, '2026-08-06', '22:45:00', '23:00:00', 'ida'),
(15, 5, '2026-08-06', '23:00:00', '23:18:00', 'volta'), -- atraso forte
(15, 6, '2026-08-06', '23:15:00', '23:30:00', 'ida'),

(15, 1, '2026-08-07', '02:00:00', '02:15:00', 'ida'),
(15, 2, '2026-08-07', '02:15:00', '02:25:00', 'volta'),
(15, 3, '2026-08-07', '02:30:00', '02:45:00', 'ida'),
(15, 4, '2026-08-07', '02:45:00', '02:55:00', 'volta'),
(15, 5, '2026-08-07', '03:00:00', '03:15:00', 'ida'),
(15, 6, '2026-08-07', '03:15:00', '03:28:00', 'volta'); -- atraso forte

-- '971H-10', 'Tucuruvi - Vila Guilherme', 7 onibus, 63 viagens
INSERT INTO operacao ( id_linha, id_veiculo, data_operacao, horario_programado, horario_real, sentido) VALUES
-- Turno MANHÃ (05h00–09h15) com atrasos fortes
(16, 1, '2026-08-06', '05:00:00', '05:15:00', 'ida'), -- atraso forte
(16, 2, '2026-08-06', '05:15:00', '05:28:00', 'volta'),
(16, 3, '2026-08-06', '05:30:00', '05:45:00', 'ida'),
(16, 4, '2026-08-06', '05:45:00', '06:00:00', 'volta'),
(16, 5, '2026-08-06', '06:00:00', '06:18:00', 'ida'), -- atraso forte
(16, 6, '2026-08-06', '06:15:00', '06:25:00', 'volta'),
(16, 7, '2026-08-06', '06:30:00', '06:45:00', 'ida'),

(16, 1, '2026-08-06', '07:30:00', '07:45:00', 'volta'),
(16, 2, '2026-08-06', '07:45:00', '08:00:00', 'ida'),
(16, 3, '2026-08-06', '08:00:00', '08:15:00', 'volta'),
(16, 4, '2026-08-06', '08:15:00', '08:30:00', 'ida'),
(16, 5, '2026-08-06', '08:30:00', '08:45:00', 'volta'),
(16, 6, '2026-08-06', '08:45:00', '09:00:00', 'ida'),
(16, 7, '2026-08-06', '09:00:00', '09:20:00', 'volta'), -- atraso forte

-- Turno TARDE (15h00–19h00) com atrasos médios
(16, 1, '2026-08-06', '15:00:00', '15:08:00', 'volta'),
(16, 2, '2026-08-06', '15:15:00', '15:25:00', 'ida'),
(16, 3, '2026-08-06', '15:30:00', '15:40:00', 'volta'),
(16, 4, '2026-08-06', '15:45:00', '15:55:00', 'ida'),
(16, 5, '2026-08-06', '16:00:00', '16:10:00', 'volta'),
(16, 6, '2026-08-06', '16:15:00', '16:25:00', 'ida'),
(16, 7, '2026-08-06', '16:30:00', '16:40:00', 'volta'),

(16, 1, '2026-08-06', '17:30:00', '17:45:00', 'ida'),
(16, 2, '2026-08-06', '17:45:00', '18:00:00', 'volta'),
(16, 3, '2026-08-06', '18:00:00', '18:12:00', 'ida'),
(16, 4, '2026-08-06', '18:15:00', '18:28:00', 'volta'),
(16, 5, '2026-08-06', '18:30:00', '18:42:00', 'ida'),
(16, 6, '2026-08-06', '18:45:00', '18:55:00', 'volta'),
(16, 7, '2026-08-06', '19:00:00', '19:15:00', 'ida'),

-- Turno NOITE (22h00–03h20) com atrasos fortes
(16, 1, '2026-08-06', '22:00:00', '22:18:00', 'volta'), -- atraso forte
(16, 2, '2026-08-06', '22:15:00', '22:30:00', 'ida'),
(16, 3, '2026-08-06', '22:30:00', '22:45:00', 'volta'),
(16, 4, '2026-08-06', '22:45:00', '23:00:00', 'ida'),
(16, 5, '2026-08-06', '23:00:00', '23:18:00', 'volta'), -- atraso forte
(16, 6, '2026-08-06', '23:15:00', '23:30:00', 'ida'),
(16, 7, '2026-08-06', '23:30:00', '23:45:00', 'volta'),

(16, 1, '2026-08-07', '02:00:00', '02:15:00', 'ida'),
(16, 2, '2026-08-07', '02:15:00', '02:25:00', 'volta'),
(16, 3, '2026-08-07', '02:30:00', '02:45:00', 'ida'),
(16, 4, '2026-08-07', '02:45:00', '02:55:00', 'volta'),
(16, 5, '2026-08-07', '03:00:00', '03:15:00', 'ida'),
(16, 6, '2026-08-07', '03:15:00', '03:28:00', 'volta'), -- atraso forte
(16, 7, '2026-08-07', '03:20:00', '03:35:00', 'ida');


-- '971J-10', 'Tucuruvi - Casa Verde', 8 onibus, 72 viagens
INSERT INTO operacao ( id_linha, id_veiculo, data_operacao, horario_programado, horario_real, sentido) VALUES
-- Turno MANHÃ (05h00–09h15) com atrasos fortes
(17, 1, '2026-08-06', '05:00:00', '05:15:00', 'ida'), -- atraso forte
(17, 2, '2026-08-06', '05:15:00', '05:28:00', 'volta'),
(17, 3, '2026-08-06', '05:30:00', '05:45:00', 'ida'),
(17, 4, '2026-08-06', '05:45:00', '06:00:00', 'volta'),
(17, 5, '2026-08-06', '06:00:00', '06:18:00', 'ida'), -- atraso forte
(17, 6, '2026-08-06', '06:15:00', '06:25:00', 'volta'),
(17, 7, '2026-08-06', '06:30:00', '06:45:00', 'ida'),
(17, 8, '2026-08-06', '06:45:00', '07:00:00', 'volta'),

(17, 1, '2026-08-06', '07:30:00', '07:45:00', 'volta'),
(17, 2, '2026-08-06', '07:45:00', '08:00:00', 'ida'),
(17, 3, '2026-08-06', '08:00:00', '08:15:00', 'volta'),
(17, 4, '2026-08-06', '08:15:00', '08:30:00', 'ida'),
(17, 5, '2026-08-06', '08:30:00', '08:45:00', 'volta'),
(17, 6, '2026-08-06', '08:45:00', '09:00:00', 'ida'),
(17, 7, '2026-08-06', '09:00:00', '09:20:00', 'volta'), -- atraso forte
(17, 8, '2026-08-06', '09:15:00', '09:30:00', 'ida'),

-- Turno TARDE (15h00–19h00) com atrasos médios
(17, 1, '2026-08-06', '15:00:00', '15:08:00', 'volta'),
(17, 2, '2026-08-06', '15:15:00', '15:25:00', 'ida'),
(17, 3, '2026-08-06', '15:30:00', '15:40:00', 'volta'),
(17, 4, '2026-08-06', '15:45:00', '15:55:00', 'ida'),
(17, 5, '2026-08-06', '16:00:00', '16:10:00', 'volta'),
(17, 6, '2026-08-06', '16:15:00', '16:25:00', 'ida'),
(17, 7, '2026-08-06', '16:30:00', '16:40:00', 'volta'),
(17, 8, '2026-08-06', '16:45:00', '16:55:00', 'ida'),

(17, 1, '2026-08-06', '17:30:00', '17:45:00', 'ida'),
(17, 2, '2026-08-06', '17:45:00', '18:00:00', 'volta'),
(17, 3, '2026-08-06', '18:00:00', '18:12:00', 'ida'),
(17, 4, '2026-08-06', '18:15:00', '18:28:00', 'volta'),
(17, 5, '2026-08-06', '18:30:00', '18:42:00', 'ida'),
(17, 6, '2026-08-06', '18:45:00', '18:55:00', 'volta'),
(17, 7, '2026-08-06', '19:00:00', '19:15:00', 'ida'),
(17, 8, '2026-08-06', '19:15:00', '19:25:00', 'volta'),

-- Turno NOITE (22h00–03h20) com atrasos fortes
(17, 1, '2026-08-06', '22:00:00', '22:18:00', 'volta'), -- atraso forte
(17, 2, '2026-08-06', '22:15:00', '22:30:00', 'ida'),
(17, 3, '2026-08-06', '22:30:00', '22:45:00', 'volta'),
(17, 4, '2026-08-06', '22:45:00', '23:00:00', 'ida'),
(17, 5, '2026-08-06', '23:00:00', '23:18:00', 'volta'), -- atraso forte
(17, 6, '2026-08-06', '23:15:00', '23:30:00', 'ida'),
(17, 7, '2026-08-06', '23:30:00', '23:45:00', 'volta'),
(17, 8, '2026-08-06', '23:45:00', '00:00:00', 'ida'),

(17, 1, '2026-08-07', '02:00:00', '02:15:00', 'ida'),
(17, 2, '2026-08-07', '02:15:00', '02:25:00', 'volta'),
(17, 3, '2026-08-07', '02:30:00', '02:45:00', 'ida'),
(17, 4, '2026-08-07', '02:45:00', '02:55:00', 'volta'),
(17, 5, '2026-08-07', '03:00:00', '03:15:00', 'ida'),
(17, 6, '2026-08-07', '03:15:00', '03:28:00', 'volta'), -- atraso forte
(17, 7, '2026-08-07', '03:20:00', '03:35:00', 'ida'),
(17, 8, '2026-08-07', '03:30:00', '03:45:00', 'volta');


-- '971K-10', 'Tucuruvi - Santana', 9 onibus, 81 viagens
INSERT INTO operacao ( id_linha, id_veiculo, data_operacao, horario_programado, horario_real, sentido) VALUES
-- Turno MANHÃ (05h00–09h15) com atrasos fortes
(18, 1, '2026-08-06', '05:00:00', '05:15:00', 'ida'), -- atraso forte
(18, 2, '2026-08-06', '05:15:00', '05:28:00', 'volta'),
(18, 3, '2026-08-06', '05:30:00', '05:45:00', 'ida'),
(18, 4, '2026-08-06', '05:45:00', '06:00:00', 'volta'),
(18, 5, '2026-08-06', '06:00:00', '06:18:00', 'ida'), -- atraso forte
(18, 6, '2026-08-06', '06:15:00', '06:25:00', 'volta'),
(18, 7, '2026-08-06', '06:30:00', '06:45:00', 'ida'),
(18, 8, '2026-08-06', '06:45:00', '07:00:00', 'volta'),
(18, 9, '2026-08-06', '07:00:00', '07:18:00', 'ida'), -- atraso forte

(18, 1, '2026-08-06', '07:30:00', '07:45:00', 'volta'),
(18, 2, '2026-08-06', '07:45:00', '08:00:00', 'ida'),
(18, 3, '2026-08-06', '08:00:00', '08:15:00', 'volta'),
(18, 4, '2026-08-06', '08:15:00', '08:30:00', 'ida'),
(18, 5, '2026-08-06', '08:30:00', '08:45:00', 'volta'),
(18, 6, '2026-08-06', '08:45:00', '09:00:00', 'ida'),
(18, 7, '2026-08-06', '09:00:00', '09:20:00', 'volta'), -- atraso forte
(18, 8, '2026-08-06', '09:15:00', '09:30:00', 'ida'),
(18, 9, '2026-08-06', '09:30:00', '09:45:00', 'volta'),

-- Turno TARDE (15h00–19h00) com atrasos médios
(18, 1, '2026-08-06', '15:00:00', '15:08:00', 'volta'),
(18, 2, '2026-08-06', '15:15:00', '15:25:00', 'ida'),
(18, 3, '2026-08-06', '15:30:00', '15:40:00', 'volta'),
(18, 4, '2026-08-06', '15:45:00', '15:55:00', 'ida'),
(18, 5, '2026-08-06', '16:00:00', '16:10:00', 'volta'),
(18, 6, '2026-08-06', '16:15:00', '16:25:00', 'ida'),
(18, 7, '2026-08-06', '16:30:00', '16:40:00', 'volta'),
(18, 8, '2026-08-06', '16:45:00', '16:55:00', 'ida'),
(18, 9, '2026-08-06', '17:00:00', '17:12:00', 'volta'),

(18, 1, '2026-08-06', '17:30:00', '17:45:00', 'ida'),
(18, 2, '2026-08-06', '17:45:00', '18:00:00', 'volta'),
(18, 3, '2026-08-06', '18:00:00', '18:12:00', 'ida'),
(18, 4, '2026-08-06', '18:15:00', '18:28:00', 'volta'),
(18, 5, '2026-08-06', '18:30:00', '18:42:00', 'ida'),
(18, 6, '2026-08-06', '18:45:00', '18:55:00', 'volta'),
(18, 7, '2026-08-06', '19:00:00', '19:15:00', 'ida'),
(18, 8, '2026-08-06', '19:15:00', '19:25:00', 'volta'),
(18, 9, '2026-08-06', '19:30:00', '19:45:00', 'ida'),

-- Turno NOITE (22h00–03h20) com atrasos fortes
(18, 1, '2026-08-06', '22:00:00', '22:18:00', 'volta'), -- atraso forte
(18, 2, '2026-08-06', '22:15:00', '22:30:00', 'ida'),
(18, 3, '2026-08-06', '22:30:00', '22:45:00', 'volta'),
(18, 4, '2026-08-06', '22:45:00', '23:00:00', 'ida'),
(18, 5, '2026-08-06', '23:00:00', '23:18:00', 'volta'), -- atraso forte
(18, 6, '2026-08-06', '23:15:00', '23:30:00', 'ida'),
(18, 7, '2026-08-06', '23:30:00', '23:45:00', 'volta'),
(18, 8, '2026-08-06', '23:45:00', '00:00:00', 'ida'),
(18, 9, '2026-08-06', '00:00:00', '00:15:00', 'volta'),

(18, 1, '2026-08-07', '02:00:00', '02:15:00', 'ida'),
(18, 2, '2026-08-07', '02:15:00', '02:25:00', 'volta'),
(18, 3, '2026-08-07', '02:30:00', '02:45:00', 'ida'),
(18, 4, '2026-08-07', '02:45:00', '02:55:00', 'volta'),
(18, 5, '2026-08-07', '03:00:00', '03:15:00', 'ida'),
(18, 6, '2026-08-07', '03:15:00', '03:28:00', 'volta'), -- atraso forte
(18, 7, '2026-08-07', '03:20:00', '03:35:00', 'ida'),
(18, 8, '2026-08-07', '03:30:00', '03:45:00', 'volta'),
(18, 9, '2026-08-07', '03:40:00', '03:55:00', 'ida');

-- '972K-10', 'Tucuruvi - Brasilândia', 7onibus, 63 viagens
INSERT INTO operacao (id_linha, id_veiculo, data_operacao, horario_programado, horario_real, sentido) VALUES
-- Turno MANHÃ (05h00–09h15) com atrasos fortes
(19, 1, '2026-08-06', '05:00:00', '05:15:00', 'ida'), -- atraso forte
(19, 2, '2026-08-06', '05:15:00', '05:28:00', 'volta'),
(19, 3, '2026-08-06', '05:30:00', '05:45:00', 'ida'),
(19, 4, '2026-08-06', '05:45:00', '06:00:00', 'volta'),
(19, 5, '2026-08-06', '06:00:00', '06:18:00', 'ida'), -- atraso forte
(19, 6, '2026-08-06', '06:15:00', '06:25:00', 'volta'),
(19, 7, '2026-08-06', '06:30:00', '06:45:00', 'ida'),

(19, 1, '2026-08-06', '07:30:00', '07:45:00', 'volta'),
(19, 2, '2026-08-06', '07:45:00', '08:00:00', 'ida'),
(19, 3, '2026-08-06', '08:00:00', '08:15:00', 'volta'),
(19, 4, '2026-08-06', '08:15:00', '08:30:00', 'ida'),
(19, 5, '2026-08-06', '08:30:00', '08:45:00', 'volta'),
(19, 6, '2026-08-06', '08:45:00', '09:00:00', 'ida'),
(19, 7, '2026-08-06', '09:00:00', '09:20:00', 'volta'), -- atraso forte

-- Turno TARDE (15h00–19h00) com atrasos médios
(19, 1, '2026-08-06', '15:00:00', '15:08:00', 'volta'),
(19, 2, '2026-08-06', '15:15:00', '15:25:00', 'ida'),
(19, 3, '2026-08-06', '15:30:00', '15:40:00', 'volta'),
(19, 4, '2026-08-06', '15:45:00', '15:55:00', 'ida'),
(19, 5, '2026-08-06', '16:00:00', '16:10:00', 'volta'),
(19, 6, '2026-08-06', '16:15:00', '16:25:00', 'ida'),
(19, 7, '2026-08-06', '16:30:00', '16:40:00', 'volta'),

(19, 1, '2026-08-06', '17:30:00', '17:45:00', 'ida'),
(19, 2, '2026-08-06', '17:45:00', '18:00:00', 'volta'),
(19, 3, '2026-08-06', '18:00:00', '18:12:00', 'ida'),
(19, 4, '2026-08-06', '18:15:00', '18:28:00', 'volta'),
(19, 5, '2026-08-06', '18:30:00', '18:42:00', 'ida'),
(19, 6, '2026-08-06', '18:45:00', '18:55:00', 'volta'),
(19, 7, '2026-08-06', '19:00:00', '19:15:00', 'ida'),

-- Turno NOITE (22h00–03h20) com atrasos fortes
(19, 1, '2026-08-06', '22:00:00', '22:18:00', 'volta'), -- atraso forte
(19, 2, '2026-08-06', '22:15:00', '22:30:00', 'ida'),
(19, 3, '2026-08-06', '22:30:00', '22:45:00', 'volta'),
(19, 4, '2026-08-06', '22:45:00', '23:00:00', 'ida'),
(19, 5, '2026-08-06', '23:00:00', '23:18:00', 'volta'), -- atraso forte
(19, 6, '2026-08-06', '23:15:00', '23:30:00', 'ida'),
(19, 7, '2026-08-06', '23:30:00', '23:45:00', 'volta'),

(19, 1, '2026-08-07', '02:00:00', '02:15:00', 'ida'),
(19, 2, '2026-08-07', '02:15:00', '02:25:00', 'volta'),
(19, 3, '2026-08-07', '02:30:00', '02:45:00', 'ida'),
(19, 4, '2026-08-07', '02:45:00', '02:55:00', 'volta'),
(19, 5, '2026-08-07', '03:00:00', '03:15:00', 'ida'),
(19, 6, '2026-08-07', '03:15:00', '03:28:00', 'volta'), -- atraso forte
(19, 7, '2026-08-07', '03:20:00', '03:35:00', 'ida');


-- '972E-10', 'Tucuruvi - Mandaqui', 8 onibus,  72 viagens
INSERT INTO operacao ( id_linha, id_veiculo, data_operacao, horario_programado, horario_real, sentido) VALUES
-- Turno MANHÃ (05h00–09h15) com atrasos fortes
(20, 1, '2026-08-06', '05:00:00', '05:15:00', 'ida'), -- atraso forte
(20, 2, '2026-08-06', '05:15:00', '05:28:00', 'volta'),
(20, 3, '2026-08-06', '05:30:00', '05:45:00', 'ida'),
(20, 4, '2026-08-06', '05:45:00', '06:00:00', 'volta'),
(20, 5, '2026-08-06', '06:00:00', '06:18:00', 'ida'), -- atraso forte
(20, 6, '2026-08-06', '06:15:00', '06:25:00', 'volta'),
(20, 7, '2026-08-06', '06:30:00', '06:45:00', 'ida'),
(20, 8, '2026-08-06', '06:45:00', '07:00:00', 'volta'),

(20, 1, '2026-08-06', '07:30:00', '07:45:00', 'volta'),
(20, 2, '2026-08-06', '07:45:00', '08:00:00', 'ida'),
(20, 3, '2026-08-06', '08:00:00', '08:15:00', 'volta'),
(20, 4, '2026-08-06', '08:15:00', '08:30:00', 'ida'),
(20, 5, '2026-08-06', '08:30:00', '08:45:00', 'volta'),
(20, 6, '2026-08-06', '08:45:00', '09:00:00', 'ida'),
(20, 7, '2026-08-06', '09:00:00', '09:20:00', 'volta'), -- atraso forte
(20, 8, '2026-08-06', '09:15:00', '09:30:00', 'ida'),

-- Turno TARDE (15h00–19h00) com atrasos médios
(20, 1, '2026-08-06', '15:00:00', '15:08:00', 'volta'),
(20, 2, '2026-08-06', '15:15:00', '15:25:00', 'ida'),
(20, 3, '2026-08-06', '15:30:00', '15:40:00', 'volta'),
(20, 4, '2026-08-06', '15:45:00', '15:55:00', 'ida'),
(20, 5, '2026-08-06', '16:00:00', '16:10:00', 'volta'),
(20, 6, '2026-08-06', '16:15:00', '16:25:00', 'ida'),
(20, 7, '2026-08-06', '16:30:00', '16:40:00', 'volta'),
(20, 8, '2026-08-06', '16:45:00', '16:55:00', 'ida'),

(20, 1, '2026-08-06', '17:30:00', '17:45:00', 'ida'),
(20, 2, '2026-08-06', '17:45:00', '18:00:00', 'volta'),
(20, 3, '2026-08-06', '18:00:00', '18:12:00', 'ida'),
(20, 4, '2026-08-06', '18:15:00', '18:28:00', 'volta'),
(20, 5, '2026-08-06', '18:30:00', '18:42:00', 'ida'),
(20, 6, '2026-08-06', '18:45:00', '18:55:00', 'volta'),
(20, 7, '2026-08-06', '19:00:00', '19:15:00', 'ida'),
(20, 8, '2026-08-06', '19:15:00', '19:25:00', 'volta'),

-- Turno NOITE (22h00–03h20) com atrasos fortes
(20, 1, '2026-08-06', '22:00:00', '22:18:00', 'volta'), -- atraso forte
(20, 2, '2026-08-06', '22:15:00', '22:30:00', 'ida'),
(20, 3, '2026-08-06', '22:30:00', '22:45:00', 'volta'),
(20, 4, '2026-08-06', '22:45:00', '23:00:00', 'ida'),
(20, 5, '2026-08-06', '23:00:00', '23:18:00', 'volta'), -- atraso forte
(20, 6, '2026-08-06', '23:15:00', '23:30:00', 'ida'),
(20, 7, '2026-08-06', '23:30:00', '23:45:00', 'volta'),
(20, 8, '2026-08-06', '23:45:00', '00:00:00', 'ida'),

(20, 1, '2026-08-07', '02:00:00', '02:15:00', 'ida'),
(20, 2, '2026-08-07', '02:15:00', '02:25:00', 'volta'),
(20, 3, '2026-08-07', '02:30:00', '02:45:00', 'ida'),
(20, 4, '2026-08-07', '02:45:00', '02:55:00', 'volta'),
(20, 5, '2026-08-07', '03:00:00', '03:15:00', 'ida'),
(20, 6, '2026-08-07', '03:15:00', '03:28:00', 'volta'), -- atraso forte
(20, 7, '2026-08-07', '03:20:00', '03:35:00', 'ida'),
(20, 8, '2026-08-07', '03:30:00', '03:45:00', 'volta');



-- Jaçanã
-- '971L-10', 'Jaçanã - Santana', 8 onibus, 72 viagens
INSERT INTO operacao (id_linha, id_veiculo, data_operacao, horario_programado, horario_real, sentido) VALUES
-- Turno MANHÃ (05h00–09h15)
(21, 1, '2026-08-06', '05:00:00', '05:12:00', 'ida'),   -- atraso forte
(21, 2, '2026-08-06', '05:15:00', '05:20:00', 'volta'),
(21, 3, '2026-08-06', '05:30:00', '05:40:00', 'ida'),
(21, 4, '2026-08-06', '05:45:00', '06:00:00', 'volta'),
(21, 5, '2026-08-06', '06:00:00', '06:18:00', 'ida'),   -- atraso forte
(21, 6, '2026-08-06', '06:15:00', '06:25:00', 'volta'),
(21, 7, '2026-08-06', '06:30:00', '06:35:00', 'ida'),   -- atraso leve
(21, 8, '2026-08-06', '06:45:00', '07:00:00', 'volta'),

(21, 1, '2026-08-06', '07:30:00', '07:45:00', 'volta'),
(21, 2, '2026-08-06', '07:45:00', '08:00:00', 'ida'),
(21, 3, '2026-08-06', '08:00:00', '08:20:00', 'volta'), -- atraso forte
(21, 4, '2026-08-06', '08:15:00', '08:30:00', 'ida'),
(21, 5, '2026-08-06', '08:30:00', '08:40:00', 'volta'), -- atraso leve
(21, 6, '2026-08-06', '08:45:00', '09:00:00', 'ida'),
(21, 7, '2026-08-06', '09:00:00', '09:20:00', 'volta'), -- atraso forte
(21, 8, '2026-08-06', '09:15:00', '09:30:00', 'ida'),

-- Turno TARDE (15h00–19h00)
(21, 1, '2026-08-06', '15:00:00', '15:05:00', 'volta'),
(21, 2, '2026-08-06', '15:15:00', '15:25:00', 'ida'),
(21, 3, '2026-08-06', '15:30:00', '15:45:00', 'volta'), -- atraso médio
(21, 4, '2026-08-06', '15:45:00', '15:55:00', 'ida'),
(21, 5, '2026-08-06', '16:00:00', '16:10:00', 'volta'),
(21, 6, '2026-08-06', '16:15:00', '16:30:00', 'ida'),   -- atraso médio
(21, 7, '2026-08-06', '16:30:00', '16:40:00', 'volta'),
(21, 8, '2026-08-06', '16:45:00', '16:55:00', 'ida'),

(21, 1, '2026-08-06', '17:30:00', '17:45:00', 'ida'),
(21, 2, '2026-08-06', '17:45:00', '18:00:00', 'volta'),
(21, 3, '2026-08-06', '18:00:00', '18:15:00', 'ida'),
(21, 4, '2026-08-06', '18:15:00', '18:28:00', 'volta'),
(21, 5, '2026-08-06', '18:30:00', '18:42:00', 'ida'),
(21, 6, '2026-08-06', '18:45:00', '18:55:00', 'volta'),
(21, 7, '2026-08-06', '19:00:00', '19:20:00', 'ida'),   -- atraso forte
(21, 8, '2026-08-06', '19:15:00', '19:25:00', 'volta'),

-- Turno NOITE (22h00–03h20)
(21, 1, '2026-08-06', '22:00:00', '22:18:00', 'volta'), -- atraso forte
(21, 2, '2026-08-06', '22:15:00', '22:30:00', 'ida'),
(21, 3, '2026-08-06', '22:30:00', '22:45:00', 'volta'),
(21, 4, '2026-08-06', '22:45:00', '23:00:00', 'ida'),
(21, 5, '2026-08-06', '23:00:00', '23:15:00', 'volta'),
(21, 6, '2026-08-06', '23:15:00', '23:30:00', 'ida'),
(21, 7, '2026-08-06', '23:30:00', '23:45:00', 'volta'),
(21, 8, '2026-08-06', '23:45:00', '00:00:00', 'ida'),

(21, 1, '2026-08-07', '02:00:00', '02:15:00', 'ida'),
(21, 2, '2026-08-07', '02:15:00', '02:25:00', 'volta'),
(21, 3, '2026-08-07', '02:30:00', '02:45:00', 'ida'),
(21, 4, '2026-08-07', '02:45:00', '02:55:00', 'volta'),
(21, 5, '2026-08-07', '03:00:00', '03:18:00', 'ida'),   -- atraso forte
(21, 6, '2026-08-07', '03:15:00', '03:28:00', 'volta'), -- atraso médio
(21, 7, '2026-08-07', '03:20:00', '03:35:00', 'ida'),
(21, 8, '2026-08-07', '03:30:00', '03:45:00', 'volta');


-- '971M-10', 'Jaçanã - Tucuruvi', 8 onibus, 72 viagens
INSERT INTO operacao (id_linha, id_veiculo, data_operacao, horario_programado, horario_real, sentido) VALUES
-- Turno MANHÃ (05h00–09h15)
(22, 1, '2026-08-06', '05:00:00', '05:10:00', 'ida'),   -- atraso médio
(22, 2, '2026-08-06', '05:15:00', '05:30:00', 'volta'), -- atraso forte
(22, 3, '2026-08-06', '05:30:00', '05:40:00', 'ida'),
(22, 4, '2026-08-06', '05:45:00', '06:00:00', 'volta'),
(22, 5, '2026-08-06', '06:00:00', '06:12:00', 'ida'),   -- atraso médio
(22, 6, '2026-08-06', '06:15:00', '06:25:00', 'volta'),
(22, 7, '2026-08-06', '06:30:00', '06:45:00', 'ida'),
(22, 8, '2026-08-06', '06:45:00', '07:00:00', 'volta'),

(22, 1, '2026-08-06', '07:30:00', '07:45:00', 'volta'),
(22, 2, '2026-08-06', '07:45:00', '08:00:00', 'ida'),
(22, 3, '2026-08-06', '08:00:00', '08:20:00', 'volta'), -- atraso forte
(22, 4, '2026-08-06', '08:15:00', '08:30:00', 'ida'),
(22, 5, '2026-08-06', '08:30:00', '08:45:00', 'volta'),
(22, 6, '2026-08-06', '08:45:00', '09:00:00', 'ida'),
(22, 7, '2026-08-06', '09:00:00', '09:15:00', 'volta'),
(22, 8, '2026-08-06', '09:15:00', '09:30:00', 'ida'),

-- Turno TARDE (15h00–19h00)
(22, 1, '2026-08-06', '15:00:00', '15:05:00', 'volta'),
(22, 2, '2026-08-06', '15:15:00', '15:25:00', 'ida'),
(22, 3, '2026-08-06', '15:30:00', '15:45:00', 'volta'), -- atraso médio
(22, 4, '2026-08-06', '15:45:00', '15:55:00', 'ida'),
(22, 5, '2026-08-06', '16:00:00', '16:12:00', 'volta'), -- atraso médio
(22, 6, '2026-08-06', '16:15:00', '16:25:00', 'ida'),
(22, 7, '2026-08-06', '16:30:00', '16:40:00', 'volta'),
(22, 8, '2026-08-06', '16:45:00', '16:55:00', 'ida'),

(22, 1, '2026-08-06', '17:30:00', '17:45:00', 'ida'),
(22, 2, '2026-08-06', '17:45:00', '18:00:00', 'volta'),
(22, 3, '2026-08-06', '18:00:00', '18:15:00', 'ida'),
(22, 4, '2026-08-06', '18:15:00', '18:28:00', 'volta'),
(22, 5, '2026-08-06', '18:30:00', '18:42:00', 'ida'),
(22, 6, '2026-08-06', '18:45:00', '18:55:00', 'volta'),
(22, 7, '2026-08-06', '19:00:00', '19:20:00', 'ida'),   -- atraso forte
(22, 8, '2026-08-06', '19:15:00', '19:25:00', 'volta'),

-- Turno NOITE (22h00–03h20)
(22, 1, '2026-08-06', '22:00:00', '22:15:00', 'volta'),
(22, 2, '2026-08-06', '22:15:00', '22:30:00', 'ida'),
(22, 3, '2026-08-06', '22:30:00', '22:45:00', 'volta'),
(22, 4, '2026-08-06', '22:45:00', '23:00:00', 'ida'),
(22, 5, '2026-08-06', '23:00:00', '23:18:00', 'volta'), -- atraso forte
(22, 6, '2026-08-06', '23:15:00', '23:30:00', 'ida'),
(22, 7, '2026-08-06', '23:30:00', '23:45:00', 'volta'),
(22, 8, '2026-08-06', '23:45:00', '00:00:00', 'ida'),

(22, 1, '2026-08-07', '02:00:00', '02:15:00', 'ida'),
(22, 2, '2026-08-07', '02:15:00', '02:25:00', 'volta'),
(22, 3, '2026-08-07', '02:30:00', '02:45:00', 'ida'),
(22, 4, '2026-08-07', '02:45:00', '02:55:00', 'volta'),
(22, 5, '2026-08-07', '03:00:00', '03:15:00', 'ida'),
(22, 6, '2026-08-07', '03:15:00', '03:28:00', 'volta'), -- atraso médio
(22, 7, '2026-08-07', '03:20:00', '03:35:00', 'ida'),
(22, 8, '2026-08-07', '03:30:00', '03:45:00', 'volta');


-- '971N-10', 'Jaçanã - Cachoeirinha', 7 onibus, 63 viagens
INSERT INTO operacao (id_linha, id_veiculo, data_operacao, horario_programado, horario_real, sentido) VALUES
-- Turno MANHÃ (05h00–09h15)
(23, 1, '2026-08-06', '05:00:00', '05:15:00', 'ida'),   -- atraso forte
(23, 2, '2026-08-06', '05:15:00', '05:25:00', 'volta'),
(23, 3, '2026-08-06', '05:30:00', '05:45:00', 'ida'),
(23, 4, '2026-08-06', '05:45:00', '06:00:00', 'volta'),
(23, 5, '2026-08-06', '06:00:00', '06:18:00', 'ida'),   -- atraso forte
(23, 6, '2026-08-06', '06:15:00', '06:25:00', 'volta'),
(23, 7, '2026-08-06', '06:30:00', '06:40:00', 'ida'),

(23, 1, '2026-08-06', '07:30:00', '07:45:00', 'volta'),
(23, 2, '2026-08-06', '07:45:00', '08:00:00', 'ida'),
(23, 3, '2026-08-06', '08:00:00', '08:20:00', 'volta'), -- atraso forte
(23, 4, '2026-08-06', '08:15:00', '08:30:00', 'ida'),
(23, 5, '2026-08-06', '08:30:00', '08:45:00', 'volta'),
(23, 6, '2026-08-06', '08:45:00', '09:00:00', 'ida'),
(23, 7, '2026-08-06', '09:00:00', '09:20:00', 'volta'), -- atraso médio

-- Turno TARDE (15h00–19h00)
(23, 1, '2026-08-06', '15:00:00', '15:10:00', 'volta'),
(23, 2, '2026-08-06', '15:15:00', '15:25:00', 'ida'),
(23, 3, '2026-08-06', '15:30:00', '15:45:00', 'volta'), -- atraso médio
(23, 4, '2026-08-06', '15:45:00', '15:55:00', 'ida'),
(23, 5, '2026-08-06', '16:00:00', '16:12:00', 'volta'), -- atraso médio
(23, 6, '2026-08-06', '16:15:00', '16:25:00', 'ida'),
(23, 7, '2026-08-06', '16:30:00', '16:40:00', 'volta'),

(23, 1, '2026-08-06', '17:30:00', '17:45:00', 'ida'),
(23, 2, '2026-08-06', '17:45:00', '18:00:00', 'volta'),
(23, 3, '2026-08-06', '18:00:00', '18:15:00', 'ida'),
(23, 4, '2026-08-06', '18:15:00', '18:28:00', 'volta'),
(23, 5, '2026-08-06', '18:30:00', '18:42:00', 'ida'),
(23, 6, '2026-08-06', '18:45:00', '18:55:00', 'volta'),
(23, 7, '2026-08-06', '19:00:00', '19:20:00', 'ida'),   -- atraso forte

-- Turno NOITE (22h00–03h20)
(23, 1, '2026-08-06', '22:00:00', '22:18:00', 'volta'), -- atraso forte
(23, 2, '2026-08-06', '22:15:00', '22:30:00', 'ida'),
(23, 3, '2026-08-06', '22:30:00', '22:45:00', 'volta'),
(23, 4, '2026-08-06', '22:45:00', '23:00:00', 'ida'),
(23, 5, '2026-08-06', '23:00:00', '23:15:00', 'volta'),
(23, 6, '2026-08-06', '23:15:00', '23:30:00', 'ida'),
(23, 7, '2026-08-06', '23:30:00', '23:45:00', 'volta'),

(23, 1, '2026-08-07', '02:00:00', '02:15:00', 'ida'),
(23, 2, '2026-08-07', '02:15:00', '02:25:00', 'volta'),
(23, 3, '2026-08-07', '02:30:00', '02:45:00', 'ida'),
(23, 4, '2026-08-07', '02:45:00', '02:55:00', 'volta'),
(23, 5, '2026-08-07', '03:00:00', '03:15:00', 'ida'),
(23, 6, '2026-08-07', '03:15:00', '03:28:00', 'volta'), -- atraso médio
(23, 7, '2026-08-07', '03:20:00', '03:35:00', 'ida');

-- '971P-10', 'Jaçanã - Limão', 7onibus, 63 viagens
INSERT INTO operacao (id_linha, id_veiculo, data_operacao, horario_programado, horario_real, sentido) VALUES
-- Turno MANHÃ (05h00–09h15)
(24, 1, '2026-08-06', '05:00:00', '05:12:00', 'ida'),   -- atraso forte
(24, 2, '2026-08-06', '05:15:00', '05:25:00', 'volta'),
(24, 3, '2026-08-06', '05:30:00', '05:45:00', 'ida'),
(24, 4, '2026-08-06', '05:45:00', '06:00:00', 'volta'),
(24, 5, '2026-08-06', '06:00:00', '06:18:00', 'ida'),   -- atraso forte
(24, 6, '2026-08-06', '06:15:00', '06:25:00', 'volta'),
(24, 7, '2026-08-06', '06:30:00', '06:40:00', 'ida'),

(24, 1, '2026-08-06', '07:30:00', '07:45:00', 'volta'),
(24, 2, '2026-08-06', '07:45:00', '08:00:00', 'ida'),
(24, 3, '2026-08-06', '08:00:00', '08:20:00', 'volta'), -- atraso forte
(24, 4, '2026-08-06', '08:15:00', '08:30:00', 'ida'),
(24, 5, '2026-08-06', '08:30:00', '08:45:00', 'volta'),
(24, 6, '2026-08-06', '08:45:00', '09:00:00', 'ida'),
(24, 7, '2026-08-06', '09:00:00', '09:20:00', 'volta'), -- atraso médio

-- Turno TARDE (15h00–19h00)
(24, 1, '2026-08-06', '15:00:00', '15:10:00', 'volta'),
(24, 2, '2026-08-06', '15:15:00', '15:25:00', 'ida'),
(24, 3, '2026-08-06', '15:30:00', '15:45:00', 'volta'), -- atraso médio
(24, 4, '2026-08-06', '15:45:00', '15:55:00', 'ida'),
(24, 5, '2026-08-06', '16:00:00', '16:12:00', 'volta'), -- atraso médio
(24, 6, '2026-08-06', '16:15:00', '16:25:00', 'ida'),
(24, 7, '2026-08-06', '16:30:00', '16:40:00', 'volta'),

(24, 1, '2026-08-06', '17:30:00', '17:45:00', 'ida'),
(24, 2, '2026-08-06', '17:45:00', '18:00:00', 'volta'),
(24, 3, '2026-08-06', '18:00:00', '18:15:00', 'ida'),
(24, 4, '2026-08-06', '18:15:00', '18:28:00', 'volta'),
(24, 5, '2026-08-06', '18:30:00', '18:42:00', 'ida'),
(24, 6, '2026-08-06', '18:45:00', '18:55:00', 'volta'),
(24, 7, '2026-08-06', '19:00:00', '19:20:00', 'ida'),   -- atraso forte

-- Turno NOITE (22h00–03h20)
(24, 1, '2026-08-06', '22:00:00', '22:18:00', 'volta'), -- atraso forte
(24, 2, '2026-08-06', '22:15:00', '22:30:00', 'ida'),
(24, 3, '2026-08-06', '22:30:00', '22:45:00', 'volta'),
(24, 4, '2026-08-06', '22:45:00', '23:00:00', 'ida'),
(24, 5, '2026-08-06', '23:00:00', '23:15:00', 'volta'),
(24, 6, '2026-08-06', '23:15:00', '23:30:00', 'ida'),
(24, 7, '2026-08-06', '23:30:00', '23:45:00', 'volta'),

(24, 1, '2026-08-07', '02:00:00', '02:15:00', 'ida'),
(24, 2, '2026-08-07', '02:15:00', '02:25:00', 'volta'),
(24, 3, '2026-08-07', '02:30:00', '02:45:00', 'ida'),
(24, 4, '2026-08-07', '02:45:00', '02:55:00', 'volta'),
(24, 5, '2026-08-07', '03:00:00', '03:15:00', 'ida'),
(24, 6, '2026-08-07', '03:15:00', '03:28:00', 'volta'), -- atraso médio
(24, 7, '2026-08-07', '03:20:00', '03:35:00', 'ida');


-- '973K-10', 'Jaçanã - Mandaqui',  7onibus, 63 viagens
INSERT INTO operacao (id_linha, id_veiculo, data_operacao, horario_programado, horario_real, sentido) VALUES
-- Turno MANHÃ (05h00–09h15)
(25, 1, '2026-08-06', '05:00:00', '05:15:00', 'ida'),   -- atraso forte
(25, 2, '2026-08-06', '05:15:00', '05:25:00', 'volta'),
(25, 3, '2026-08-06', '05:30:00', '05:40:00', 'ida'),
(25, 4, '2026-08-06', '05:45:00', '06:00:00', 'volta'),
(25, 5, '2026-08-06', '06:00:00', '06:18:00', 'ida'),   -- atraso forte
(25, 6, '2026-08-06', '06:15:00', '06:25:00', 'volta'),
(25, 7, '2026-08-06', '06:30:00', '06:40:00', 'ida'),

(25, 1, '2026-08-06', '07:30:00', '07:45:00', 'volta'),
(25, 2, '2026-08-06', '07:45:00', '08:00:00', 'ida'),
(25, 3, '2026-08-06', '08:00:00', '08:20:00', 'volta'), -- atraso forte
(25, 4, '2026-08-06', '08:15:00', '08:30:00', 'ida'),
(25, 5, '2026-08-06', '08:30:00', '08:45:00', 'volta'),
(25, 6, '2026-08-06', '08:45:00', '09:00:00', 'ida'),
(25, 7, '2026-08-06', '09:00:00', '09:20:00', 'volta'), -- atraso médio
-- Turno TARDE (15h00–19h00)
(25, 1, '2026-08-06', '15:00:00', '15:10:00', 'volta'),
(25, 2, '2026-08-06', '15:15:00', '15:25:00', 'ida'),
(25, 3, '2026-08-06', '15:30:00', '15:45:00', 'volta'), -- atraso médio
(25, 4, '2026-08-06', '15:45:00', '15:55:00', 'ida'),
(25, 5, '2026-08-06', '16:00:00', '16:12:00', 'volta'), -- atraso médio
(25, 6, '2026-08-06', '16:15:00', '16:25:00', 'ida'),
(25, 7, '2026-08-06', '16:30:00', '16:40:00', 'volta'),

(25, 1, '2026-08-06', '17:30:00', '17:45:00', 'ida'),
(25, 2, '2026-08-06', '17:45:00', '18:00:00', 'volta'),
(25, 3, '2026-08-06', '18:00:00', '18:15:00', 'ida'),
(25, 4, '2026-08-06', '18:15:00', '18:28:00', 'volta'),
(25, 5, '2026-08-06', '18:30:00', '18:42:00', 'ida'),
(25, 6, '2026-08-06', '18:45:00', '18:55:00', 'volta'),
(25, 7, '2026-08-06', '19:00:00', '19:20:00', 'ida'),   -- atraso forte
-- Turno NOITE (22h00–03h20)
(25, 1, '2026-08-06', '22:00:00', '22:18:00', 'volta'), -- atraso forte
(25, 2, '2026-08-06', '22:15:00', '22:30:00', 'ida'),
(25, 3, '2026-08-06', '22:30:00', '22:45:00', 'volta'),
(25, 4, '2026-08-06', '22:45:00', '23:00:00', 'ida'),
(25, 5, '2026-08-06', '23:00:00', '23:15:00', 'volta'),
(25, 6, '2026-08-06', '23:15:00', '23:30:00', 'ida'),
(25, 7, '2026-08-06', '23:30:00', '23:45:00', 'volta'),

(25, 1, '2026-08-07', '02:00:00', '02:15:00', 'ida'),
(25, 2, '2026-08-07', '02:15:00', '02:25:00', 'volta'),
(25, 3, '2026-08-07', '02:30:00', '02:45:00', 'ida'),
(25, 4, '2026-08-07', '02:45:00', '02:55:00', 'volta'),
(25, 5, '2026-08-07', '03:00:00', '03:15:00', 'ida'),
(25, 6, '2026-08-07', '03:15:00', '03:28:00', 'volta'), -- atraso médio
(25, 7, '2026-08-07', '03:20:00', '03:35:00', 'ida');


-- Casa Verde
-- '972A-10', 'Casa Verde - Santana',  7 onibus, 63 viagens
INSERT INTO operacao (id_linha, id_veiculo, data_operacao, horario_programado, horario_real, sentido) VALUES
-- Turno MANHÃ (05h00–09h15)
(26, 1, '2026-08-06', '05:00:00', '05:15:00', 'ida'),   -- atraso forte
(26, 2, '2026-08-06', '05:15:00', '05:25:00', 'volta'),
(26, 3, '2026-08-06', '05:30:00', '05:45:00', 'ida'),
(26, 4, '2026-08-06', '05:45:00', '06:00:00', 'volta'),
(26, 5, '2026-08-06', '06:00:00', '06:18:00', 'ida'),   -- atraso forte
(26, 6, '2026-08-06', '06:15:00', '06:25:00', 'volta'),
(26, 7, '2026-08-06', '06:30:00', '06:40:00', 'ida'),

(26, 1, '2026-08-06', '07:30:00', '07:45:00', 'volta'),
(26, 2, '2026-08-06', '07:45:00', '08:00:00', 'ida'),
(26, 3, '2026-08-06', '08:00:00', '08:20:00', 'volta'), -- atraso forte
(26, 4, '2026-08-06', '08:15:00', '08:30:00', 'ida'),
(26, 5, '2026-08-06', '08:30:00', '08:45:00', 'volta'),
(26, 6, '2026-08-06', '08:45:00', '09:00:00', 'ida'),
(26, 7, '2026-08-06', '09:00:00', '09:20:00', 'volta'), -- atraso médio
-- Turno TARDE (15h00–19h00)
(26, 1, '2026-08-06', '15:00:00', '15:10:00', 'volta'),
(26, 2, '2026-08-06', '15:15:00', '15:25:00', 'ida'),
(26, 3, '2026-08-06', '15:30:00', '15:45:00', 'volta'), -- atraso médio
(26, 4, '2026-08-06', '15:45:00', '15:55:00', 'ida'),
(26, 5, '2026-08-06', '16:00:00', '16:12:00', 'volta'), -- atraso médio
(26, 6, '2026-08-06', '16:15:00', '16:25:00', 'ida'),
(26, 7, '2026-08-06', '16:30:00', '16:40:00', 'volta'),

(26, 1, '2026-08-06', '17:30:00', '17:45:00', 'ida'),
(26, 2, '2026-08-06', '17:45:00', '18:00:00', 'volta'),
(26, 3, '2026-08-06', '18:00:00', '18:15:00', 'ida'),
(26, 4, '2026-08-06', '18:15:00', '18:28:00', 'volta'),
(26, 5, '2026-08-06', '18:30:00', '18:42:00', 'ida'),
(26, 6, '2026-08-06', '18:45:00', '18:55:00', 'volta'),
(26, 7, '2026-08-06', '19:00:00', '19:20:00', 'ida'),   -- atraso forte
-- Turno NOITE (22h00–03h20)
(26, 1, '2026-08-06', '22:00:00', '22:18:00', 'volta'), -- atraso forte
(26, 2, '2026-08-06', '22:15:00', '22:30:00', 'ida'),
(26, 3, '2026-08-06', '22:30:00', '22:45:00', 'volta'),
(26, 4, '2026-08-06', '22:45:00', '23:00:00', 'ida'),
(26, 5, '2026-08-06', '23:00:00', '23:15:00', 'volta'),
(26, 6, '2026-08-06', '23:15:00', '23:30:00', 'ida'),
(26, 7, '2026-08-06', '23:30:00', '23:45:00', 'volta'),

(26, 1, '2026-08-07', '02:00:00', '02:15:00', 'ida'),
(26, 2, '2026-08-07', '02:15:00', '02:25:00', 'volta'),
(26, 3, '2026-08-07', '02:30:00', '02:45:00', 'ida'),
(26, 4, '2026-08-07', '02:45:00', '02:55:00', 'volta'),
(26, 5, '2026-08-07', '03:00:00', '03:15:00', 'ida'),
(26, 6, '2026-08-07', '03:15:00', '03:28:00', 'volta'), -- atraso médio
(26, 7, '2026-08-07', '03:20:00', '03:35:00', 'ida');



-- '972B-10', 'Casa Verde - Tucuruvi',  7onibus, 63 viagens
INSERT INTO operacao (id_linha, id_veiculo, data_operacao, horario_programado, horario_real, sentido) VALUES
-- Turno MANHÃ (05h00–09h15)
(27, 1, '2026-08-06', '05:00:00', '05:12:00', 'ida'),   -- atraso médio
(27, 2, '2026-08-06', '05:15:00', '05:30:00', 'volta'), -- atraso forte
(27, 3, '2026-08-06', '05:30:00', '05:40:00', 'ida'),
(27, 4, '2026-08-06', '05:45:00', '06:00:00', 'volta'),
(27, 5, '2026-08-06', '06:00:00', '06:15:00', 'ida'),
(27, 6, '2026-08-06', '06:15:00', '06:25:00', 'volta'),
(27, 7, '2026-08-06', '06:30:00', '06:45:00', 'ida'),

(27, 1, '2026-08-06', '07:30:00', '07:45:00', 'volta'),
(27, 2, '2026-08-06', '07:45:00', '08:00:00', 'ida'),
(27, 3, '2026-08-06', '08:00:00', '08:20:00', 'volta'), -- atraso forte
(27, 4, '2026-08-06', '08:15:00', '08:30:00', 'ida'),
(27, 5, '2026-08-06', '08:30:00', '08:45:00', 'volta'),
(27, 6, '2026-08-06', '08:45:00', '09:00:00', 'ida'),
(27, 7, '2026-08-06', '09:00:00', '09:20:00', 'volta'), -- atraso médio
-- Turno TARDE (15h00–19h00)
(27, 1, '2026-08-06', '15:00:00', '15:10:00', 'volta'),
(27, 2, '2026-08-06', '15:15:00', '15:25:00', 'ida'),
(27, 3, '2026-08-06', '15:30:00', '15:45:00', 'volta'), -- atraso médio
(27, 4, '2026-08-06', '15:45:00', '15:55:00', 'ida'),
(27, 5, '2026-08-06', '16:00:00', '16:12:00', 'volta'), -- atraso médio
(27, 6, '2026-08-06', '16:15:00', '16:25:00', 'ida'),
(27, 7, '2026-08-06', '16:30:00', '16:40:00', 'volta'),

(27, 1, '2026-08-06', '17:30:00', '17:45:00', 'ida'),
(27, 2, '2026-08-06', '17:45:00', '18:00:00', 'volta'),
(27, 3, '2026-08-06', '18:00:00', '18:15:00', 'ida'),
(27, 4, '2026-08-06', '18:15:00', '18:28:00', 'volta'),
(27, 5, '2026-08-06', '18:30:00', '18:42:00', 'ida'),
(27, 6, '2026-08-06', '18:45:00', '18:55:00', 'volta'),
(27, 7, '2026-08-06', '19:00:00', '19:20:00', 'ida'),   -- atraso forte
-- Turno NOITE (22h00–03h20)
(27, 1, '2026-08-06', '22:00:00', '22:15:00', 'volta'),
(27, 2, '2026-08-06', '22:15:00', '22:30:00', 'ida'),
(27, 3, '2026-08-06', '22:30:00', '22:45:00', 'volta'),
(27, 4, '2026-08-06', '22:45:00', '23:00:00', 'ida'),
(27, 5, '2026-08-06', '23:00:00', '23:18:00', 'volta'), -- atraso forte
(27, 6, '2026-08-06', '23:15:00', '23:30:00', 'ida'),
(27, 7, '2026-08-06', '23:30:00', '23:45:00', 'volta'),

(27, 1, '2026-08-07', '02:00:00', '02:15:00', 'ida'),
(27, 2, '2026-08-07', '02:15:00', '02:25:00', 'volta'),
(27, 3, '2026-08-07', '02:30:00', '02:45:00', 'ida'),
(27, 4, '2026-08-07', '02:45:00', '02:55:00', 'volta'),
(27, 5, '2026-08-07', '03:00:00', '03:15:00', 'ida'),
(27, 6, '2026-08-07', '03:15:00', '03:28:00', 'volta'), -- atraso médio
(27, 7, '2026-08-07', '03:20:00', '03:35:00', 'ida');


-- '972C-10', 'Casa Verde - Cachoeirinha',  8 onibus, 72 viagens
INSERT INTO operacao (id_linha, id_veiculo, data_operacao, horario_programado, horario_real, sentido) VALUES
-- Turno MANHÃ (05h00–09h15)
(28, 1, '2026-08-06', '05:00:00', '05:18:00', 'ida'),   -- atraso forte
(28, 2, '2026-08-06', '05:15:00', '05:25:00', 'volta'),
(28, 3, '2026-08-06', '05:30:00', '05:40:00', 'ida'),
(28, 4, '2026-08-06', '05:45:00', '06:00:00', 'volta'),
(28, 5, '2026-08-06', '06:00:00', '06:15:00', 'ida'),
(28, 6, '2026-08-06', '06:15:00', '06:25:00', 'volta'),
(28, 7, '2026-08-06', '06:30:00', '06:45:00', 'ida'),
(28, 8, '2026-08-06', '06:45:00', '07:00:00', 'volta'),

(28, 1, '2026-08-06', '07:30:00', '07:45:00', 'volta'),
(28, 2, '2026-08-06', '07:45:00', '08:00:00', 'ida'),
(28, 3, '2026-08-06', '08:00:00', '08:20:00', 'volta'), -- atraso forte
(28, 4, '2026-08-06', '08:15:00', '08:30:00', 'ida'),
(28, 5, '2026-08-06', '08:30:00', '08:45:00', 'volta'),
(28, 6, '2026-08-06', '08:45:00', '09:00:00', 'ida'),
(28, 7, '2026-08-06', '09:00:00', '09:20:00', 'volta'), -- atraso médio
(28, 8, '2026-08-06', '09:15:00', '09:30:00', 'ida'),
-- Turno TARDE (15h00–19h00)
(28, 1, '2026-08-06', '15:00:00', '15:10:00', 'volta'),
(28, 2, '2026-08-06', '15:15:00', '15:25:00', 'ida'),
(28, 3, '2026-08-06', '15:30:00', '15:45:00', 'volta'), -- atraso médio
(28, 4, '2026-08-06', '15:45:00', '15:55:00', 'ida'),
(28, 5, '2026-08-06', '16:00:00', '16:12:00', 'volta'), -- atraso médio
(28, 6, '2026-08-06', '16:15:00', '16:25:00', 'ida'),
(28, 7, '2026-08-06', '16:30:00', '16:40:00', 'volta'),
(28, 8, '2026-08-06', '16:45:00', '16:55:00', 'ida'),

(28, 1, '2026-08-06', '17:30:00', '17:45:00', 'ida'),
(28, 2, '2026-08-06', '17:45:00', '18:00:00', 'volta'),
(28, 3, '2026-08-06', '18:00:00', '18:15:00', 'ida'),
(28, 4, '2026-08-06', '18:15:00', '18:28:00', 'volta'),
(28, 5, '2026-08-06', '18:30:00', '18:42:00', 'ida'),
(28, 6, '2026-08-06', '18:45:00', '18:55:00', 'volta'),
(28, 7, '2026-08-06', '19:00:00', '19:20:00', 'ida'),   -- atraso forte
(28, 8, '2026-08-06', '19:15:00', '19:25:00', 'volta'),
-- Turno NOITE (22h00–03h20)
(28, 1, '2026-08-06', '22:00:00', '22:18:00', 'volta'), -- atraso forte
(28, 2, '2026-08-06', '22:15:00', '22:30:00', 'ida'),
(28, 3, '2026-08-06', '22:30:00', '22:45:00', 'volta'),
(28, 4, '2026-08-06', '22:45:00', '23:00:00', 'ida'),
(28, 5, '2026-08-06', '23:00:00', '23:15:00', 'volta'),
(28, 6, '2026-08-06', '23:15:00', '23:30:00', 'ida'),
(28, 7, '2026-08-06', '23:30:00', '23:45:00', 'volta'),
(28, 8, '2026-08-06', '23:45:00', '00:00:00', 'ida'),

(28, 1, '2026-08-07', '02:00:00', '02:15:00', 'ida'),
(28, 2, '2026-08-07', '02:15:00', '02:25:00', 'volta'),
(28, 3, '2026-08-07', '02:30:00', '02:45:00', 'ida'),
(28, 4, '2026-08-07', '02:45:00', '02:55:00', 'volta'),
(28, 5, '2026-08-07', '03:00:00', '03:15:00', 'ida'),
(28, 6, '2026-08-07', '03:15:00', '03:28:00', 'volta'), -- atraso médio
(28, 7, '2026-08-07', '03:20:00', '03:35:00', 'ida'),
(28, 8, '2026-08-07', '03:30:00', '03:45:00', 'volta');



-- '972D-10', 'Casa Verde - Limão',  6 onibus, 54 viagens
INSERT INTO operacao (id_linha, id_veiculo, data_operacao, horario_programado, horario_real, sentido) VALUES
-- Turno MANHÃ (05h00–09h15)
(29, 1, '2026-08-06', '05:00:00', '05:15:00', 'ida'),   -- atraso forte
(29, 2, '2026-08-06', '05:15:00', '05:25:00', 'volta'),
(29, 3, '2026-08-06', '05:30:00', '05:45:00', 'ida'),
(29, 4, '2026-08-06', '05:45:00', '06:00:00', 'volta'),
(29, 5, '2026-08-06', '06:00:00', '06:18:00', 'ida'),   -- atraso forte
(29, 6, '2026-08-06', '06:15:00', '06:25:00', 'volta'),

(29, 1, '2026-08-06', '07:30:00', '07:45:00', 'volta'),
(29, 2, '2026-08-06', '07:45:00', '08:00:00', 'ida'),
(29, 3, '2026-08-06', '08:00:00', '08:20:00', 'volta'), -- atraso forte
(29, 4, '2026-08-06', '08:15:00', '08:30:00', 'ida'),
(29, 5, '2026-08-06', '08:30:00', '08:45:00', 'volta'),
(29, 6, '2026-08-06', '08:45:00', '09:00:00', 'ida'),
-- Turno TARDE (15h00–19h00)
(29, 1, '2026-08-06', '15:00:00', '15:10:00', 'volta'),
(29, 2, '2026-08-06', '15:15:00', '15:25:00', 'ida'),
(29, 3, '2026-08-06', '15:30:00', '15:45:00', 'volta'), -- atraso médio
(29, 4, '2026-08-06', '15:45:00', '15:55:00', 'ida'),
(29, 5, '2026-08-06', '16:00:00', '16:12:00', 'volta'), -- atraso médio
(29, 6, '2026-08-06', '16:15:00', '16:25:00', 'ida'),

(29, 1, '2026-08-06', '17:30:00', '17:45:00', 'ida'),
(29, 2, '2026-08-06', '17:45:00', '18:00:00', 'volta'),
(29, 3, '2026-08-06', '18:00:00', '18:15:00', 'ida'),
(29, 4, '2026-08-06', '18:15:00', '18:28:00', 'volta'),
(29, 5, '2026-08-06', '18:30:00', '18:42:00', 'ida'),
(29, 6, '2026-08-06', '18:45:00', '18:55:00', 'volta'),
-- Turno NOITE (22h00–03h20)
(29, 1, '2026-08-06', '22:00:00', '22:18:00', 'volta'), -- atraso forte
(29, 2, '2026-08-06', '22:15:00', '22:30:00', 'ida'),
(29, 3, '2026-08-06', '22:30:00', '22:45:00', 'volta'),
(29, 4, '2026-08-06', '22:45:00', '23:00:00', 'ida'),
(29, 5, '2026-08-06', '23:00:00', '23:15:00', 'volta'),
(29, 6, '2026-08-06', '23:15:00', '23:30:00', 'ida'),

(29, 1, '2026-08-07', '02:00:00', '02:15:00', 'ida'),
(29, 2, '2026-08-07', '02:15:00', '02:25:00', 'volta'),
(29, 3, '2026-08-07', '02:30:00', '02:45:00', 'ida'),
(29, 4, '2026-08-07', '02:45:00', '02:55:00', 'volta'),
(29, 5, '2026-08-07', '03:00:00', '03:15:00', 'ida'),
(29, 6, '2026-08-07', '03:15:00', '03:28:00', 'volta'); -- atraso médio



-- '972F-10', 'Casa Verde - Mandaqui',  7 onibus, 63 viagens
INSERT INTO operacao (id_linha, id_veiculo, data_operacao, horario_programado, horario_real, sentido) VALUES
-- Turno MANHÃ (05h00–09h15)
(30, 1, '2026-08-06', '05:00:00', '05:15:00', 'ida'),   -- atraso forte
(30, 2, '2026-08-06', '05:15:00', '05:25:00', 'volta'),
(30, 3, '2026-08-06', '05:30:00', '05:45:00', 'ida'),
(30, 4, '2026-08-06', '05:45:00', '06:00:00', 'volta'),
(30, 5, '2026-08-06', '06:00:00', '06:18:00', 'ida'),   -- atraso forte
(30, 6, '2026-08-06', '06:15:00', '06:25:00', 'volta'),
(30, 7, '2026-08-06', '06:30:00', '06:26:00', 'ida'),

(30, 1, '2026-08-06', '07:30:00', '07:45:00', 'volta'),
(30, 2, '2026-08-06', '07:45:00', '08:00:00', 'ida'),
(30, 3, '2026-08-06', '08:00:00', '08:20:00', 'volta'), -- atraso forte
(30, 4, '2026-08-06', '08:15:00', '08:30:00', 'ida'),
(30, 5, '2026-08-06', '08:30:00', '08:45:00', 'volta'),
(30, 6, '2026-08-06', '08:45:00', '09:00:00', 'ida'),
(30, 7, '2026-08-06', '09:00:00', '09:16:00', 'volta'),
-- Turno TARDE (15h00–19h00)
(30, 1, '2026-08-06', '15:00:00', '15:10:00', 'volta'),
(30, 2, '2026-08-06', '15:15:00', '15:25:00', 'ida'),
(30, 3, '2026-08-06', '15:30:00', '15:45:00', 'volta'), -- atraso médio
(30, 4, '2026-08-06', '15:45:00', '15:55:00', 'ida'),
(30, 5, '2026-08-06', '16:00:00', '16:12:00', 'volta'), -- atraso médio
(30, 6, '2026-08-06', '16:15:00', '16:25:00', 'ida'),
(30, 7, '2026-08-06', '16:30:00', '16:28:00', 'volta'),

(30, 1, '2026-08-06', '17:30:00', '17:45:00', 'ida'),
(30, 2, '2026-08-06', '17:45:00', '18:00:00', 'volta'),
(30, 3, '2026-08-06', '18:00:00', '18:15:00', 'ida'),
(30, 4, '2026-08-06', '18:15:00', '18:28:00', 'volta'),
(30, 5, '2026-08-06', '18:30:00', '18:42:00', 'ida'),
(30, 6, '2026-08-06', '18:45:00', '18:55:00', 'volta'),
(30, 7, '2026-08-06', '19:00:00', '19:01:00', 'volta'),
-- Turno NOITE (22h00–03h20)
(30, 1, '2026-08-06', '22:00:00', '22:18:00', 'volta'), -- atraso forte
(30, 2, '2026-08-06', '22:15:00', '22:30:00', 'ida'),
(30, 3, '2026-08-06', '22:30:00', '22:45:00', 'volta'),
(30, 4, '2026-08-06', '22:45:00', '23:00:00', 'ida'),
(30, 5, '2026-08-06', '23:00:00', '23:15:00', 'volta'),
(30, 6, '2026-08-06', '23:15:00', '23:30:00', 'ida'),
(30, 7, '2026-08-06', '23:30:00', '23:31:00', 'volta'),

(30, 1, '2026-08-07', '02:00:00', '02:15:00', 'ida'),
(30, 2, '2026-08-07', '02:15:00', '02:25:00', 'volta'),
(30, 3, '2026-08-07', '02:30:00', '02:45:00', 'ida'),
(30, 4, '2026-08-07', '02:45:00', '02:55:00', 'volta'),
(30, 5, '2026-08-07', '03:00:00', '03:15:00', 'ida'),
(30, 6, '2026-08-07', '03:15:00', '03:28:00', 'volta'), -- atraso médio
(30, 7, '2026-08-06', '03:30:00', '03:30:00', 'volta');



-- Consultas 

SELECT * FROM linha;
SELECT * FROM veiculo;
SELECT * FROM operacao;

SELECT id_linha, COUNT(*) AS quantidade_operacoes
FROM operacao
GROUP BY id_linha;

-- qta de linhas diferentes
SELECT COUNT(DISTINCT id_linha) AS total_linhas
FROM operacao;

show tables;

-- 1.  Verificar se os dados foram carregados  
SELECT 
	COUNT(*) AS total_registros 
FROM operacao;


-- 2.  Quais viagens atrasaram?
SELECT 
	id_linha, 
	id_veiculo, 
	horario_programado, 
	horario_real
FROM operacao
WHERE horario_real > horario_programado
LIMIT 15; 

-- 3. Média de atraso em minutos por linha
SELECT 
id_linha, 
          AVG(TIMESTAMPDIFF(MINUTE, horario_programado, horario_real)) AS media_atraso
FROM operacao
GROUP BY id_linha
ORDER BY media_atraso DESC;

-- 4.  Programado x Real (impacto do atraso)
SELECT 
id_linha, 
horario_programado, 
horario_real,
         TIMESTAMPDIFF(MINUTE, horario_programado, horario_real) AS atraso
FROM operacao;

-- 5. Horários críticos de atraso
SELECT EXTRACT(HOUR FROM horario_programado) AS hora,
       COUNT(*) AS qtd_atrasos
FROM operacao
WHERE horario_real > horario_programado
GROUP BY hora
ORDER BY qtd_atrasos DESC;

-- 6.    Sentido com pior desempenho (ida x volta)
SELECT 
	id_linha, 
	sentido, 
	AVG(TIMESTAMPDIFF(MINUTE, horario_programado, horario_real)) AS media_atraso  
FROM operacao
GROUP BY id_linha, sentido
ORDER BY media_atraso DESC;

-- 7 Atraso maximo por linha
SELECT id_linha,
       MAX(TIMESTAMPDIFF(MINUTE, horario_programado, horario_real)) AS atraso_maximo
FROM operacao
GROUP BY id_linha
ORDER BY atraso_maximo DESC;


-- 8 distribuicao de atrasos por veiculo. identifica se algum onibus especifico esta com desempenho pior
SELECT id_veiculo,
       AVG(TIMESTAMPDIFF(MINUTE, horario_programado, horario_real)) AS media_atraso
FROM operacao
GROUP BY id_veiculo
ORDER BY media_atraso DESC;


-- 9 ranking de linhas mais pontuais
SELECT id_linha,
       AVG(TIMESTAMPDIFF(MINUTE, horario_programado, horario_real)) AS media_atraso
FROM operacao
GROUP BY id_linha
ORDER BY media_atraso ASC;

-- 10 mostra se o sentido 'ida' ou 'volta' sofre mais atrasos
SELECT sentido,
       AVG(TIMESTAMPDIFF(MINUTE, horario_programado, horario_real)) AS media_atraso
FROM operacao
GROUP BY sentido;

-- 11 mostrar qual tipo de ônibus oferece maior capacidade de transporte 
SELECT tipo,
       SUM(capacidade_sentados + capacidade_em_pe) AS capacidade_total
FROM veiculo
GROUP BY tipo
ORDER BY capacidade_total DESC;

-- 12 media de atraso por tipo de veiculo
SELECT v.tipo,
       AVG(TIMESTAMPDIFF(MINUTE, o.horario_programado, o.horario_real)) AS media_atraso
FROM operacao o
JOIN veiculo v ON o.id_veiculo = v.id_veiculo
GROUP BY v.tipo
ORDER BY media_atraso DESC;

-- 13 distribuição das operações por tipo de veiculo
SELECT v.tipo,
       COUNT(o.id_operacao) AS qtd_operacoes
FROM operacao o
JOIN veiculo v ON o.id_veiculo = v.id_veiculo
GROUP BY v.tipo
ORDER BY qtd_operacoes DESC;












