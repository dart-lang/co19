// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - The resulting constructor is not valid (it has a redirection as well as
///   some initializer list elements, or it has multiple super initializers,
///   etc).
///
/// @description Checks that it is a compile-time error if a merged constructor
/// is cyclic.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part 'augmenting_constructors_A06_t04_lib.dart';

class C {
  C();
  C.foo();
  C.bar();
}

enum E {
  e0;
  const E();
  const E.foo();
  const E.bar();
}

extension type ET(int x) {
  ET.foo(int x);
  ET.bar(int x);
}

main() {
  print(C);
  print(E);
  print(ET);
}
