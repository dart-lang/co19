// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if the declared return type of a
/// function marked async is not a supertype of Future<T> for some type T
///
/// @description Check that it is no compile time error, if the declared
/// return type of asynchronous function is a supertype of `Future<T>`
/// @author a.semenov@unipro.ru

import 'dart:async';

dynamic a() async {
  return 'a';
}

Future<String> b() async {
  return 'b';
}

Future<Never> c() async {
  return throw 1;
}

main() {
  a();
  b();
  print(c);
}
