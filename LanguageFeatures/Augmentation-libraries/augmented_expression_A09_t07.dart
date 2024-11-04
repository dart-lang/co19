// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if a declaration with the basename
/// `augmented` occurs in a location where any enclosing declaration is
/// augmenting.
///
/// @description Checks that it is a compile-time error if a declaration of a
/// member with a formal parameter whose type name is `augmented` occurs in a
/// location where there is an enclosing augmenting declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part 'augmented_expression_A09_t07_lib.dart';

class augmented {}

class C {}
mixin M {}
enum E {e0;}

class A {}
extension Ext on A {}
extension type ET(int _) {}

main() {
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
