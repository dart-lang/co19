// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion To handle these gracefully, we support a [...?] "null-aware
/// spread" operator. In cases where the spread expression evaluates to [null],
/// that expands to an empty collection instead of throwing a runtime expression.
///
///  That turns the example to:
///
///   var command = [
///   engineDartPath,
///   '--target=flutter',
///   ...?extraFrontEndOptions,
///   mainPath
///   ];
/// @description Checks that it is a compile error if spreadable element in the
/// [Map] is not null-aware and it's [null].
/// @author iarkh@unipro.ru


Map getAMap(
    String engineDartPath, Map? extraFrontEndOptions, String mainPath) {
  return({1: engineDartPath, 2: '--target=flutter', ...extraFrontEndOptions,
//                                                     ^
// [analyzer] unspecified
// [cfe] unspecified
      3: mainPath});
}

main() {
  getAMap("enginePath", null, "mainPath");
}
