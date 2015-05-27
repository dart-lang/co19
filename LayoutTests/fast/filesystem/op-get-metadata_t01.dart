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
    'name': 'GetMetadata',
    'precondition': [
      {'fullPath':'/tmp'},
      {'fullPath':'/file1', 'size':0},
      {'fullPath':'/file2', 'size':10},
      {'fullPath':'/file3', 'size':90},
    ],
    'tests': [
      (helper) { helper.getMetadata('/'); },
      (helper) { helper.getDirectory('/', '/a', {'create':true}); },
      (helper) { helper.getMetadata('/a'); },
      (helper) { helper.getMetadata('/file1'); },
      (helper) { helper.getMetadata('/file2'); },
      (helper) { helper.getMetadata('/file3'); },
      (helper) { helper.getFile('/', '/b', {'create':true}); },
      (helper) { helper.getMetadata('/b'); },
      (helper) { helper.remove('/tmp'); },
      (helper) { helper.getMetadata('/tmp', 'NotFoundError'); },
      (helper) { helper.dateIsGreaterThanOrEqualTo('/a.returned.modificationTime', '/.returned.modificationTime'); },
      (helper) { helper.dateIsGreaterThanOrEqualTo('/b.returned.modificationTime', '/.returned.modificationTime'); },
      (helper) { helper.dateIsGreaterThanOrEqualTo('/b.returned.modificationTime', '/a.returned.modificationTime'); }
    ],
    'postcondition': [ ],
  },
];

main() {
  addConsole();
  run(testCases);
}

