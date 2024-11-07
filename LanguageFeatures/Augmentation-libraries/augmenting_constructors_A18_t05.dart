// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Redirecting generative constructors
/// ...
/// It is a compile-time error if:
/// - The augmented constructor has any initializers or a body.
///
/// @description Checks that it is a compile-time error if the merged
/// constructor is cyclic.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part 'augmenting_constructors_A18_t05_lib.dart';

class C {
  C();
  C.foo();
}

enum E {
  e0;
  const E();
  const E.foo();
}

extension type ET(int x) {
  ET.foo(this.x);
}

main() {
  print(C);
  print(E);
  print(ET);
}
