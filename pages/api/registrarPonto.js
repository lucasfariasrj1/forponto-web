import pool from '../../lib/db';
import bcrypt from 'bcryptjs';

export default async function handler(req, res) {
  if (req.method !== 'POST') return res.status(405).json({ message: 'Método não permitido' });

  const { matricula, senha, hora } = req.body;

  try {
    // Verificar se o funcionário existe
    const [rows] = await pool.execute('SELECT * FROM funcionarios WHERE matricula = ?', [matricula]);

    if (rows.length === 0) {
      return res.status(404).json({ message: 'Funcionário não encontrado' });
    }

    const funcionario = rows[0];
    const hashedPassword = funcionario.senha;
    const isValid = await bcrypt.compare(senha, hashedPassword);

    if (!isValid) {
      return res.status(401).json({ message: 'Senha incorreta' });
    }

    // Verificar se já existe uma entrada hoje para o funcionário
    const dataHoje = hora.split(' ')[0];
    const [pontos] = await pool.execute(
      'SELECT * FROM pontos WHERE funcionario_id = ? AND data = ?',
      [funcionario.id, dataHoje]
    );

    if (pontos.length === 0) {
      // Registrar entrada
      await pool.execute(
        'INSERT INTO pontos (funcionario_id, data, hora_entrada, created_at) VALUES (?, ?, ?, NOW())',
        [funcionario.id, dataHoje, hora.split(' ')[1]]
      );
      return res.status(201).json({ message: 'Entrada registrada com sucesso!' });
    } else {
      // Registrar saída
      await pool.execute(
        'UPDATE pontos SET hora_saida = ?, updated_at = NOW() WHERE funcionario_id = ? AND data = ? AND hora_saida IS NULL',
        [hora.split(' ')[1], funcionario.id, dataHoje]
      );
      return res.status(200).json({ message: 'Saída registrada com sucesso!' });
    }
  } catch (error) {
    console.error('Erro ao registrar ponto:', error);
    res.status(500).json({ message: 'Erro interno do servidor' });
  }
}
