/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
  * List of correct Json text samples
  */

List<List<Object>> table = [
  [1234, "1234"],
  [3.1415926, "3.1415926"],
  ["String", '"String"'],
  [true, "true"],
  [false, "false"],
  [null, "null"],
  [new List(), "[]"],
  [[], "[]"],
  [[1], "[1]"],
  [
    [1.0, "str", null, [], {}],
    '[1.0,"str",null,[],{}]'
  ],
  [new Map(), "{}"],
  [{}, "{}"],
  [
    {"str": "str", "emptyList": [], "emptyMap": {}, "null": null},
    '{"str":"str","emptyList":[],"emptyMap":{},"null":null}'
  ],
];
