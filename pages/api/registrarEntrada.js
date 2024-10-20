import pool from '../../lib/db';

export default async function handler(req, res) {
  if (req.method !== 'POST') return res.status(405).json({ message: 'Método não permitido' });

  const { matricula, senha } = req.body;

  try {
    // Verificar se o funcionário existe
    const [rows] = await pool.execute('SELECT * FROM funcionarios WHERE matricula = ?', [matricula]);

    if (rows.length === 0) {
      return res.status(404).json({ message: 'Funcionário não encontrado' });
    }

    const funcionario = rows[0];
    const hashedPassword = funcionario.senha;

    // Verificar a senha
    const bcrypt = require('bcryptjs');
    const isValid = await bcrypt.compare(senha, hashedPassword);

    if (!isValid) {
      return res.status(401).json({ message: 'Senha incorreta' });
    }

    // Registrar entrada
    const data = new Date().toISOString().split('T')[0];
    const hora = new Date().toISOString().split('T')[1].split('.')[0];
    
    await pool.execute(
      'INSERT INTO pontos (funcionario_id, data, hora_entrada, created_at) VALUES (?, ?, ?, NOW())',
      [funcionario.id, data, hora]
    );

    res.status(201).json({ message: 'Entrada registrada com sucesso' });
  } catch (error) {
    console.error('Erro ao registrar entrada:', error);
    res.status(500).json({ message: 'Erro interno do servidor' });
  }
}
