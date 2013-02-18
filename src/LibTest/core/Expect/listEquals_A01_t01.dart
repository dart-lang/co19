/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion static void listEquals(List expected, List actual, [String reason = null])
 * Checks that all elements in [expected] and [actual] are equal [:==:].
 * @description Checks that no exception is thrown when the compared lists have equal contents,
 *              regardless of reason (the last argument).
 * @author rodionov
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";

main() {
  var foo = new Object();
  Expect.listEquals([null, 0, 235892385, true, foo, "abracadabra"], 
                    [null, 0, 235892385, true, foo, "abracadabra"]);
  Expect.listEquals([null, 0, 235892385, true, foo, "abracadabra"], 
                    [null, 0, 235892385, true, foo, "abracadabra"], "");
  Expect.listEquals([null, 0, 235892385, true, foo, "abracadabra"], 
                    [null, 0, 235892385, true, foo, "abracadabra"], "not empty");
}
