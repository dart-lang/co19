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
/// augmented by another variable with the same type. Test function type with
/// omitted return type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../utils/static_type_helper.dart';

dynamic foo() => 42;

dynamic Function() topLevelVariable = foo;

augment abstract Function() topLevelVariable;

class C {
  static dynamic Function() staticVariable = foo;
  dynamic Function() instanceVariable = foo;
}

augment class C {
  augment Function() get staticVariable;
  augment set staticVariable(Function() _);
  augment abstract Function() instanceVariable;
}

mixin M {
  static dynamic Function() staticVariable = foo;
  dynamic Function() instanceVariable = foo;
}

augment mixin M {
  augment Function() get staticVariable;
  augment set staticVariable(Function() _);
  augment abstract Function() instanceVariable;
}

enum E {
  e0;
  static dynamic Function() staticVariable = foo;
  final dynamic Function() instanceVariable = foo;
}

augment enum E {
  ;
  augment Function() get staticVariable;
  augment set staticVariable(Function() _);
  augment abstract final Function() instanceVariable;
}

class A {}

extension Ext on A {
  static dynamic Function() staticVariable = foo;
}

augment extension Ext {
  augment Function() get staticVariable;
  augment set staticVariable(Function() _);
}

extension type ET(dynamic Function() instanceVariable) {
  static dynamic Function() staticVariable = foo;
}

augment extension Ext {
  augment Function() get staticVariable;
  augment set staticVariable(Function() _);
  augment abstract final Function() instanceVariable;
}

class MA = Object with M;

main() {
  topLevelVariable.expectStaticType<Exactly<dynamic Function()>>();
  C.staticVariable.expectStaticType<Exactly<dynamic Function()>>();
  C().instanceVariable.expectStaticType<Exactly<dynamic Function()>>();
  M.staticVariable.expectStaticType<Exactly<dynamic Function()>>();
  MA().instanceVariable.expectStaticType<Exactly<dynamic Function()>>();
  E.staticVariable.expectStaticType<Exactly<dynamic Function()>>();
  E.e0.instanceVariable.expectStaticType<Exactly<dynamic Function()>>();
  Ext.staticVariable.expectStaticType<Exactly<dynamic Function()>>();
  ET.staticVariable.expectStaticType<Exactly<dynamic Function()>>();
  ET((){}).instanceVariable.expectStaticType<Exactly<dynamic Function()>>();
}
