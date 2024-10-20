import { useState, useEffect } from 'react';
import 'bootstrap/dist/css/bootstrap.min.css';

export default function RegistroPonto() {
  const [matricula, setMatricula] = useState('');
  const [senha, setSenha] = useState('');
  const [mensagem, setMensagem] = useState('');
  const [horaAtual, setHoraAtual] = useState(new Date());

  // Atualizar o relógio a cada segundo
  useEffect(() => {
    const timer = setInterval(() => setHoraAtual(new Date()), 1000);
    return () => clearInterval(timer);
  }, []);

  // Função para formatar a data e hora para o formato "YYYY-MM-DD HH:MM:SS"
  const formatDateTime = (date) => {
    const pad = (num) => String(num).padStart(2, '0');
    const year = date.getFullYear();
    const month = pad(date.getMonth() + 1);
    const day = pad(date.getDate());
    const hours = pad(date.getHours());
    const minutes = pad(date.getMinutes());
    const seconds = pad(date.getSeconds());
    return `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;
  };

  const registrarPonto = async (e) => {
    e.preventDefault();
    setMensagem('');
    const hora = formatDateTime(horaAtual); // Usa a hora atual formatada
    try {
      const response = await fetch('/api/registrarPonto', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ matricula, senha, hora }),
      });
      const data = await response.json();

      if (response.ok) {
        setMensagem(data.message);
      } else {
        setMensagem(data.message);
      }
    } catch (error) {
      setMensagem('Erro ao registrar ponto.');
    }
  };

  return (
    <div className="d-flex min-vh-100 align-items-center justify-content-center bg-light">
      <div className="card shadow-lg p-4" style={{ width: '100%', maxWidth: '400px' }}>
        <div className="card-body">
          <h2 className="card-title text-center mb-3">Registro de Ponto</h2>
          <p className="text-center text-muted mb-4">
            {horaAtual.toLocaleTimeString('pt-BR', { hour: '2-digit', minute: '2-digit', second: '2-digit' })}
          </p>
          {mensagem && <div className="alert alert-info">{mensagem}</div>}
          <form onSubmit={registrarPonto}>
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
            <button type="submit" className="btn btn-primary w-100">
              Registrar Ponto
            </button>
          </form>
        </div>
      </div>
    </div>
  );
}
