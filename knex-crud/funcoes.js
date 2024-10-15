//Funcao para criar a tabela pessoas no banco de dados;
export async function criarTabela(conexao) {
    //2 parametros: nome da tabela e uma função de callback
    await conexao.schema.createTable('pessoas', table => {
        //cria uma coluna id que é auto incrementável
        table.increments('id').primary();
        //cria uma coluna nome que não pode ser nula
        table.string('nome').notNullable();
        table.string('email').notNullable();
    });
    console.log('Tabela criada');
}

//2 parametros: conexao com o banco de dados e um objeto com os dados a serem inseridos
export async function inserir(conexao, inserir) {
    // await conexao("pessoas").insert(inserir) -> op1
    // await conexao.insert(inserir).into("pessoas") -> op2
    await conexao("pessoas").insert(inserir)
    console.log('Registro inserido');
}


//2 parametros: conexao com o banco de dados e um objeto com os dados a serem consultados
export async function consultar(conexao, filtro) {
    // conexao('pessoas').where(filtro) //op1
    // conexao.select().from('pessoas').where(filtro) //op2

    const dados = await conexao.select().from('pessoas').where(filtro)
    console.log(dados);
}

//3 parametros: conexao com o banco de dados, o objeto com os dados a serem alterados 
export async function alterar(conexao, ondeAlterar, oQueAlterar) {
    await conexao('pessoas').where(ondeAlterar).update(oQueAlterar)
    console.log('Registro atualizado');
}

//delete -> 2 parametros: conexao com o banco de dados e um objeto com os dados a serem deletados
export async function deletar(conexao, filtro) {
    await conexao('pessoas').where(filtro).del()
    console.log('Registro deletado');
}