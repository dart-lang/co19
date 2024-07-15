// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting operators: When augmenting an operator, `augmented` refers to
///   the augmented operator method, which must be immediately invoked using
///   function call syntax. For example when augmenting `operator +` you would
///   use `augmented(1)` to call the augmented operator, and when augmenting
///   `operator []=` you would use the `augmented(key, value)` syntax.
///
/// @description Checks that within an augmenting operator `augmented` invokes
/// the augmented one and evaluates it to the return value. Test a local
/// function.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmented_expression_A05_t21_lib.dart';
import '../../Utils/expect.dart';

String _log = "";

class C {
  void operator []=(int index, Object? value) {
    _log = "Original [$index]=$value";
  }
}

mixin M {
  void operator []=(int index, Object? value) {
    _log = "Original [$index]=$value";
  }
}

enum E {
  e1;
  void operator []=(int index, Object? value) {
    _log = "Original [$index]=$value";
  }
}

class A {}

extension Ext on A {
  void operator []=(int index, Object? value) {
    _log = "Original [$index]=$value";
  }
}

class MA = Object with M;

main() {
  Expect.equals("Augmented [1]=2", C()[1] = 2);
  Expect.equals("Augmented [3]=4", MA()[3] = 4);
  Expect.equals("Augmented [5]=6", E.e1[5] = 6);
  Expect.equals("Augmented [7]=8", A()[7] = 8);
}
