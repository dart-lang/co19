/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if a built-in identifier is used as
 * the declared name of a prefix, class, type parameter or type alias.
 * @description  Checks that when a built-in identifier is used in an identifier
 * reference, but since no declaration with that name can exist, lookup fails
 * eventually with the type of error depending on context. This test checks that
 * in a class instance scope, referencing a built-in identifier results in
 * a compile error
 * @author rodionov
 * @compile-error
 */
import '../../../Utils/expect.dart';

class A {
  test() {
    Expect.throws(() {abstract();}, (e) => e is NoSuchMethodError);
    Expect.throws(() {1 + as;}, (e) => e is NoSuchMethodError);
    Expect.throws(() {1 << export;}, (e) => e is NoSuchMethodError);
    Expect.throws(() {external ^ 0;}, (e) => e is NoSuchMethodError);
    Expect.throws(() {1 * factory;}, (e) => e is NoSuchMethodError);
    Expect.throws(() {1 >= get;}, (e) => e is NoSuchMethodError);
    Expect.throws(() {var x = implements;}, (e) => e is NoSuchMethodError);
    Expect.throws(() {1 == import;}, (e) => e is NoSuchMethodError);
    Expect.throws(() {1 == library;}, (e) => e is NoSuchMethodError);
    Expect.throws(() {operator.x;}, (e) => e is NoSuchMethodError);
    Expect.throws(() {1 == part;}, (e) => e is NoSuchMethodError);
    Expect.throws(() {--set;}, (e) => e is NoSuchMethodError);
    Expect.throws(() {true && static;}, (e) => e is NoSuchMethodError);
    Expect.throws(() {++typedef;}, (e) => e is NoSuchMethodError);
  }
}

main() {
  new A().test();
}
