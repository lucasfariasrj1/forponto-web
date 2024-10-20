import { useState } from 'react';

export default function Ponto() {
  const [funcionarioId, setFuncionarioId] = useState(null);

  const registrarEntrada = async () => {
    const response = await fetch('/api/registrarEntrada', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ funcionarioId }),
    });
    const data = await response.json();
    alert(data.message);
  };

  const registrarSaida = async () => {
    const response = await fetch('/api/registrarSaida', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ funcionarioId }),
    });
    const data = await response.json();
    alert(data.message);
  };

  return (
    <div>
      <button onClick={registrarEntrada}>Registrar Entrada</button>
      <button onClick={registrarSaida}>Registrar Saída</button>
    </div>
  );
}
