// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion At this location about an asynchronous non-generator function with
/// future value type $T_v$, the text is changed as follows:
///
///  It is a compile-time error if $s$ is \code{\RETURN{};},
///  unless $T_v$
///  is \VOID, \DYNAMIC, or \code{Null}.
///  %
///  It is a compile-time error if $s$ is \code{\RETURN{} $e$;},
///  $T_v$ is \VOID,
///  and \flatten{S} is neither \VOID, \DYNAMIC, \code{Null}.
///  %
///  It is a compile-time error if $s$ is \code{\RETURN{} $e$;},
///  $T_v$ is neither \VOID{} nor \DYNAMIC,
///  and \flatten{S} is \VOID.
///  %
///  It is a compile-time error if $s$ is \code{\RETURN{} $e$;},
///  \flatten{S} is not \VOID,
///  $S$ is not assignable to $T_v$,
///  and flatten{S} is not a subtype of $T_v$.
///  Comparing to Dart before null-safety, this means that it is no longer
///  allowed to return an expression whose flattened static type is void in an
///  async function with future value type Null; nor is it allowed, in an async
///  function with future value type void, to return an expression whose
///  flattened static type is not void, void*, dynamic, or Null. Conversely, it
///  is allowed to return a future when the future value type is a suitable
///  future; for instance, we can have return Future<int>.value(42) in an async
///  function with declared return type Future<Future<int>>. Finally, let S be
///  Future<dynamic> or FutureOr<dynamic>; it is then no longer allowed to return
///  an expression with static type S, unless the future value type is a
///  supertype of S. This differs from Dart before null-safety in that it was
///  allowed to return an expression of these types with a declared return type
///  of the form Future<T> for any T.
///
/// @description Check that it is a compile-time error in an async function with
/// future value type void, to return an expression whose flattened static type
/// is not void, void*, dynamic, or Null
/// @author sgrekhov@unipro.ru

class C {}

Future<void> foo1() async {
  return 42;
//       ^^
// [analyzer] unspecified
// [cfe] unspecified
}

Future<void> foo2() async {
  return new C();
//       ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

Future<void> foo3() async {
  Object? o = new Object();
  return o;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  foo1();
  foo2();
  foo3();
}
