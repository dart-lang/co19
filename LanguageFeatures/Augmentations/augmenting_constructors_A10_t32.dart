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
/// It is a compile-time error if:
/// - The signature of the augmenting function does not match the signature of
///   the augmented function.
///
/// @description Checks that it is not an error if a positional declaring
/// parameter whose name is not `_` is accessed in the body of a primary
/// constructor even if there is an augmentation in the chain that use wildcard
/// as its name.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,primary-constructors

import '../../utils/expect.dart';

String log = "";

class C1(var int _x) {
  this {
    log = "$_x";
  }
}

augment class C1 {
  augment C1(int _);
}

class C2([final int _x = 0]) {
  this {
    log = "$_x";
  }
}

augment class C2 {
  augment C2([int _]);
}

enum E1(final int? _x) {
  e0(1);

  this : assert(_x != null);
}

augment enum E1 {
  ;
  augment const E(int? _);
}

enum E2([final int? _x]) {
  e0(1);

  this : assert(_x != null);
}

augment enum E2 {
  ;
  augment const E([int? _]);
}

extension type ET(int _x) {
  this {
    log = "$_x";
  }
}

augment extension type ET {
  augment ET(int _);
}

checkLog(String expected) {
  Expect.equals(expected, log);
  log = "";
}

main() {
  C1(1);
  checkLog("1");
  C2(2);
  checkLog("2");

  print(E1);
  print(E2);

  ET(1);
  checkLog("1");
}
