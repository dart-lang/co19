// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if a declaration with the basename
/// `augmented` occurs in a location where any enclosing declaration is
/// augmenting.
///
/// @description Checks that it is not an error to use metadata named
/// `augmented` on class-like augmenting declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

const augmented = 0;

@augmented
class C {}

@augmented
augment class C {}

@augmented
mixin M {}

@augmented
augment mixin M {}

@augmented
enum E {
  e0;
}

@augmented
augment enum E {
  e1;
}

class A {}

@augmented
extension Ext on A {}

@augmented
augment extension Ext {}

@augmented
extension type ET(int _) {}

@augmented
augment extension type ET {}

main() {
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
