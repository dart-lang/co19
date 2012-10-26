/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If a variable declaration does not explicitly specify a type, 
 * the type of the declared variable(s) is dynamic, the unknown type (14.6). 
 * @description Checks that no static warnings are produced when trying to access various
 * non-existent members and properties of a variable. It means that the return type of the getter is dynamic.
 * @author iefremov
 * @reviewer kaigorodov
 */


main() {
  var foo;

  try {
    foo.abyr = null;
    Expect.fail("NullPointerException expected");
  } on NullPointerException catch(ok) {}

  try {
    foo.abyr(1, 2, 3);
    Expect.fail("NullPointerException expected");
  } on NullPointerException catch(ok) {}

  try {
    foo.abyrvalg = null;
    Expect.fail("NullPointerException expected");
  } on NullPointerException catch(ok) {}


  final boo = null;

  try {
    boo.abyr = null;
    Expect.fail("NullPointerException expected");
  } on NullPointerException catch(ok) {}

  try {
    boo.abyr(1, 2, 3);
    Expect.fail("NullPointerException expected");
  } on NullPointerException catch(ok) {}

  try {
    boo.abyrvalg = null;
    Expect.fail("NullPointerException expected");
  } on NullPointerException catch(ok) {}
}
