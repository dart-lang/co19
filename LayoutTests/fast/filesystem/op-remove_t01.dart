/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "../../testcommon.dart";
import "resources/op-tests-helper.dart";

var testCases = [
  {
    'name': 'RemoveSimple',
    'precondition': [
      {'fullPath':'/a', 'isDirectory':true},
      {'fullPath':'/b'}
    ],
    'tests': [
      (helper) { helper.remove('/a'); },
      (helper) { helper.remove('/b'); },
      (helper) { helper.remove('/', 'InvalidModificationError'); }
    ],
    'postcondition': [
      {'fullPath':'/a', 'nonexistent':true},
      {'fullPath':'/b', 'nonexistent':true}
    ],
  },
  {
    'name': 'RemoveNonRecursiveWithChildren',
    'precondition': [
      {'fullPath':'/a', 'isDirectory':true},
      {'fullPath':'/a/b', 'isDirectory':true},
      {'fullPath':'/a/c',}
    ],
    'tests': [
      (helper) { helper.remove('/a', 'InvalidModificationError'); }
    ],
    'postcondition': [
      {'fullPath':'/a', 'isDirectory':true},
      {'fullPath':'/a/b', 'isDirectory':true},
      {'fullPath':'/a/c',}
    ],
  },
  {
    'name': 'RemoveRecursiveWithoutChildren',
    'precondition': [
      {'fullPath':'/a', 'isDirectory':true},
    ],
    'tests': [
      (helper) { helper.removeRecursively('/a'); }
    ],
    'postcondition': [
      {'fullPath':'/a', 'nonexistent':true},
    ],
  },
  {
    'name': 'RemoveRecursiveWithChildren',
    'precondition': [
      {'fullPath':'/a', 'isDirectory':true},
      {'fullPath':'/a/b', 'isDirectory':true},
      {'fullPath':'/a/c',}
    ],
    'tests': [
      (helper) { helper.removeRecursively('/a'); },
      (helper) { helper.removeRecursively('/', 'InvalidModificationError'); }
    ],
    'postcondition': [
      {'fullPath':'/a', 'nonexistent':true},
    ],
  },
];


main() {
  addConsole();
  run(testCases);
}

