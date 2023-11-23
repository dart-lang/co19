// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Calling a redirecting factory constructor k causes the
/// constructor k' denoted by type (respectively, type.identifier) to be called
/// with the actual arguments passed to k, and returns the result of k' as the
/// result of k. The resulting constructor call is governed by the same rules
/// as an instance creation expression using new.
/// @description Checks that compile error occurs when referenced type is not
/// defined or refers to non class or non constructor.
/// @author ilya


function() {}
var variable;

class F {
  factory F() = C;
//              ^
// [analyzer] unspecified
// [cfe] unspecified
  factory F.foo() = function;
//                  ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  factory F.bar() = variable;
//                  ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  factory F.baz() = D.baz;
//                  ^^^^^
// [analyzer] COMPILE_TIME_ERROR.REDIRECT_TO_MISSING_CONSTRUCTOR
// [cfe] Redirection constructor target not found: 'D.baz'
}

class D {
  void baz() {}
}

main() {
}
