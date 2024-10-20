import { useState, useEffect } from 'react';
import 'bootstrap/dist/css/bootstrap.min.css';

export default function Login() {
  const [matricula, setMatricula] = useState('');
  const [senha, setSenha] = useState('');
  const [time, setTime] = useState(new Date());

  // Atualizar o relógio a cada segundo
  useEffect(() => {
    const timer = setInterval(() => setTime(new Date()), 1000);
    return () => clearInterval(timer);
  }, []);

  const handleLogin = async (e) => {
    e.preventDefault();
    try {
      const response = await fetch('/api/login', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ matricula, senha }),
      });
      const data = await response.json();
      if (response.ok) {
        alert('Login bem-sucedido!');
      } else {
        alert(data.message);
      }
    } catch (error) {
      alert('Erro ao fazer login');
    }
  };

  return (
    <div className="d-flex min-vh-100 align-items-center justify-content-center bg-light">
      <div className="card shadow-lg p-4" style={{ width: '100%', maxWidth: '400px' }}>
        <div className="card-body">
          <h2 className="card-title text-center mb-3">Registro de Ponto</h2>
          <p className="text-center text-muted mb-4">
            {time.toLocaleTimeString('pt-BR', { hour: '2-digit', minute: '2-digit', second: '2-digit' })}
          </p>
          <form onSubmit={handleLogin}>
            <div className="mb-3">
              <label htmlFor="matricula" className="form-label">Matrícula</label>
              <input
                id="matricula"
                type="text"
                placeholder="Digite sua matrícula"
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
                placeholder="Digite sua senha"
                value={senha}
                onChange={(e) => setSenha(e.target.value)}
                required
                className="form-control"
              />
            </div>
            <button type="submit" className="btn btn-primary w-100">Entrar</button>
          </form>
        </div>
      </div>
    </div>
  );
}
