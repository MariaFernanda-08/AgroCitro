
const express = require('express');
const { obterPlantios, incluirPlantios, obterTotalMudas } = require('./db/plantio.js');
const app = express();
const cors = require('cors');


app.use(express.json());
app.use(cors()); 


app.get('/plantios', async (req, res) => {
    try {
        const plantios = await obterPlantios();
        res.json(plantios);
    } catch (error) {
        console.error('Erro ao obter plantios:', error);
        res.status(500).json({ message: 'Erro ao obter plantios' });
    }
});

app.post('/plantios', async (req, res) => {
    const { ID_Plantio, Variedade, Data_Plantio, Quantidade_Plantada, Localizacao } = req.body;
    try {
        const result = await incluirPlantios(ID_Plantio, Variedade, Data_Plantio, Quantidade_Plantada, Localizacao);
        res.status(201).json({ message: 'Plantio inserido com sucesso', result });
    } catch (error) {
        console.error('Erro ao inserir plantio:', error);
        res.status(500).json({ message: 'Erro ao inserir plantio' });
    }
});


app.post('/adicionar-plantio', async (req, res) => {

    const { ID_Plantio, Variedade, Data_Plantio, Quantidade_Plantada, Localizacao } = req.body;
    try {
        const resp = await incluirPlantios(ID_Plantio, Variedade, Data_Plantio, Quantidade_Plantada, Localizacao);

    if(resp.affectedRows > 0)
        {
            res.json ({msg:'Esta configurado!'});
        }
        else{
            res.json({msg:'Não esta configurado!'});
        }
}   catch (error) {
    console.error('Erro ao inserir plantio:', error);
    res.status(500).json({ message: 'Erro ao inserir plantio' });
    }
});    
    


app.get('/total-mudas', async (req, res) => {
    try {
        const totalMudas = await obterTotalMudas();
        res.json(totalMudas);
    } catch (error) {
        console.error('Erro ao obter total de mudas:', error);
        res.status(500).json({ message: 'Erro ao obter total de mudas' });
    }
});



app.listen(3000, () => {
    console.log(`Servidor rodando na porta ${3000}`);
});
