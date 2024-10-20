import pool from '../../lib/db';
import { hashPassword } from '../../lib/auth';

export default async function handler(req, res) {
  if (req.method !== 'POST') return res.status(405).json({ message: 'Método não permitido' });

  const { matricula, senha, nome } = req.body;

  // Verificar se todos os campos foram fornecidos
  if (!matricula || !senha || !nome) {
    return res.status(400).json({ message: 'Todos os campos são obrigatórios.' });
  }

  try {
    // Verificar se a matrícula já existe
    const [rows] = await pool.execute('SELECT * FROM funcionarios WHERE matricula = ?', [matricula]);

    if (rows.length > 0) {
      return res.status(409).json({ message: 'Matrícula já cadastrada.' });
    }

    // Hash da senha
    const hashedPassword = await hashPassword(senha);

    // Inserir novo funcionário no banco de dados
    await pool.execute(
      'INSERT INTO funcionarios (matricula, senha, nome, created_at) VALUES (?, ?, ?, NOW())',
      [matricula, hashedPassword, nome]
    );

    res.status(201).json({ message: 'Funcionário cadastrado com sucesso!' });
  } catch (error) {
    console.error('Erro ao cadastrar funcionário:', error);
    res.status(500).json({ message: 'Erro interno do servidor' });
  }
}
