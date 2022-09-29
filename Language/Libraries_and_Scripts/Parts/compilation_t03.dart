// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion Compiling a part directive of the form part s; causes the Dart
/// system to attempt to compile the contents of the URI that is the value of s.
/// The top-level declarations at that URI are then compiled by the Dart compiler
/// in the scope of the current library. It is a compile-time error if the
/// contents of the URI are not a valid part declaration.
/// @description Checks that the top level declarations at URI are compiled in
/// the scope of the current library (including private declarations).
/// @Issue 42393
/// @author rodionov

library Parts_test_lib;
import "../../../Utils/expect.dart";
part "part_2.dart";

main() {
  //functions
  Expect.equals(null, foo());

  Expect.equals(3, bar(1,2));
  Expect.equals(13, bar(7,6));
  Expect.equals(33, bar(11,22));

  Expect.listEquals([], list(0, null));
  Expect.listEquals(new List.filled(101, null), list(101));
  Expect.listEquals(new List.filled(1000, null), list(1000));

  Expect.equals(0, _privateFunc());

  //function alias
  func<bool, String> ff = (bool bParam, [String sParam]) {};

  // get/set
  value = 1;
  Expect.equals(1, value);
  value = false;
  Expect.equals(false, value);
  value = "foo";
  Expect.equals("foo", value);
  value = foo();
  Expect.equals(null, value);
  value = [1, 2, 3, 4];
  Expect.listEquals([1, 2, 3, 4], value);

  // variables
  Expect.equals(-100, i);
  Expect.equals(false, b);
  Expect.equals("string", s);

  // See Issue #42393 evaluation:
  // const [0, 1, 2, 3] with no context type infers a type of
  // const <int>[0, 1, 2, 3]. Since the two objects differ on the type argument,
  // they cannot be the same object and are not canonicalized.
  Expect.notEquals(const [0, 1, 2, 3], l);
  Expect.notEquals(const {'a': 1, 'b': 2}, m);
  Expect.equals(const <dynamic>[0, 1, 2, 3], l);
  Expect.equals(const <dynamic, dynamic>{'a': 1, 'b': 2}, m);

  Expect.equals("One" "Two", e);
  Expect.equals('private', _private);

  // class
  A a = new A();
  Expect.equals("A.FOO", A.FOO);
  Expect.equals("a.foo()", a.foo());
  Expect.equals("a.bar", a.bar);
  a.value = "a.value";
  Expect.equals("a.value", a.value);
}
