// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If the introductory variable declaration does not have a type
/// annotation, then the variable's declared type is found using only that
/// declaration, without looking at any further augmenting declarations. The
/// type can either be inferred from an initializer expression of the
/// introductory variable declaration, be inherited from a superinterface for an
/// instance variable, or default to a type of `dynamic` if neither applies.
/// This ensures that augmenting a variable doesn't change its type. That is
/// necessary to ensure that macros cannot change the signature of a
/// declaration, a signature which may have been depended on by other code, or
/// other macros.
///
/// @description Checks that it is not an error if a type of the augmenting
/// variable matches the default type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part 'augmenting_variables_A05_t04_lib.dart';

var topLevelVariable;

class C {
  static var staticVariable;
  var instanceVariable;
}

mixin M {
  static var staticVariable;
  var instanceVariable;
}

enum E {
  e0;
  static var staticVariable;
}

class A {}

extension Ext on A {
  static var staticVariable;
}

extension type ET(String _) {
  static var staticVariable;
}

class MA = Object with M;

main() {
  if (1 > 2) {
    topLevelVariable.checkTypeDynamic;
    C.staticVariable.checkTypeDynamic;
    C().instanceVariable.checkTypeDynamic;
    M.staticVariable.checkTypeDynamic;
    MA().instanceVariable.checkTypeDynamic;
    E.staticVariable.checkTypeDynamic;
    Ext.staticVariable.checkTypeDynamic;
    ET.staticVariable.checkTypeDynamic;
  }
}
