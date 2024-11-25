// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Redirecting generative constructors
/// ...
/// It is a compile-time error if:
/// - The augmented constructor has an initializer list or a body, or it has a
///   redirection.
///
/// @description Checks that it is a compile-time error to declare an augmenting
/// redirecting generative constructor more than once.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part 'augmenting_constructors_A18_t04_lib.dart';

class C {
  int x;
  C(this.x);
  C.foo(int x);
}

enum E {
  e0(0), e1.foo(1);
  final int x;
  const E(this.x);
  const E.foo(int x);
}

extension type ET(int x) {
  ET.foo(int x);
}

main() {
  print(C);
  print(E);
  print(ET);
}
