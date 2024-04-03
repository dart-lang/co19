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
/// @description Checks that it is a compile-time error if an augment adds a
/// superclass in an `extends` statement which is not compatible with existing
/// interfaces
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

//import augment 'augmenting_types_A06_t03_lib.dart';

abstract interface class I {
  int get foo => 1;
}

class A {
  void set foo(String v) {}
}

class C1 implements I {
  int get foo => 2;
}

abstract class C2 implements I {}

main() {
  print(C1);
  print(C2);
}
