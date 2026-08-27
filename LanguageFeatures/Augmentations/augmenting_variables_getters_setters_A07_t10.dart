// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that an augmenting function or constructor's signature
/// matches if:
/// - It has the same number of type parameters with the same type parameter
///   names (same identifiers) and bounds (after type annotation inheritance),
///   if any (same types, even if they may not be written exactly the same in
///   case one of the declarations needs to refer to a type using an import
///   prefix).
/// - The return type (if not omitted) is the same as the augmented
///   declaration's return type.
/// - It has the same number of positional and optional parameters as the
///   augmented declaration.
/// - It has the same set of named parameter names as the augmented declaration.
/// - For all corresponding pairs of parameters:
///   - They have the same type (if not omitted in the augmenting declaration).
///   - They have the same `required` and `covariant` modifiers.
/// - For all positional parameters:
///   - The augmenting function's parameter name is `_`, or
///   - The augmenting function's parameter name is the same as the name of the
///     corresponding positional parameter in every preceding declaration that
///     doesn't have `_` as its name.
/// ...
/// It's a compile-time error if:
/// - The signature of the augmenting getter or setter does not match the
///   signature of the augmented getter or setter.
///
/// @description Check that it is not an error if a function-typed variable is
/// augmented by another variable with the same type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../utils/static_type_helper.dart';

var topLevelVariable = (v) {};

augment abstract Null Function(dynamic v) topLevelVariable;

class C {
  static var staticVariable = (v) {};
  var instanceVariable = (v) {};
}

augment class C {
  augment Null Function(dynamic v) get staticVariable;
  augment void set staticVariable(Null Function(dynamic v) _);
  augment abstract Null Function(dynamic v) instanceVariable;
}

mixin M {
  static var staticVariable = (v) {};
  var instanceVariable = (v) {};
}

augment mixin M {
  augment Null Function(dynamic v) get staticVariable;
  augment void set staticVariable(Null Function(dynamic v) _);
  augment abstract Null Function(dynamic v) instanceVariable;
}

enum E {
  e0;
  static var staticVariable = (v) {};
  final instanceVariable = (v) {};
}

augment enum E {
  ;
  augment Null Function(dynamic v) get staticVariable;
  augment void set staticVariable(Null Function(dynamic v) _);
  augment abstract final Null Function(dynamic v) instanceVariable;
}

class A {}

extension Ext on A {
  static var staticVariable = (v) {};
}

augment extension Ext {
  augment Null Function(dynamic v) get staticVariable;
  augment void set staticVariable(Null Function(dynamic v) _);
}

extension type ET(Null Function(dynamic v) instanceVariable) {
  static var staticVariable = (v) {};
}

augment extension type ET {
  augment Null Function(dynamic v) get staticVariable;
  augment void set staticVariable(Null Function(dynamic v) _);
  augment abstract final Null Function(dynamic v) instanceVariable;
}

class MA = Object with M;

main() {
  topLevelVariable.expectStaticType<Exactly<Null Function(dynamic)>>();
  C.staticVariable.expectStaticType<Exactly<Null Function(dynamic)>>();
  C().instanceVariable.expectStaticType<Exactly<Null Function(dynamic)>>();
  M.staticVariable.expectStaticType<Exactly<Null Function(dynamic)>>();
  MA().instanceVariable.expectStaticType<Exactly<Null Function(dynamic)>>();
  E.staticVariable.expectStaticType<Exactly<Null Function(dynamic)>>();
  E.e0.instanceVariable.expectStaticType<Exactly<Null Function(dynamic)>>();
  Ext.staticVariable.expectStaticType<Exactly<Null Function(dynamic)>>();
  ET.staticVariable.expectStaticType<Exactly<Null Function(dynamic)>>();
  ET((v){}).instanceVariable.expectStaticType<Exactly<Null Function(dynamic)>>();
}
