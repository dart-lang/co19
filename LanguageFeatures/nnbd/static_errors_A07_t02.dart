// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is an error to derive a mixin from a class declaration which
/// contains an instance variable with a potentially non-nullable type and no
/// initializer expression unless the variable is marked with the `late`
/// modifier.
///
/// @description Check that it is not an error to derive a mixin from a class
/// declaration which contains an instance variable with a potentially
/// non-nullable type and no initializer expression but this variable is marked
/// `late`.
/// @author sgrekhov22@gmail.com

mixin class C {
  late Object instance;
}

mixin M1 on C {
}

class M2 = Object with C;

main() {
  print(M1);
  print(M2);
}
