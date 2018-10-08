/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory List.filled(int length, E fill)
 * Creates a fixed-length list of the given length where each entry contains
 * fill.
 * @description Checks that created list contains [fill] in all positions.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

void check(List<String> lst, int length, String fill) {
  Expect.equals(lst.length, length);
  for (int k = 0; k < length; k++) {
    Expect.identical(lst[k], fill);
  }
}

main() {
  int length = 100;
  String fill = "Phil";
  List<String> a = new List.filled(length, fill);
  check(a, length, fill);
}
