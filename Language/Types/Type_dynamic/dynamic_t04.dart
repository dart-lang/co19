/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Type dynamic has properties for every possible identifier. These
 * properties all have type dynamic.
 * @description Checks that accessing properties with all sort of names on a
 * dynamic variable and assigning the results (in case of getters) to local
 * variables of various types does not produce any static type warnings.
 * @static-clean
 * @issue #27495
 * @author iefremov
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

typedef func();
typedef int func2(int x);

main() {
  dynamic x = null;
  try {
    String y = x.thebullshour;
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError {}

  try {
    int i = x.thaisofathens;
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError {}

  try {
    func f = x.razorsedge;
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError {}

  try {
    func2 f2 = x.andromeda;
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError {}

  try {
    x.thebullshour = "asfasf";
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError {}

  try {
    x.thaisofathens = 1;
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError {}

  try {
    x.razorsedge = () {};
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError {}

  try {
    x.andromeda = (int a) => (a * a);
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError {}
}
