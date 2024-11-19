// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The special type `void` is used to indicate that the value of an
/// expression is meaningless and intended to be discarded.
///
/// @description Checks that it is not an error to specify an alias of the type
/// `void` as a type parameter bound.
/// @author sgrekhov22@gmail.com

typedef Void = void;

void f<T extends Void>() {}

class A<T extends Void> {}

class B {
  static void foo<T extends Void>() {}
  void bar<T extends Void>() {}
}

mixin M<T extends Void> {}

enum E<T extends Void> {
  e0;
}

class C {}

extension Ext<T extends Void> on C {}

extension type ET<T extends Void>(int _) {}

main() {
  print(A);
  print(M);
  print(E);
  print(C);
  print(ET);
}
