// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We allow TypeName.new and TypeName<typeArgs>.new everywhere we
/// allow a reference to a named constructor. It instead refers to the unnamed
/// constructor. We allow tear-offs of the unnamed constructor by using .new and
/// then treating it as a named constructor tear-off. Examples:
///
/// class C<T> {
///   final T x;
///   const C.new(this.x); // Same as: `const C(this.x);`
///   C.other(T x) : this.new(x); // Same as: `: this(x)`
///   factory C.d(T x) = D<T>.new;  // same as: `= D<T>;`
/// }
/// class D<T> extends C<T> {
///   const D(T x) : super.new(x); // Same as: `: super(x);`
/// }
/// void main() {
///   const C.new(0); // Same as: `const C(0);`. (Inferred `T` = `int`.)
///   const C<num>.new(0); // Same as: `const C<num>(0);`.
///   new C.new(0); // Same as `new C(0);`.
///   new C<num>.new(0); // Same as `new C<num>(0);`.
///   C.new(0); // Same as `C(0);`.
///   C<num>.new(0); // Same as `C<num>(0);`.
///   var f1 = C.new; // New tear-off, not expressible without `.new`.
///   var f2 = C<num>.new; // New tear-off, not expressible without `.new`.
/// }
///
/// @description Checks an example from the specification
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs

import "../../Utils/expect.dart";

class C<T> {
  final T x;
  const C(this.x); // Same as: `const C(this.x);`
  C.other(T x) : this.new(x); // Same as: `: this(x)`
  factory C.d(T x) = D<T>.new;  // same as: `= D<T>;`
}

class D<T> extends C<T> {
  const D(T x) : super.new(x); // Same as: `: super(x);`
}

void main() {
  const c1 = const C.new(42); // Same as: `const C(42);`. (Inferred `T` = `int`.)
  Expect.equals(42, c1.x);
  Expect.isFalse(c1.x is String); // to check that x is not dynamic
  Expect.runtimeIsNotType<String>(c1.x);

  const c2 = const C<num>(0); // Same as: `const C<num>(0);`.
  Expect.equals(0, c2.x);
  Expect.isTrue(c2.x is num);
  Expect.isFalse(c2.x is String); // to check that x is not dynamic
  Expect.runtimeIsType<num>(c2.x);
  Expect.runtimeIsNotType<String>(c2.x);

  var c3 = new C.new(0); // Same as `new C(0);`.
  Expect.equals(0, c3.x);
  Expect.isFalse(c3.x is String); // to check that x is not dynamic
  Expect.runtimeIsNotType<String>(c3.x);

  var c4 = new C<num>.new(0); // Same as `new C<num>(0);`.
  Expect.equals(0, c4.x);
  Expect.isFalse(c4.x is String); // to check that x is not dynamic
  Expect.runtimeIsNotType<String>(c4.x);

  var c5 = C.new(0); // Same as `C(0);`.
  Expect.equals(0, c5.x);
  Expect.isFalse(c5.x is String); // to check that x is not dynamic
  Expect.runtimeIsNotType<String>(c5.x);

  var c6 = C<num>.new(0); // Same as `C<num>(0);`.
  Expect.equals(0, c6.x);
  Expect.isFalse(c6.x is String); // to check that x is not dynamic
  Expect.runtimeIsNotType<String>(c6.x);

  var f1 = C.new; // New tear-off, not expressible without `.new`.
  var c7 = f1(42);
  Expect.equals(42, c7.x);
  Expect.isFalse(c7.x is String); // to check that x is not dynamic
  Expect.runtimeIsNotType<String>(c7.x);

  var c8 = f1<num>(3.14);
  Expect.equals(3.14, c8.x);
  Expect.isFalse(c8.x is String); // to check that x is not dynamic
  Expect.runtimeIsNotType<String>(c8.x);

  var f2 = C<num>.new; // New tear-off, not expressible without `.new`.
  var c9 = f2(3.14);
  Expect.equals(3.14, c9.x);
  Expect.isFalse(c9.x is String); // to check that x is not dynamic
  Expect.runtimeIsNotType<String>(c9.x);

  var c10 = C.other(42);
  Expect.equals(42, c10.x);
  Expect.isFalse(c10.x is String); // to check that x is not dynamic
  Expect.runtimeIsNotType<String>(c10.x);

  var c11 = C.d(42);
  Expect.equals(42, c11.x);
  Expect.isFalse(c11.x is String); // to check that x is not dynamic
  Expect.isTrue(c11 is D);
  Expect.runtimeIsNotType<String>(c11.x);
  Expect.runtimeIsType<D>(c11);
}
