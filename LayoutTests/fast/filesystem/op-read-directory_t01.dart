/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "resources/op-tests-helper.dart";

var testCases = [
  {
    'name': 'ReadDirectory',
    'precondition': [
      {'fullPath':'/a', 'isDirectory':true},
      {'fullPath':'/b', 'isDirectory':true},
      {'fullPath':'/c', },
      {'fullPath':'/d', },
      {'fullPath':'/e', 'isDirectory':true},
      {'fullPath':'/f', },
      {'fullPath':'/g', 'isDirectory':true},
      {'fullPath':'/a/b'},
      {'fullPath':'/a/c'},
    ],
    'tests': [
      (helper) { helper.readDirectory('/'); },
      (helper) { helper.remove('/c'); },
      (helper) { helper.remove('/e'); },
      (helper) { helper.remove('/f'); },
      (helper) { helper.readDirectory('/'); }
    ],
  },
];

main() {
  addConsole();
  run(testCases);
}
