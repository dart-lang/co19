// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if a final static or library variable
/// has no initializing expression, unless the variable declaration has the
/// modifier `late` or the modifier `external`.
///
/// @note There is no this statement in the specification, it is defined by the
/// grammar.
///
/// @description Checks that it is not an error if an external library or static
/// final variable is not initialized in its declaration.
/// @author sgrekhov22@gmail.com

external final int v;

class C {
  external static final int v;
}

mixin M {
  external static final int v;
}

enum E {
  e0;
  external static final int v;
}

class A {}

extension Ext on A {
  external static final int v;
}

extension type ET(int _) {
  external static final int v;
}

main() {
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
