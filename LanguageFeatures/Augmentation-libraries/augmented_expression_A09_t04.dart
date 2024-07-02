// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if a declaration with the name
/// `augmented` occurs in a location where the outermost enclosing declaration
/// is augmenting.
///
/// @description Checks that it is a compile-time error if a declaration of a
/// setter with the name `augmented=` occurs in a location where the outermost
/// enclosing declaration is augmenting.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmented_expression_A09_t04_lib.dart';

class C1 {}
class C2 {}
mixin M1 {}
mixin M2 {}
enum E1 {e0;}
enum E2 {e0;}

class A {}
extension Ext1 on A {}
extension Ext2 on A {}

main() {
  print(C1);
  print(C2);
  print(M1);
  print(M2);
  print(E1);
  print(E2);
  print(A);
}
