// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if a library contains two top-level
/// declarations with the same name, and:
/// - Neither is an augmenting declaration, or
/// - one of the declarations is a class-like declarations and the other is not
///   of the same kind, meaning that at either one is a class, mixin, enum,
///   extension or extension type declaration, and the other is not the same
///   kind of declaration.
///
/// @description Checks that it is a compile-time error if an augmented
/// declaration is a type alias and an augmenting declaration is not
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_types_A01_t02_lib1.dart';
import augment 'augmenting_types_A01_t02_lib2.dart';
import augment 'augmenting_types_A01_t02_lib3.dart';
import augment 'augmenting_types_A01_t02_lib4.dart';

class C {}

mixin M {}

enum E {e1;}

extension type ET(int _) {}

typedef CAlias = C;
typedef MAlias = M;
typedef EAlias = E;
typedef ETAlias = ET;

main() {
  print(CAlias);
  print(MAlias);
  print(EAlias);
  print(ETAlias);
}
