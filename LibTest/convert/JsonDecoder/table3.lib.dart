/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
  * List of incorrect Json text samples
  */

List<String> table = [
  '',
  'a',
  '-',
  ':',
  '[',
  '{',
  '[1,2,3:33]',
  '{"a":a, "b"}',
  '{"a":, "b":b}',
  '{"a"a, "b":b}',
  '{"a":a "b":b}',
  '[1,2,{3:33}]',
  '[1,2,3}',
  '{1,2,3]',
  '{"a":[], []:b}',
  '{"a":[], 1:b}',
  '{"a":[], {}:b}',
];
