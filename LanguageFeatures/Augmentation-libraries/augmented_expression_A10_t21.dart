// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider a non-augmenting member declaration Dm that occurs
/// inside an augmenting type declaration Dt. A compile-time error occurs if the
/// identifier `augmented` occurs in Dm.
///
/// @description Checks that it is a compile-time error if a variable with the
/// name `augmented` occurs in a control-flow element in a location where there
/// is an enclosing augmenting declaration. Test top level and instance members.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmented_expression_A10_t21_lib.dart';

void topLevelFunction() {}

class C {}
mixin M {}
enum E {
  e1;
}
class A {}
extension Ext on A {}
extension type ET(int _) {}

main() {
  print(topLevelFunction);
  print(C);
  print(M);
  print(E);
  print(A);
}
