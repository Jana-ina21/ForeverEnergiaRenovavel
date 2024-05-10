document.addEventListener('DOMContentLoaded', function() {
    let formulario = document.querySelector('form.formulario');
    let inputs = formulario.getElementsByTagName('input');

    formulario.addEventListener('submit', function(e) {
        let fisica = document.getElementById('fisica').checked;
        let juridica = document.getElementById('juridica').checked;

        if (!fisica && !juridica) {
            alert('Por favor, selecione uma opção: Pessoa Física ou Pessoa Jurídica.');
            e.preventDefault();
            return;
        }

        alert('Formulário enviado com sucesso!');
    });

    for (let i = 0; i < inputs.length; i++) {
        let input = inputs[i];
        let tipo = input.getAttribute('type');

        if (tipo === 'text' || tipo === 'email' || tipo === 'tel' || tipo === 'number') {
            input.addEventListener('blur', function() {
                let valor = this.value;
                if (this.id === 'nome') {
                    if (valor.length < 4) {
                        alert('O Nome precisa ter mais de 3 caracteres.');
                        this.classList.add('invalido');
                        return;
                    }
                } else if (this.id === 'email') {
                    if (!valor.includes('@') || !valor.includes('.com')) {
                        alert('O E-Mail precisa ter "@" e ".com".');
                        this.classList.add('invalido');
                        return;
                    }
                } else if (this.id === 'celular') {
                    if (valor.replace(/[^\d]/g, '').length !== 11) {
                        alert('O Celular precisa ter DDD e 9 dígitos.');
                        this.classList.add('invalido');
                        return;
                    }
                } else if (this.id === 'cep') {
                    if (valor.length !== 8) {
                        alert('O CEP precisa ter 8 dígitos.');
                        this.classList.add('invalido');
                        return;
                    }
                } else if (this.id === 'endereco') {
                    if (valor.length === 0) {
                        alert('O Endereço não pode ficar vazio.');
                        this.classList.add('invalido');
                        return;
                    }
                } else if (this.id === 'numero') {
                    if (valor.length === 0) {
                        alert('O Número não pode ficar vazio.');
                        this.classList.add('invalido');
                        return;
                    }
                } else if (this.id === 'bairro') {
                    if (valor.length === 0) {
                        alert('O Bairro não pode ficar vazio.');
                        this.classList.add('invalido');
                        return;
                    }
                } else if (this.id === 'cidade') {
                    if (valor.length === 0) {
                        alert('A cidade não pode ficar vazia.');
                        this.classList.add('invalido');
                        return;
                    }
                } else if (this.id === 'estado') {
                    if (valor.length === 0) {
                        alert('O estado não pode ficar vazio.');
                        this.classList.add('invalido');
                        return;
                    }
                } else if (this.id === 'gasto') {
                    if (valor.length === 0 || valor < 1) {
                        alert('O valor gasto de luz por mês deve ser maior que zero.');
                        this.classList.add('invalido');
                        return;
                    }
                }
                this.classList.remove('invalido');
            });
        }
    }

    // Adicionar validação para os botões de Pessoa Física ou Jurídica
    let radios = formulario.getElementsByName('pessoa');
    for (let i = 0; i < radios.length; i++) {
        let radio = radios[i];
        radio.addEventListener('click', function() {
            if (this.id === 'fisica') {
                document.getElementById('juridica').disabled = true;
            } else if (this.id === 'juridica') {
                document.getElementById('fisica').disabled = true;
            }
        });
    }
});
