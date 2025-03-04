// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The definitions of least and greatest closure are changed in null
/// safe libraries to substitute [Never] in positions where previously [Null
/// would have been substituted, and [Object?] in positions where previously
/// [Object] or [dynamic] would have been substituted.
///
/// @description Check that [Object?] type is substituted for [void
/// Function({required bool x})] typedef.
/// @note Read more about the least and greatest closure test template:
/// https://github.com/dart-lang/co19/issues/575#issuecomment-613542349
/// @author iarkh@unipro.ru
/// @Issue 42682, 42683, 42788

import "../../../../Utils/expect.dart";

typedef check = void Function({required bool x});

void main() {
  void f(check Function() g) => g();
  // Verify that we can call the function with the specified arguments.
  f(() => captureTypeArgument()..call(x: true));

  // Runtime error is thrown here, see Issues 42682, 42683 for more details.
  f(() => captureTypeArgument()..call());
//                                   ^
// [analyzer] unspecified
// [cfe] unspecified

 // Verify that a couple of wrong argument lists are rejected.
  f(() => captureTypeArgument()..call(throw 1));
//                                   ^
// [analyzer] unspecified
// [cfe] unspecified

  f(() => captureTypeArgument()..call('Hello'));
//                                   ^
// [analyzer] unspecified
// [cfe] unspecified

  f(() => captureTypeArgument()..call(x: 'Hello'));
//                                       ^
// [analyzer] unspecified
// [cfe] unspecified

  f(() => captureTypeArgument()..call(x: null));
//                                       ^
// [analyzer] unspecified
// [cfe] unspecified

  // Verify that the return type is `void`: Returned value not usable,
  // not even to access a member of `Object`.
  f(() => captureTypeArgument()..call(x: true).toString());
//                               ^
// [analyzer] unspecified
// [cfe] unspecified
}
