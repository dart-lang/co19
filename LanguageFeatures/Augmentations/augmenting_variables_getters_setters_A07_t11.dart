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
/// augmented by another variable with no type specified.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

// TODO (sgrekhov) This test does not include static abstract variable
// declarations because the grammar doesn't derive them. See
// https://github.com/dart-lang/language/issues/4592

import '../../utils/static_type_helper.dart';

abstract Null Function(Null _) topLevelVariable;

augment topLevelVariable = (v) {
  v.expectStaticType<Exactly<Object?>>();
};

class C {
  abstract Null Function(Null _) instanceVariable;
}

augment class C {
  augment instanceVariable = (v) {
    v.expectStaticType<Exactly<Object?>>();
  };
}

mixin M {
  abstract Null Function(Null _) instanceVariable;
}

augment mixin M {
  augment instanceVariable = (v) {
    v.expectStaticType<Exactly<Object?>>();
  };
}

enum E {
  e0;
  abstract final Null Function(Null _) instanceVariable;
}

augment enum E {
  ;
  augment final instanceVariable = (v) {
    v.expectStaticType<Exactly<Object?>>();
  };
}

class MA = Object with M;

main() {
  topLevelVariable.expectStaticType<Exactly<Null Function(Null)>>();
  C().instanceVariable.expectStaticType<Exactly<Null Function(Null)>>();
  MA().instanceVariable.expectStaticType<Exactly<Null Function(Null)>>();
  E.e0.instanceVariable.expectStaticType<Exactly<Null Function(Null)>>();
}
