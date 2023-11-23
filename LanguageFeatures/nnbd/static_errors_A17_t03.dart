// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is not an error to call or tear-off a method, setter, or
/// getter, or to read or write a field, on a receiver of static type Never.
/// Implementations that provide feedback about dead or unreachable code are
/// encouraged to indicate that any arguments to the invocation are unreachable.
///
/// @description Check that it is a warning to call a method, setter, or
/// getter on a receiver of static type Never via a null aware operator.
/// @author sgrekhov@unipro.ru
/// @issue 39866

// Requirements=nnbd-strong

Never foo() => throw Exception();

main() {
  try {
    foo()?.toString();
//       ^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//  ^
// [cfe] Operand of null-aware operation '?.' has type 'Never' which excludes null.
    foo()?.runtimeType;
//       ^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//  ^
// [cfe] Operand of null-aware operation '?.' has type 'Never' which excludes null.
    foo()?.s = 1;
//       ^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//  ^
// [cfe] Operand of null-aware operation '?.' has type 'Never' which excludes null.
    foo()?..toString();
//       ^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//  ^
// [cfe] Operand of null-aware operation '?..' has type 'Never' which excludes null.
    foo()?..runtimeType;
//       ^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//  ^
// [cfe] Operand of null-aware operation '?..' has type 'Never' which excludes null.
    foo()?..s = 1;
//       ^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//  ^
// [cfe] Operand of null-aware operation '?..' has type 'Never' which excludes null.

  } catch (_) {}
}
