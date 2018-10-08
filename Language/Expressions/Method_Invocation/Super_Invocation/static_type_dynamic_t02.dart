/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let Sstatic be the superclass of the immediately enclosing class.
 * ...
 * If Sstatic.m does not exist, or if F is not a function type, the static
 * type of i is Dynamic; otherwise the static type of i is the declared return
 * type of F.
 * @description Checks that the static type of a super invocation is Dynamic
 * when F is not a function type (but can be assigned to it) by ensuring that
 * there're no static warnings when a result of such invocation is being
 * assigned to variables with various declared types.
 * @static-clean
 * @author rodionov
 * @reviewer iefremov
 */
import '../../../../Utils/expect.dart';

class C {
  Function obj;
  var dyn;
}

class S extends C {
  void test() {
    try {
      String foo = super.obj();
      Expect.fail("NoSuchMethodError expected.");
    } on NoSuchMethodError catch (ex) {}

    try {
      bool foo = super.dyn();
      Expect.fail("NoSuchMethodError expected.");
    } on NoSuchMethodError catch (ex) {}

    try {
      C foo = super.obj();
      Expect.fail("NoSuchMethodError expected.");
    } on NoSuchMethodError catch (ex) {}

    try {
      Object foo = super.dyn();
      Expect.fail("NoSuchMethodError expected.");
    } on NoSuchMethodError catch (ex) {}

    try {
      List foo = super.obj();
      Expect.fail("NoSuchMethodError expected.");
    } on NoSuchMethodError catch (ex) {}

    try {
      Map foo = super.dyn();
      Expect.fail("NoSuchMethodError expected.");
    } on NoSuchMethodError catch (ex) {}
  }
}

main() {
  new S().test();
}
