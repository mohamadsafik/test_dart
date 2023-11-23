void main() {
  //generate list 100 angka
  List<int> listNumber = List.generate(100, (int index) {
    // ubah index dari 0-99 ke 1-100
    int angka = index + 1;
    return angka;
    // dibalik urutannya dari besar ke terkecil
  }).reversed.toList();

// hapus dari list angka yang prima
  listNumber.removeWhere((item) => isPrime(item) == true);

// update angka yang data dibagi 3, 5 atau 3 dan 5
  List<dynamic> updatedList = listNumber.map(updateNumbers).toList();

// hasil
  print(updatedList);
}

// method untuk ubah foo, bar, foobar
dynamic updateNumbers(int number) {
  if (number % 5 == 0 && number % 3 == 0) {
    return "FooBar";
  } else if (number % 3 == 0) {
    return "foo";
  } else if (number % 5 == 0) {
    return "Bar";
  }

  return number;
}

//method check angka itu prime atau bukan
bool isPrime(int number) {
  if (number <= 1) {
    return false;
  }

  for (int i = 2; i <= (number / 2); i++) {
    if (number % i == 0) {
      return false;
    }
  }

  return true;
}
