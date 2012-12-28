/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Fails gracefully when given an argument of a wrong type and it's not compatible enough
 * (a double for millisecondsSinceEpoch might work in production mode depending on the implementation).
 * @description Checks that the method doesn't crash.
 * @author iefremov
 * @reviewer rodionov
 */
main() {
  try {
    new Date.fromMillisecondsSinceEpoch(3.14, isUtc: true); /// static type warning not assignable
  } catch (anything) {}
  
  try {
    new Date.fromMillisecondsSinceEpoch("", isUtc: true); /// static type warning not assignable
  } catch (anything) {}
  
  try {
    new Date.fromMillisecondsSinceEpoch(1, isUtc: 3.14); /// static type warning not assignable
  } catch (anything) {}

  try {
    new Date.fromMillisecondsSinceEpoch(1, isUtc: ""); /// static type warning not assignable
  } catch (anything) {}
}
