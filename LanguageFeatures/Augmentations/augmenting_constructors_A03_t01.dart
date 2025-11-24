// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - The introductory constructor is `const` and the augmenting constructor is
///   not or vice versa.
///
/// @description Checks that it is a compile-time error if the introductory
/// constructor is `const` and the augmenting constructor is not.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part 'augmenting_constructors_A03_t01_lib.dart';

class C {
  const C();
}

extension type ET(int id) {
  const ET.foo(this.id);
}

main() {
  print(C);
  print(ET);
}
