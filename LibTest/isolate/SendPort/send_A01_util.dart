/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */

library send_A02_utils;

var messagesList = const [
  null, false, true,
  0, 1, -1, (1<<31)-1, (1<<32)-1, (1<<32), (1<<64)-1, 1<<64, 1<<128, -(1<<128),
  -0.0, 0.0, 3.14, double.nan, double.infinity, double.maxFinite,
  double.minPositive, double.negativeInfinity,
  "", "abrakadabra", "\u1234\u4321",
//a long string
  '''
   * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
   * for details. All rights reserved. Use of this source code is governed by a
   * BSD-style license that can be found in the LICENSE file.
  '''
];

var messagesMap = const {
  "1":null, "2":false, "3":true, "4":0, "5":1, "6":-1, "7":(2<<31)-1,
  "8":(2<<32)-1, "9":(2<<32), "10":(2<<64)-1, "11":2<<64, "12":2<<128,
  "13":-(2<<128), "14":-0.0, "15":0.0, "16":3.14, "17":double.infinity,
  "18":"", "19":"abrakadabra", "20":"\u1234\u4321",
//a long string
  "21":'''
   * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
   * for details. All rights reserved. Use of this source code is governed by a
   * BSD-style license that can be found in the LICENSE file.
  ''',
  "22":double.nan, "23":double.maxFinite, "24":double.minPositive,
  "25":double.negativeInfinity
};
