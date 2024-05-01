CREATE TABLE IF NOT EXISTS Clientes (
    ClienteID INTEGER PRIMARY KEY AUTOINCREMENT,
    Nome TEXT,
    Email TEXT
);

CREATE TABLE IF NOT EXISTS Pedidos (
    PedidoID INTEGER PRIMARY KEY AUTOINCREMENT,
    ClienteID INTEGER,
    Produto TEXT,
    Quantidade INTEGER,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

CREATE TABLE IF NOT EXISTS Log_Clientes (
    LogID INTEGER PRIMARY KEY AUTOINCREMENT,
    Acao TEXT,
    Data TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TRIGGER IF NOT EXISTS after_insert_cliente
AFTER INSERT ON Clientes
BEGIN
    INSERT INTO Log_Clientes (Acao) VALUES ('Novo cliente inserido');
END;

INSERT INTO Clientes (Nome, Email) VALUES ('João', 'joao@example.com');

SELECT * FROM Log_Clientes;