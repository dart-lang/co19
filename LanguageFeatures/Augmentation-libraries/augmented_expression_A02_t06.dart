// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting setters: Within an augmenting setter `augmented` must be
///   followed by an `=` and will directly invoke the augmented setter. If
///   augmenting a variable with a setter, this will invoke the implicitly
///   induced setter from the augmented variable declaration.
///
/// @description Checks that within an augmenting setter `augmented=` invokes
/// the augmented setter but within an augmented setter `augmented=` can be used
/// to invoke appropriate setter if there is one in the scope.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import '../../Utils/expect.dart';
part 'augmented_expression_A02_t06_lib.dart';

String _log = "";

void set augmented(String value) {
  _log = "Setter augmented: $value";
}

void set topLevelSetter(String value) {
  augmented = "$value, via original declaration";
}


class C {
  static void set staticSetter(String value) {
    augmented = "$value, via original declaration";
  }
  void set instanceSetter(String value) {
    augmented = "$value, via original declaration";
  }
}

mixin M {
  static void set staticSetter(String value) {
    augmented = "$value, via original declaration";
  }
  void set instanceSetter(String value) {
    augmented = "$value, via original declaration";
  }
}

enum E {
  e1;

  static void set staticSetter(String value) {
    augmented = "$value, via original declaration";
  }
  void set instanceSetter(String value) {
    augmented = "$value, via original declaration";
  }
}

class A {}

extension Ext on A {
  static void set staticSetter(String value) {
    augmented = "$value, via original declaration";
  }
  void set instanceSetter(String value) {
    augmented = "$value, via original declaration";
  }
}

class MA = Object with M;

main() {
  topLevelSetter = "1";
  Expect.equals("Augmented: 1", _log);
  C.staticSetter = "2";
  Expect.equals("Augmented: 2", _log);
  C().instanceSetter = "3";
  Expect.equals("Augmented: 3", _log);
  M.staticSetter = "4";
  Expect.equals("Augmented: 4", _log);
  MA().instanceSetter = "5";
  Expect.equals("Augmented: 5", _log);
  E.staticSetter = "6";
  Expect.equals("Augmented: 6", _log);
  E.e1.instanceSetter = "7";
  Expect.equals("Augmented: 7", _log);
  Ext.staticSetter = "8";
  Expect.equals("Augmented: 8", _log);
  A().instanceSetter = "9";
  Expect.equals("Augmented: 9", _log);
}
