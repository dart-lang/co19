// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Redirecting generative constructors
/// ...
/// It is a compile-time error if:
/// - The augmented constructor has an initializer list or a body, or it has a
///   redirection.
///
/// @description Checks that it is a compile-time error if a merged constructor
/// is cyclic.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part 'augmenting_constructors_A18_t07_lib.dart';

class C {
  C();
  C.foo();
  C.bar();
}

main() {
  print(C);
}
