import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  int _currentStep = 0;

  // Controllers para os campos de texto
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _nameController = TextEditingController();
  final _birthdateController = TextEditingController();
  final _responsibleController = TextEditingController();
  final _cpfController = TextEditingController();
  final _cepController = TextEditingController(); // Novo campo CEP
  final _streetController = TextEditingController();
  final _neighborhoodController = TextEditingController();
  final _numberController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();

  final _heightController = TextEditingController();
  final _dominantLegController = TextEditingController();
  final _positionController = TextEditingController();
  final _weightController = TextEditingController();

  // Função para verificar se o step atual é válido
  bool _isCurrentStepValid() {
    switch (_currentStep) {
      case 0:
        return _emailController.text.isNotEmpty &&
            _passwordController.text.isNotEmpty &&
            _confirmPasswordController.text.isNotEmpty &&
            _passwordController.text == _confirmPasswordController.text;
      case 1:
        return _nameController.text.isNotEmpty &&
            _birthdateController.text.isNotEmpty &&
            _responsibleController.text.isNotEmpty &&
            _cpfController.text.isNotEmpty &&
            _cepController.text.isNotEmpty && // Validação do novo campo CEP
            _streetController.text.isNotEmpty &&
            _neighborhoodController.text.isNotEmpty &&
            _numberController.text.isNotEmpty &&
            _cityController.text.isNotEmpty &&
            _stateController.text.isNotEmpty;
      case 2:
        return _heightController.text.isNotEmpty &&
            _dominantLegController.text.isNotEmpty &&
            _positionController.text.isNotEmpty &&
            _weightController.text.isNotEmpty;
      default:
        return false;
    }
  }

  // Função que será chamada quando o formulário estiver completo
  void _submitForm() {
    // Aqui você pode processar o formulário e enviar os dados para o servidor ou salvar localmente
    print('Email: ${_emailController.text}');
    print('Senha: ${_passwordController.text}');
    print('Nome: ${_nameController.text}');
    print('Data de Nascimento: ${_birthdateController.text}');
    print('Nome do Responsável: ${_responsibleController.text}');
    print('CPF: ${_cpfController.text}');
    print('CEP: ${_cepController.text}');
    print(
        'Endereço: ${_streetController.text}, ${_neighborhoodController.text}, ${_numberController.text}, ${_cityController.text}, ${_stateController.text}');
    print('Altura: ${_heightController.text}');
    print('Perna Dominante: ${_dominantLegController.text}');
    print('Posição: ${_positionController.text}');
    print('Peso: ${_weightController.text}');

    // Exibe uma mensagem de sucesso e volta para a página anterior
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Registro completo!')),
    );
    Navigator.of(context).pop();
  }

  // Função para definir o título do step atual
  String _getStepTitle() {
    switch (_currentStep) {
      case 0:
        return 'Dados Cadastrais';
      case 1:
        return 'Dados Pessoais';
      case 2:
        return 'Dados Técnicos';
      default:
        return '';
    }
  }

  // Função para verificar se o step anterior está completo (para controlar o StepState)
  bool _isStepComplete(int step) {
    switch (step) {
      case 0:
        return _emailController.text.isNotEmpty &&
            _passwordController.text.isNotEmpty &&
            _confirmPasswordController.text.isNotEmpty &&
            _passwordController.text == _confirmPasswordController.text;
      case 1:
        return _nameController.text.isNotEmpty &&
            _birthdateController.text.isNotEmpty &&
            _responsibleController.text.isNotEmpty &&
            _cpfController.text.isNotEmpty &&
            _cepController.text.isNotEmpty && // Validação do novo campo CEP
            _streetController.text.isNotEmpty &&
            _neighborhoodController.text.isNotEmpty &&
            _numberController.text.isNotEmpty &&
            _cityController.text.isNotEmpty &&
            _stateController.text.isNotEmpty;
      case 2:
        return _heightController.text.isNotEmpty &&
            _dominantLegController.text.isNotEmpty &&
            _positionController.text.isNotEmpty &&
            _weightController.text.isNotEmpty;
      default:
        return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              _getStepTitle(),
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Stepper(
              type: StepperType.horizontal,
              currentStep: _currentStep,
              onStepTapped: (step) => setState(() => _currentStep = step),
              onStepContinue: () {
                if (_isCurrentStepValid()) {
                  if (_currentStep < 2) {
                    setState(() => _currentStep += 1);
                  } else {
                    _submitForm();
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(
                            'Por favor, preencha todos os campos obrigatórios')),
                  );
                }
              },
              onStepCancel: _currentStep > 0
                  ? () => setState(() => _currentStep -= 1)
                  : null,
              steps: [
                // Step 1: Dados Cadastrais
                Step(
                  title:
                      Container(), // Removido o título, exibindo apenas o número
                  content: Column(
                    children: [
                      CustomTextField(
                        controller: _emailController,
                        labelText: 'E-mail',
                        keyboardType: TextInputType.emailAddress,
                      ),
                      CustomTextField(
                        controller: _passwordController,
                        labelText: 'Senha',
                        obscureText: true,
                      ),
                      CustomTextField(
                        controller: _confirmPasswordController,
                        labelText: 'Confirmar senha',
                        obscureText: true,
                      ),
                    ],
                  ),
                  isActive: _currentStep >= 0,
                  state: _isStepComplete(0)
                      ? StepState.complete
                      : StepState.indexed,
                ),
                // Step 2: Dados Pessoais
                Step(
                  title:
                      Container(), // Removido o título, exibindo apenas o número
                  content: Column(
                    children: [
                      CustomTextField(
                        controller: _nameController,
                        labelText: 'Nome',
                      ),
                      CustomTextField(
                        controller: _birthdateController,
                        labelText: 'Data de nascimento',
                        keyboardType: TextInputType.datetime,
                      ),
                      CustomTextField(
                        controller: _responsibleController,
                        labelText: 'Nome do responsável',
                      ),
                      CustomTextField(
                        controller: _cpfController,
                        labelText: 'CPF',
                        keyboardType: TextInputType.number,
                      ),
                      CustomTextField(
                        controller: _cepController, // Campo de CEP
                        labelText: 'CEP',
                        keyboardType: TextInputType.number,
                      ),
                      CustomTextField(
                        controller: _streetController,
                        labelText: 'Rua',
                      ),
                      CustomTextField(
                        controller: _neighborhoodController,
                        labelText: 'Bairro',
                      ),
                      CustomTextField(
                        controller: _numberController,
                        labelText: 'Número',
                        keyboardType: TextInputType.number,
                      ),
                      CustomTextField(
                        controller: _cityController,
                        labelText: 'Cidade',
                      ),
                      CustomTextField(
                        controller: _stateController,
                        labelText: 'Estado',
                      ),
                    ],
                  ),
                  isActive: _currentStep >= 1,
                  state: _isStepComplete(1)
                      ? StepState.complete
                      : StepState.indexed,
                ),
                // Step 3: Dados Técnicos
                Step(
                  title:
                      Container(), // Removido o título, exibindo apenas o número
                  content: Column(
                    children: [
                      CustomTextField(
                        controller: _heightController,
                        labelText: 'Altura (cm)',
                        keyboardType: TextInputType.number,
                      ),
                      CustomTextField(
                        controller: _dominantLegController,
                        labelText: 'Perna dominante',
                      ),
                      CustomTextField(
                        controller: _positionController,
                        labelText: 'Posição',
                      ),
                      CustomTextField(
                        controller: _weightController,
                        labelText: 'Peso (kg)',
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                  isActive: _currentStep >= 2,
                  state: _isStepComplete(2)
                      ? StepState.complete
                      : StepState.indexed,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final TextInputType keyboardType;
  final bool obscureText;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide:
                BorderSide(color: Theme.of(context).primaryColor, width: 2.0),
          ),
        ),
      ),
    );
  }
}
