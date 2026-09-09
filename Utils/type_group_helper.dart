// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Confirm that the receiver type is in TOP, OBJECT, or NULL.  For all tests in
/// this library, it must first be known that the type is not `dynamic`;
/// alternatively, the code must be executed. In both cases, the tests do not
/// work if the given receiver is statically known to have a member with the
/// given name (e.g., `e.expectStaticTop` will not work as intended if `e` has a
/// getter with that name).
///
/// For bottom types, no member can be missing (this type of receiver is assumed
/// to have all members, with all signatures). This implies that the techniques
/// used here will not work. However, we can use a check for the type `dynamic`
/// (`e.doesNotExist` has no error), and then we can use assignment to `int` and
/// assignment to `String` to recognize that it is a bottom type (for all other
/// types, at least one of those assignments will be an error).

part of 'static_type_helper.dart';

/// Support `e.expectStaticTop()` if the static type of `e` is TOP.
/// A compile-time error occurs in all other cases except extension types and
/// type variable.
/// ```
/// extension type ET(int _) {}
///
/// void f<T>(T t, ET et) {
///   t.expectStaticTOP(); // No error
///   et.expectStaticTOP(); // No error
/// }
/// ```
/// These cases should be checked separately.
extension ExpectStaticTop on Object? {
  void expectStaticTOP() {}
}

// The following two extensions match every type which is not TOP.
// They use a setter to obtain the "no such method" error for
// invocations of `expectStaticTop` as a method. They use
// parameter type `Never` to prevent regular setter usage (which
// would be confusing because it's a useless thing to do).
extension ExpectStaticTopFailObject on Object {
  set expectStaticTOP(Never _) {}
}

extension ExpectStaticTopFailNull on Null {
  set expectStaticTOP(Never _) {}
}

// Support `e.expectStaticOBJECT()` if the static type of `e` is
// OBJECT.

/// This extension matches every expression whose static type is OBJECT.
extension ExpectStaticObject on Object {
  void expectStaticOBJECT() {}
}

/// This extension matches all types. It is the most specific match
/// when the receiver type is a proper subtype of `Object` and the
/// least specific match when the receiver type is OBJECT. For a
/// receiver whose static type is TOP it is the only match. In any
/// case, an invocation of `expectStaticOBJECT` as a method is a
/// compile-time error.
extension ExpectStaticObjectFail<X extends Object?> on X {
  set expectStaticOBJECT(Never _) {}
}

// Support `e.expectStaticNULL()` if the static type of `e` is NULL.

extension ExpectStaticNull on Null {
  void expectStaticNULL() {}
}
