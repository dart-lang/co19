// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The definitions of least and greatest closure are changed in null
/// safe libraries to substitute [Never] in positions where previously [Null
/// would have been substituted, and [Object?] in positions where previously
/// [Object] or [dynamic] would have been substituted.
/// @description Check that [Object?] type is substituted for [FutureOr<X>].
/// @note Read more about the least and greatest closure test template:
/// https://github.com/dart-lang/co19/issues/575#issuecomment-613542349
///
/// @Issue 44070
/// @author iarkh@unipro.ru


import "../../../../Utils/expect.dart";
import "dart:async";

void main() {
  void f<X>(FutureOr<X> Function() g) => g();

  // Verify that `x` does not have type `dynamic` (but, expecting the type
  // to be `Object?` we need the null aware access `?.`).
  f(() => captureTypeArgument()..unknownMember);
//                               ^
// [analyzer] unspecified
// [cfe] unspecified

  f(() => captureTypeArgument()?..unknownMember);
//                                ^
// [analyzer] unspecified
// [cfe] unspecified

  f(() => captureTypeArgument()..toString());

  f(() => captureTypeArgument()?..toString());

}
