// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The records feature is language versioned, as usual with new Dart
/// features. This means that it will be an error to use the syntax for records
/// in libraries which do not have a language version greater than or equal to
/// the language version in which records are released.
///
/// @description Check that it is not an error if class [Record] from dart:core
/// is used in a library whose language version is less than language version in
/// which records are released.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

// @dart = 2.18

import "interaction_with_legacy_A01_lib.dart";

typedef T1 = Record;

T? foo<T>(T? t) => t;

main() {
  Record? r = null;
  foo<Record>(null);
}
