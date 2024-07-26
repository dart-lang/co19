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

augment library 'augmenting_variables_A05_t04.dart';

augment dynamic topLevelVariable;

augment class C {
  augment static Object? staticVariable;
  augment Object? instanceVariable;
}

augment mixin M {
  augment static Object? staticVariable;
  augment Object? instanceVariable;
}

augment enum E {
  augment e0;
  augment static Object? staticVariable;
}

augment extension Ext {
  augment static Object? staticVariable;
}

augment extension type ET(String _) {
  augment static Object? staticVariable;
}
