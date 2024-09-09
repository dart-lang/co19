// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Assume that the identifier `augmented` occurs in a source
/// location where no enclosing declaration is augmenting. In this case, the
/// identifier is taken to be a reference to a declaration which is in scope.
///
/// @description Checks that if an identifier `augmented` occurs in a source
/// location where no enclosing declaration is augmenting then the identifier is
/// taken to be a reference to a declaration which is in scope. Test a getter
/// named `augmented`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmented_expression_A08_t02.dart';

String topLevelFunction() => augmented;

class C {
  static String staticMethod() => augmented;
  String instanceMethod() => augmented;
}

mixin M {
  static String staticMethod() => augmented;
  String instanceMethod() => augmented;
}

class MA = Object with M;

enum E {
  e1;

  static String staticMethod() => augmented;
  String instanceMethod() => augmented;
}

extension Ext on A {
  static String staticMethod() => augmented;
  String instanceMethod() => augmented;
}
