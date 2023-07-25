const url = 'http://localhost:3000/tests';

fetch(url)
  .then((response) => response.json())
  .then((data) => {
    const tbody = document.querySelector('#test-list');

    const tokenHeader = document.createElement('h2');
    tokenHeader.id = 'token-header';
    tokenHeader.textContent = `TODOS OS EXAMES`;
    const table = document.querySelector('table');
    document.body.insertBefore(tokenHeader, table);

    data.forEach((test) => {
      const tr = document.createElement('tr');
      const name = document.createElement('td');
      const testType = document.createElement('td');
      const testLimits = document.createElement('td');
      const testResult = document.createElement('td');
      name.textContent = test.nome_paciente;
      testType.textContent = test.tipo_exame;
      testLimits.textContent = test.limites_tipo_exame;
      testResult.textContent = test.resultado_tipo_exame;
      tr.appendChild(name);
      tr.appendChild(testType);
      tr.appendChild(testLimits);
      tr.appendChild(testResult);
      tbody.appendChild(tr);
    });
  })
  .catch((error) => {
    console.log(error);
  });

document.querySelector('#search-form').addEventListener('submit', function(event) {
  event.preventDefault();
  const token = document.querySelector('#search-input').value;
  document.querySelector('#search-input').value = '';

  const oldTokenHeader = document.querySelector('#token-header');
  if (oldTokenHeader) {
    oldTokenHeader.remove();
  }

  document.querySelector('thead th:first-child').textContent = 'DATA';

  fetch(`${url}/${token}`)
    .then((response) => response.json())
    .then((data) => {
      document.querySelector('#test-list').innerHTML = '';
      const tokenHeader = document.createElement('h2');
      tokenHeader.textContent = `TOKEN: ${token}`;
      const infoList = document.querySelector('#info-list');
      document.body.insertBefore(tokenHeader, infoList);

      const patientInfo = data[0];
      const infoKeys = {
        cpf: 'CPF',
        nome_paciente: 'NOME',
        email_paciente: 'EMAIL',
        data_nascimento_paciente: 'DATA DE NASCIMENTO',
        endereço_rua_paciente: 'ENDEREÇO',
        cidade_paciente: 'CIDADE',
        estado_patiente: 'ESTADO',
        nome_médico: 'MÉDICO',
        email_médico: 'EMAIL DO MÉDICO',
        crm_médico: 'CRM DO MÉDICO',
        crm_médico_estado: 'CRM DO ESTADO'
      };

      for (let key in infoKeys) {
        if (patientInfo.hasOwnProperty(key)) {
          const listItem = document.createElement('li');
          listItem.innerHTML = `<span class="info-key">${infoKeys[key]}:</span> <span class="info-value">${patientInfo[key]}</span>`;
          infoList.appendChild(listItem);
        }
      }

      const tbody = document.querySelector('#test-list');
      data.forEach((test) => {
        const tr = document.createElement('tr');
        const testDate = document.createElement('td');
        const testType = document.createElement('td');
        const testLimits = document.createElement('td');
        const testResult = document.createElement('td');
        testDate.textContent = test.data_exame;
        testType.textContent = test.tipo_exame;
        testLimits.textContent = test.limites_tipo_exame;
        testResult.textContent = test.resultado_tipo_exame;
        tr.appendChild(testDate);
        tr.appendChild(testType);
        tr.appendChild(testLimits);
        tr.appendChild(testResult);
        tbody.appendChild(tr);
      });
    })
    .catch((error) => {
      console.log(error);
    });
});
