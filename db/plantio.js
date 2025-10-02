const mysql = require('mysql2/promise');

const connection = mysql.createPool({
    host: process.env.DB_HOST || 'localhost',
    user: process.env.DB_USER || 'root',
    database: process.env.DB_NAME || 'agrocitro',
    password: process.env.DB_PASSWORD || ''
});

async function obterPlantios() {
    const sql = 'SELECT * FROM plantio';
    const [rows] = await connection.execute(sql);
    return rows;
}

async function incluirPlantios(ID_Plantio, Variedade, Data_Plantio, Quantidade_Plantada, Localizacao) {
    const sql = 'INSERT INTO plantio (ID_Plantio, Variedade, Data_Plantio, Quantidade_Plantada, Localizacao) VALUES (?, ?, ?, ?)';
    const [result] = await connection.execute(sql, [ID_Plantio, Variedade, Data_Plantio, Quantidade_Plantada, Localizacao]);
    console.log(ID_Plantio, Variedade, Data_Plantio, Quantidade_Plantada, Localizacao);
    return result;

}
async function obterTotalMudas() {
    const sql = 'SELECT SUM(Quantidade_Plantada) AS total_mudas, MAX(Data_Plantio) AS data_atualizacao FROM plantio';
    const [rows] = await connection.execute(sql);
    return rows[0];
}

module.exports = {
    obterPlantios,
    incluirPlantios,
    obterTotalMudas
};
