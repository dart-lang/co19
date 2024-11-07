// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Redirecting factory constructors
/// ...
/// It is a compile-time error if:
/// - The augmented constructor has a body.
///
/// @description Checks that it is a compile-time error to declare an augmenting
/// redirecting factory constructor if an introductory constructor has any
/// default values.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part 'augmenting_constructors_A20_t04_lib.dart';

class C {
  int x;
  C([this.x = 0]);
  C.foo({this.x = 0});
  factory C.bar([int x = 0]);
  factory C.baz({int x = 0});
}

extension type ET(int x) {
  ET.foo([this.x = 0]);
  ET.bar({this.x = 0});
  factory ET.baz([int x = 0]);
  factory ET.qux({int x = 0});
}

main() {
  print(C);
  print(ET);
}
