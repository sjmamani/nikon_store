class GroceryProduct {
  final double price;
  final String name;
  final String description;
  final List<String> images;
  final String stock;

  const GroceryProduct(
      {this.price, this.name, this.description, this.images, this.stock});
}

const groceryProducts = <GroceryProduct>[
  GroceryProduct(
      price: 70.835,
      name: 'D3500',
      description:
          'Tome imágenes más memorables. Las fotos que tome con la D3500 serán más que meras imágenes de un momento; serán imágenes cargadas de sentimientos que podrá compartir de manera inmediata con sus amigos y familiares y que podrá revivir cuando lo desee.',
      images: [
        'assets/images/d3500/nikon_d3500_1.png',
        'assets/images/d3500/nikon_d3500_2.png',
        'assets/images/d3500/nikon_d3500_3.png',
        'assets/images/d3500/nikon_d3500_4.png',
      ],
      stock: '4 disponibles'),
  GroceryProduct(
      price: 89.486,
      name: 'D5600',
      description:
          'Querrá compartir cada toma cuando vea el detalle extraordinario, la claridad y el bajo ruido que puede lograr con la D5600 y un lente versátil de kit de NIKKOR. Su gran sensor de alta resolución y el amplio alcance ISO ayuda a ofrecer fotos y videos de alta calidad en casi cualquier condición, desde cielos soleados hasta conciertos poco iluminados.',
      images: [
        'assets/images/d5600/nikon_d5600_1.png',
        'assets/images/d5600/nikon_d5600_2.png',
        'assets/images/d5600/nikon_d5600_3.png',
        'assets/images/d5600/nikon_d5600_4.png',
        'assets/images/d5600/nikon_d5600_5.png',
      ],
      stock: '4 disponibles'),
  GroceryProduct(
      price: 134.796,
      name: 'D7500',
      description:
          'La D7500 cuenta con el mismo sensor de imagen de formato DX de 20.9 MP y con el mismo motor de procesamiento de imágenes EXPEED 5 que la D500, lo que hará que sus fotos y videos parezcan de un nivel superior. Capture imágenes con una nitidez y una tonalidad increíbles, en especial, en situaciones de poca luz, como recitales, eventos deportivos, fiestas y eventos sociales.',
      images: [
        'assets/images/d7500/nikon_d7500_1.png',
        'assets/images/d7500/nikon_d7500_2.png',
        'assets/images/d7500/nikon_d7500_3.png',
        'assets/images/d7500/nikon_d7500_4.png',
        'assets/images/d7500/nikon_d7500_5.png',
      ],
      stock: '3 disponibles'),
  GroceryProduct(
      price: 199.500,
      name: 'D610',
      description:
          'Los fotógrafos apasionados que buscan un rendimiento de alta resolución y en marco completo confían en las cámaras réflex digital HD con formato FX de Nikon. Con un nivel de rendimiento que solo es conseguido por las series de cámaras réflex digitales D800, el sensor CMOS de formato FX con 24.3 megapíxeles de la D610, alcance dinámico amplio y alta relación S/N (señal a ruido) captura cada detalle con una nitidez vibrante y bajo ruido mediante su alcance amplio ISO',
      images: [
        'assets/images/d610/nikon_d610_1.png',
        'assets/images/d610/nikon_d610_2.png',
        'assets/images/d610/nikon_d610_3.png'
      ],
      stock: '2 disponibles'),
  GroceryProduct(
      price: 265.500,
      name: 'D810',
      description:
          'Se ha elevado el nivel La D810 verdaderamente aumenta el nivel de calidad de imagen y rango dinámico. Un diseño totalmente nuevo para el sensor de imagen con encuadre completo, formato FX—36.3 megapíxeles sin filtro óptico de paso bajo—se complementa con el procesamiento de imágenes innovador EXPEED 4 de Nikon para obtener una retención de detalles perfecta de blanco como la nieve a negro oscuro, imágenes hermosas sin ruido desde ISO 64 hasta ISO 12,800.',
      images: [
        'assets/images/d810/nikon_d810_1.png',
        'assets/images/d810/nikon_d810_2.png',
        'assets/images/d810/nikon_d810_3.png',
        'assets/images/d810/nikon_d810_4.png',
        'assets/images/d810/nikon_d810_5.png',
      ],
      stock: '4 disponibles'),
  GroceryProduct(
      price: 399.500,
      name: 'D3x',
      description:
          'Sensor CMOS con formato FX de 24.5 megapíxelesLos 24.5 megapíxeles del sensor son solo el comienzo. No importa cómo usted dispare (de forma controlada o sobre la marcha) el extraordinariamente amplio rango dinámico de la cámara conserva la sutileza de las sombras y el detalle de los puntos de luz para ofrecer una fidelidad de imagen impresionante, lo que puede hacer la diferencia entre una buena imagen y una excepcional.',
      images: [
        'assets/images/d3x/nikon_d3x_1.png',
        'assets/images/d3x/nikon_d3x_2.png',
        'assets/images/d3x/nikon_d3x_3.png',
        'assets/images/d3x/nikon_d3x_4.png',
      ],
      stock: '1 disponible')
];
