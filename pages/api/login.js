import pool from '../../lib/db';
import { verifyPassword } from '../../lib/auth';

export default async function handler(req, res) {
  if (req.method !== 'POST') return res.status(405).json({ message: 'Método não permitido' });

  const { matricula, senha } = req.body;

  try {
    // Log para verificar os dados recebidos
    console.log('Dados recebidos:', { matricula, senha });

    const [rows] = await pool.execute('SELECT * FROM funcionarios WHERE matricula = ?', [matricula]);

    // Log para verificar se encontrou o funcionário
    console.log('Resultado da consulta:', rows);

    if (rows.length === 0) {
      console.error('Funcionário não encontrado');
      return res.status(404).json({ message: 'Funcionário não encontrado' });
    }

    const funcionario = rows[0];
    const isValid = await verifyPassword(senha, funcionario.senha);

    if (!isValid) {
      console.error('Senha incorreta');
      return res.status(401).json({ message: 'Senha incorreta' });
    }

    console.log('Login bem-sucedido para:', funcionario);
    res.status(200).json({ message: 'Login bem-sucedido', funcionarioId: funcionario.id });
  } catch (error) {
    console.error('Erro interno do servidor:', error);
    res.status(500).json({ message: 'Erro interno do servidor' });
  }
}
