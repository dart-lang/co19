/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Libraries are units of privacy. A private declaration declared within a library
 * L can only be accessed by code within L. Any attempt to access a private
 * member declaration from outside L will cause a method, getter or setter lookup failure.
 * @description Checks that an attempt to access a private instance member from outside L is
 * equivalent to a method lookup failure.
 * @author vasya
 * @reviewer msyabro
 */

#import("12_Libraries_and_Scripts_A05_t01_lib.dart", prefix: "lib");

main() {
  lib.C c = new lib.C();
  try {
    c._foo();
    Expect.fail('NoSuchMethodException is expected');
  } catch(NoSuchMethodException e) {}

  try {
    c._bar;
    Expect.fail('NoSuchMethodException is expected');
  } catch(NoSuchMethodException e) {}

  lib.I i = new lib.I();
  try {
    i._bar(1);
    Expect.fail('NoSuchMethodException is expected');
  } catch(NoSuchMethodException e) {}

  try {
    i._foo = 1;
    Expect.fail('NoSuchMethodException is expected');
  } catch(NoSuchMethodException e) {}
}
