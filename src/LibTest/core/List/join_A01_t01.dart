/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String join([String separator = ""])
 * Converts each element to a String and concatenates the strings.
 * Converts each element to a String by calling Object.toString on it.
 * Then concatenates the strings, optionally separated by the separator string.
 * @description Checks that the method's result equals to the specified result.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

String join(List a, [String separator = ""]) {
  StringBuffer sb=new StringBuffer();
  bool first=true;
  for (var element in a) {
    if (first) {
      first=false;
    } else {
      sb.write(separator);
    }
    sb.write(element);
  }
  return sb.toString();
}

void check(List a, [String separator = ""]) {
  Expect.equals(a.join(separator), join(a, separator));
}

main() {
  check([]);
  check([], ", ");
  List a0=["1","3",4,null,6];
  check(a0);
  check(a0, ":");
  List a1=new List.from(a0);
  a1.addAll(a0);
  check(a0);
  check(a0, ", ");
}
