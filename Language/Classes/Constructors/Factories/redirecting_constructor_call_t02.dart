// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For the dynamic semantics, assume that k is a redirecting factory
/// constructor and k′ is the redirectee of k
/// ...
/// When the redirectee k′ is a generative constructor, let o be a
/// fresh instance of the class that contains k′. Execution of k then amounts to
/// execution of k′ to initialize o, governed by the same rules as an instance
/// creation expression. If k′ completed normally then the execution of k
/// completes normally returning o, otherwise k completes by throwing the
/// exception and stack trace thrown by k′.
///
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
  print(F);
}
