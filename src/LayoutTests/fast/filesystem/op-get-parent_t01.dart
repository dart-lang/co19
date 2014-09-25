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
    'name': 'GetParent',
    'precondition': [
      {'fullPath':'/a', 'isDirectory':true},
      {'fullPath':'/a/b', 'isDirectory':true},
      {'fullPath':'/a/b/c'},
    ],
    'tests': [
      (helper) { helper.getParent('/'); },
      (helper) { helper.getParent('/a'); },
      (helper) { helper.getParent('/a/b'); },
      (helper) { helper.getParent('/a/b/c'); }
    ],
    'postcondition': [
      {'fullPath':'/a', 'isDirectory':true},
      {'fullPath':'/a/b', 'isDirectory':true},
      {'fullPath':'/a/b/c'},
    ],
  },
];

main() {
  addConsole();
  run(testCases);
}