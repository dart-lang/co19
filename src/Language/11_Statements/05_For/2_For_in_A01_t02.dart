/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A for statement of the form for (finalConstVarOrType? id in e) s is equivalent to
 * the the following code:
 * var n0 = e.iterator(); while (n0.hasNext()) { finalConstVarOrType? id = n0.next();
 * s } where n0 is an identifier that does not occur anywhere in the program.
 * @description Checks that a [NoSuchMethodError] is thrown if the type of e
 * does not implement [Iterable].
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 * @issue 5675
 */

class A {}

void check(var e) {
  try {
    for (var id in e);
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch(ok) {}   

  try {
    for (final id in e);
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch(ok) {}   

  try {
    for (const id in e);
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch(ok) {}   

  try {
    for (Dynamic id in e);
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch(ok) {}   

  try {
    var id;
    for (id in e);
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch(ok) {}   
}

main() {
  check(1234567);
  check("string");
  check(true);
  check(new A());
}
