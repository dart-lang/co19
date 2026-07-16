// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let `T` be the actual returned type of a function literal as
/// computed above. Let `R` be the greatest closure of the typing context `K` as
/// computed above.
///
/// With null safety: if `R` is `void`, or the function literal is marked
/// `async` and `R` is `FutureOr<void>`, let `S` be `void`.
///
/// Otherwise, if `T <: R` then let `S` be `T`. Otherwise, let `S` be `R`. The
/// inferred return type of the function literal is then defined as follows:
/// - If the function literal is marked `async` then the inferred return type is
///   `Future<flatten(S)>`.
/// - If the function literal is marked `async*` then the inferred return type
///   is `Stream<S>`.
/// - If the function literal is marked `sync*` then the inferred return type is
///   `Iterable<S>`.
/// - Otherwise, the inferred return type is `S`.
///
/// @description Check that if actual return type is `void`, then the inferred
/// return type of the function literal is `void`. It is a compile-time error to
/// use this value.
/// @author sgrekhov22@gmail.com

import 'function_literal_inference_A06_lib1.dart';

main() {
  Object? _ = f1();
//            ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = f2();
//            ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = f3();
//            ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = f4();
//            ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  Object? _ = C.sf1();
//            ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = C.sf2();
//            ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = C.sf3();
//            ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = C.sf4();
//            ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = C().f1();
//            ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = C().f2();
//            ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = C().sf3();
//            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = C().sf4();
//            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  Object? _ = M.sf1();
//            ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = M.sf2();
//            ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = M.sf3();
//            ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = M.sf4();
//            ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = MA().f1();
//            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = MA().f2();
//            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = MA().sf3();
//            ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = MA().sf4();
//            ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  Object? _ = MC.sf1();
//            ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = MC.sf2();
//            ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = MC.sf3();
//            ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = MC.sf4();
//            ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = MC().f1();
//            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = MC().f2();
//            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = MC().sf3();
//            ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = MC().sf4();
//            ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  Object? _ = E.sf1();
//            ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = E.sf2();
//            ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = E.sf3();
//            ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = E.sf4();
//            ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  Object? _ = Ext.sf1();
//            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = Ext.sf2();
//            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = Ext.sf3();
//            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = Ext.sf4();
//            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  Object? _ = ET.sf1();
//            ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = ET.sf2();
//            ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = ET.sf3();
//            ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = ET.sf4();
//            ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
