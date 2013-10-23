/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Future done
 * The done Future completes with the same values as close, except for the
 * following case:
 * The synchronous methods of EventSink were called, resulting in an error.
 * If there is no active future (like from an addStream call), the done future
 * will complete with that error
 * @description Checks that if synchronous methods of EventSink were called,
 * resulting in an error, the done will complete with that error.
 * @author ilya
 * @needsreview seems impossible to check using Controller's sink
 */

//import "dart:async";
//import "../../../Utils/async_utils.dart";
//import "../../../Utils/expect.dart";

main() {
}
