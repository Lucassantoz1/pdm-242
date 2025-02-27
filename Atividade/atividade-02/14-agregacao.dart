// Agregação e Composição
import 'dart:convert';

class Dependente {
  String nome;

  Dependente(this.nome);

  Map<String, dynamic> toJson() => {
        'nome': nome,
      };
}

class Funcionario {
  String nome;
  List<Dependente> dependentes;

  Funcionario(this.nome, this.dependentes);

  Map<String, dynamic> toJson() => {
        'nome': nome,
        'dependentes': dependentes.map((d) => d.toJson()).toList(),
      };
}

class EquipeProjeto {
  String nomeProjeto;
  List<Funcionario> funcionarios;

  EquipeProjeto(this.nomeProjeto, this.funcionarios);

  Map<String, dynamic> toJson() => {
        'nomeProjeto': nomeProjeto,
        'funcionarios': funcionarios.map((f) => f.toJson()).toList(),
      };
}

void main() {
  // 1. Criar vários objetos Dependente
  var dependente1 = Dependente("Lucas");
  var dependente2 = Dependente("Kayo");
  var dependente3 = Dependente("Taveira");

  // 2. Criar vários objetos Funcionario e associar dependentes
  var funcionario1 = Funcionario("Carlos", [dependente1]);
  var funcionario2 = Funcionario("Mariana", [dependente2, dependente3]);

  // 3. Criar uma lista de Funcionarios
  List<Funcionario> listaFuncionarios = [funcionario1, funcionario2];

  // 4. Criar um objeto EquipeProjeto
  var equipeProjeto = EquipeProjeto("Desenvolvimento Flutter", listaFuncionarios);

  // 5. Converter para JSON e imprimir
  String jsonEquipe = jsonEncode(equipeProjeto);
  print(jsonEquipe);
}
