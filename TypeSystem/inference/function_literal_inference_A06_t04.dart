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
/// @description Check that if actual return type is `void` and the function
/// literal is marked `async`, then the inferred return type of the function
/// literal is `Future<void>`. It is a compile-time error to await and then use
/// this value.
/// @author sgrekhov22@gmail.com

import 'function_literal_inference_A06_lib2.dart';

main() async {
  Object? _ = await f1();
//            ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = await f2();
//            ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = await f3();
//            ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = await f4();
//            ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  Object? _ = await C.sf1();
//            ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = await C.sf2();
//            ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = await C.sf3();
//            ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = await C.sf4();
//            ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = await C().f1();
//            ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = await C().f2();
//            ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = await C().sf3();
//            ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = await C().sf4();
//            ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  Object? _ = await M.sf1();
//            ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = await M.sf2();
//            ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = await M.sf3();
//            ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = await M.sf4();
//            ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = await MA().f1();
//            ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = await MA().f2();
//            ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = await MA().sf3();
//            ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = await MA().sf4();
//            ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  Object? _ = await MC.sf1();
//            ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = await MC.sf2();
//            ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = await MC.sf3();
//            ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = await MC.sf4();
//            ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = await MC().f1();
//            ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = await MC().f2();
//            ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = await MC().sf3();
//            ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = await MC().sf4();
//            ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  Object? _ = await E.sf1();
//            ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = await E.sf2();
//            ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = await E.sf3();
//            ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = await E.sf4();
//            ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  Object? _ = await Ext.sf1();
//            ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = await Ext.sf2();
//            ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = await Ext.sf3();
//            ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = await Ext.sf4();
//            ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  Object? _ = await ET.sf1();
//            ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = await ET.sf2();
//            ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = await ET.sf3();
//            ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? _ = await ET.sf4();
//            ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
