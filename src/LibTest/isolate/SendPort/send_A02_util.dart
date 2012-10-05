/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */

#library("send_A02_utils");
import "dart:isolate";

deepListEquals(var expected, var actual) {
  if((expected is! List) || (actual is! List)) {
    Expect.equals(expected, actual);
    return;
  }

  if(expected.length != actual.length) {
    Expect.fail("Lists are not equal: expected length ${expected.length}, actual length ${actual.length}");
  }
  for(int i = 0; i != expected.length; i++) {
    if(expected[i] is Map) {
      deepMapEquals(expected[i], actual[i]);
    } else {
      deepListEquals(expected[i], actual[i]);
    }
  }
}

deepMapEquals(var expected, var actual) {
  if((expected is! Map) || (actual is! Map)) {
    Expect.equals(expected, actual);
    return;
  }
  if(expected.length != actual.length) {
    Expect.fail("Maps are not equal: expected length ${expected.length}, actual length ${actual.length}");
  }
  for(var key in expected.getKeys()) {
    if(expected[key] is Map) {
      deepMapEquals(expected[key], actual[key]);
    } else {
      deepListEquals(expected[key], actual[key]);
    }
  }
}

var messagesList = const [
  null, false, true, 0, 1, -1, (1<<31)-1, (1<<32)-1, (1<<32), (1<<64)-1, 1<<64, 1<<128, -(1<<128),
  -0.0, 0.0, 3.14, /*double.NAN, */double.INFINITY, "", "abrakadabra", "\u1234\u4321",
//a long string
  '''
   * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
   * for details. All rights reserved. Use of this source code is governed by a
   * BSD-style license that can be found in the LICENSE file.
  ''',
];

var messagesMap = const {
  "1":null, "2":false, "3":true, "4":0, "5":1, "6":-1, "7":(2<<31)-1, "8":(2<<32)-1, "9":(2<<32), "10":(2<<64)-1, "11":2<<64, "12":2<<128, "13":-(2<<128),
  "14":-0.0, "15":0.0, "16":3.14, "17":double.INFINITY, "18":"", "19":"abrakadabra", "20":"\u1234\u4321",
//a long string
  "21":'''
   * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
   * for details. All rights reserved. Use of this source code is governed by a
   * BSD-style license that can be found in the LICENSE file.
  ''',
};
