main() {
  List<List<int>> list = [
    [4, 0, 1],
    [10, 7, 0],
    [0, 0, 0],
    [9, 1, 2]
  ];
  List<int> total = [];
  for (int i = 0; i < list.length; i++) {
    List<int> anterior = [];
    List<int> proximo = [];
    List<int> atual = list[i];
    var itemsSize = atual.length;

    if (i > 0) {
      anterior = list[i - 1];
    }

    for (int x = 0; x < itemsSize; x++) {
      if (anterior.length != 0 && anterior[x] != 0) {
        total.add(anterior[x]);
      }
    }

    print('anterior: ${anterior}');
    print('atual: ${atual}');
    print('proximo: ${proximo}');
  }

  var sum = 0;
  total.forEach((element) {
    sum = sum + element;
  });

  print('total: ${total}, sum = ${sum}');
}
