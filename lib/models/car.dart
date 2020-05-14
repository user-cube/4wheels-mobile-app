import 'package:fourwheels/models/car_fact.dart';

class Car {
  final int id;
  final String name;
  final String imagePath;
  final String price;
  final String shortDesc;
  final List<CarFact> facts;

  Car(
      {this.id,
      this.name,
      this.imagePath,
      this.price,
      this.shortDesc,
      this.facts});

  static List<Car> fetchAll() {
    return [
      Car(
          id: 1,
          name: 'Tesla Model X',
          imagePath: 'assets/images/teslaModelX.jpg',
          price: '112000€',
          shortDesc: 'Melhor SUV elétrico do mercado.',
          facts: [
            CarFact('Descrição',
                'O Model X é o SUV com mais espaço de armazenamento no seu segmento, dispõe de lugares confortáveis para até sete adultos e apresenta uma capacidade de reboque de até 2.250 quilos. As portas Falcon Wing estão equipadas com sensores que monitorizam a proximidade do espaço circundante e podem ser abertas mesmo nos espaços de estacionamento mais estreitos.'),
            CarFact('Segurança do veículo',
                'Construído desde a base como um veículo elétrico, a carroçaria, o chassis, o sistema de retenção e a tecnologia da bateria garantem uma probabilidade muito baixa de ferimentos para os ocupantes.'),
          ]),
      Car(
          id: 2,
          name: 'Tesla Model S',
          imagePath: 'assets/images/teslaModelS.jpg',
          price: '106600€',
          shortDesc: 'O carro elétrico mais rápido do mundo.',
          facts: [
            CarFact('Descrição',
                'Com o Model S vai onde quiser. Com uma autonomia líder no seu setor e opções práticas de carregamento disponíveis em todo o mundo.'),
            CarFact('Segurança do veículo',
                'O Model S define um padrão na indústria em termos de desempenho e segurança. O grupo motopropulsor completamente elétrico da Tesla garante um desempenho inigualável em todas as condições climatéricas – com motor duplo com tração integral, suspensão pneumática adaptável e aceleração Ludicrous.'),
          ]),
      Car(
          id: 3,
          name: 'Tesla Model 3',
          imagePath: 'assets/images/teslaModel3.jpg',
          price: '48900€',
          shortDesc: 'O conforto ao melhor preço.',
          facts: [
            CarFact('Descrição',
                'O Model 3 vem equipado com a opção de motor duplo com tração integral, travões e jantes de 20” Performance e suspensão rebaixada para um controlo total, em todas as condições climatéricas. Além disso, um aileron em fibra de carbono melhora a estabilidade a velocidades elevadas, tudo isto permitindo que o Model 3 ofereça uma aceleração dos 0-100 km/h em apenas 3,4 segundos.'),
            CarFact('Segurança do veículo',
                'A segurança é o aspeto mais importante do design geral do Model 3. A estrutura metálica é uma combinação de alumínio e aço para proporcionar a máxima robustez em todas as áreas. Num teste de resistência do tejadilho, o Model 3 apresentou uma resistência de quatro vezes a sua própria massa, mesmo com um tejadilho completamente panorâmico: é o mesmo peso de dois elefantes africanos adultos.'),
          ]),
    ];
  }

  static Car fetchById(int carID) {
    // fecth all Cars;
    // iterate them and when we find the Car
    // with the ID we want, return it immediately

    List<Car> cars = Car.fetchAll();
    for (var i = 0; i < cars.length; i++) {
      if (cars[i].id == carID) {
        return cars[i];
      }
    }
    return null;
  }
}