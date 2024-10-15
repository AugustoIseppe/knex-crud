import knex from 'knex';
import knexfile from './knexfile.js';
import { criarTabela, inserir, consultar, alterar, deletar } from './funcoes.js';

const conexao = knex(knexfile);

//cria a tabela
// await criarTabela(conexao);

//insere um registro
// await inserir(conexao, { nome: 'Fulano', email: '' }); -> op1
// await inserir(conexao, [
//     { nome: 'Scofielf', email: 'scofield@gmail.com' },
//     { nome: 'Michael', email: 'michael@gmail.com' },
//     { nome: 'Lincoln', email: 'licncoln@gmail.com' },
//     { nome: 'T-Bag', email: 'tbag@gmail.com' },
//     { nome: 'Sucre', email: 'sucre@gmail.com' }
// ]); //-> op2


//atualiza um registro
await alterar(conexao, { id: 1 }, { nome: 'Augusto', email: 'a@gmail.com' });

//deleta um registro
await deletar(conexao, { id: 1 });

//consulta os registros
await consultar(conexao, {});

conexao.destroy(); //fecha a conexão com o banco de dados