import { useState } from 'react';
import 'bootstrap/dist/css/bootstrap.min.css';

export default function CadastrarFuncionario() {
  const [matricula, setMatricula] = useState('');
  const [senha, setSenha] = useState('');
  const [nome, setNome] = useState('');
  const [mensagem, setMensagem] = useState('');

  const handleCadastro = async (e) => {
    e.preventDefault();
    setMensagem(''); // Limpar mensagem

    try {
      const response = await fetch('/api/cadastrarFuncionario', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ matricula, senha, nome }),
      });
      const data = await response.json();

      if (response.ok) {
        setMensagem('Funcionário cadastrado com sucesso!');
        setMatricula('');
        setSenha('');
        setNome('');
      } else {
        setMensagem(data.message);
      }
    } catch (error) {
      setMensagem('Erro ao cadastrar funcionário.');
    }
  };

  return (
    <div className="d-flex min-vh-100 align-items-center justify-content-center bg-light">
      <div className="card shadow-lg p-4" style={{ width: '100%', maxWidth: '400px' }}>
        <div className="card-body">
          <h2 className="card-title text-center mb-3">Cadastrar Funcionário</h2>
          {mensagem && <div className="alert alert-info">{mensagem}</div>}
          <form onSubmit={handleCadastro}>
            <div className="mb-3">
              <label htmlFor="nome" className="form-label">Nome</label>
              <input
                id="nome"
                type="text"
                placeholder="Digite o nome"
                value={nome}
                onChange={(e) => setNome(e.target.value)}
                required
                className="form-control"
              />
            </div>
            <div className="mb-3">
              <label htmlFor="matricula" className="form-label">Matrícula</label>
              <input
                id="matricula"
                type="text"
                placeholder="Digite a matrícula"
                value={matricula}
                onChange={(e) => setMatricula(e.target.value)}
                required
                className="form-control"
              />
            </div>
            <div className="mb-3">
              <label htmlFor="senha" className="form-label">Senha</label>
              <input
                id="senha"
                type="password"
                placeholder="Digite a senha"
                value={senha}
                onChange={(e) => setSenha(e.target.value)}
                required
                className="form-control"
              />
            </div>
            <button type="submit" className="btn btn-primary w-100">Cadastrar</button>
          </form>
        </div>
      </div>
    </div>
  );
}
