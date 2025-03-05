// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion - Method invocation: If `N` is an expression of the form
/// `E1.m1(E2)`, then:
/// - Let `before(E1) = before(N)`
/// - Let `before(E2) = after(E1)`
/// - Let `T` be the static return type of the invocation
/// - If `T <: Never` then:
///   - Let `after(N) = unreachable(after(E2))`.
/// - Otherwise:
///   - Let `after(N) = after(E2)`.
///
/// @description Checks that if the static type of the expression of the form
/// `E1..m1(E2)` is `Never` then `E2` is still reachable.
/// @author sgrekhov22@gmail.com

class C<T extends Never> {
  T foo(int x) => throw "foo";
  T bar([int x = 0]) => throw "bar";
  T baz({int x = 0}) => throw "baz";
  T qux({required int x}) => throw "qux";
}

void test1() {
  late int i;
  try {
    C()..foo(i = 42);
  } catch (_) {}
  i; // Not definitely unassigned
}

void test2() {
  late int i;
  try {
    C()..bar(i = 42);
  } catch (_) {}
  i;
}

void test3() {
  late int i;
  try {
    C()..baz(x: i = 42);
  } catch (_) {}
  i;
}

void test4() {
  late int i;
  try {
    C()..qux(x: i = 42);
  } catch (_) {}
  i;
}

main() {
  test1();
  test2();
  test3();
  test4();
}
