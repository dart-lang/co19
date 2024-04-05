// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A class, enum, extension type, or mixin augmentation may specify
/// extends, implements, on, and with clauses (when generally supported). The
/// types in these clauses are appended to the original declarations clauses of
/// the same kind, and if that clause did not exist previously then it is added
/// with the new types. All regular rules apply after this appending process, so
/// you cannot have multiple extends on a class, or an on clause on an enum, etc
///
/// @description Checks that it is a compile-time error if a class, extension
/// type, mixin or enum augment specifies an interface in an `implements` clause
/// which already exists
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_types_A07_t07_lib.dart';

abstract interface class I {
  String foo();
}

class C1 implements I {
  String foo() => "C1";
}

extension type ET(I _) implements I {
  String foo() => "ET";
}

abstract class C2 implements I {}

mixin M implements I {}

enum E implements I {
  e1;

  String foo() => "C1";
}

main() {
  print(C1);
  print(C2);
  print(M);
  print(E);
}
