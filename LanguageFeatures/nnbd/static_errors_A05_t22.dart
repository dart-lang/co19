// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is an error if a class declaration declares an instance
/// variable with a potentially non-nullable type and no initializer expression,
/// and the class has a generative constructor where the variable is not
/// initialized via an initializing formal or an initializer list entry, unless
/// the variable is marked with a `late`, `abstract`, or `external` modifier.
///
/// @description Check that it is not an error if a class declaration declares
/// an instance variable with a potentially non-nullable type and no initializer
/// expression, and the class has a generative constructor where the variable is
/// not initialized via an initializing formal or an initializer list entry, but
/// the variable is marked with a `late` or `abstract` modifier. Test type
/// `Function`.
/// @author sgrekhov@unipro.ru

abstract class A {
  abstract Function x1;
  abstract final Function x2;
  abstract covariant Function x3;
}

class C {
  late Function x1;
  late final Function x2;
  covariant late Function x3;
}

main() {
  print(A);
  new C();
}
