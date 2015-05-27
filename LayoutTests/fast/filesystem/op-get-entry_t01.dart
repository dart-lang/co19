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
    'name': 'CreateSimple',
    'precondition': [ ],
    'tests': [
      (helper) { helper.getDirectory('/', 'a', {'create':true}); },
      (helper) { helper.getFile('/', 'b', {'create':true}); }
    ],
    'postcondition': [
      {'fullPath':'/a', 'isDirectory':true},
      {'fullPath':'/b'},
    ],
  },
  {
    'name': 'CreateNested',
    'precondition': [ ],
    'tests': [
      (helper) { helper.getDirectory('/', 'a', {'create':true}); },
      (helper) { helper.getDirectory('/a', 'b', {'create':true}); },
      (helper) { helper.getDirectory('/a/b', 'c', {'create':true}); },
      (helper) { helper.getDirectory('/a/b/c', 'd', {'create':true}); },
      (helper) { helper.getFile('/a/b/c/d', 'e', {'create':true}); },
    ],
    'postcondition': [
      {'fullPath':'/a/b/c/d/e'},
    ],
  },
  {
    'name': 'CreateNestedWithAbsolutePath',
    'precondition': [
      {'fullPath':'/dummy', 'isDirectory':true},
    ],
    'tests': [
      (helper) { helper.getDirectory('/dummy', '/a', {'create':true}); },
      (helper) { helper.getDirectory('/dummy', '/a/b', {'create':true}); },
      (helper) { helper.getDirectory('/dummy', '/a/b/c', {'create':true}); },
      (helper) { helper.getDirectory('/dummy', '/a/b/c/d', {'create':true}); },
      (helper) { helper.getFile('/dummy', '/a/b/c/d/e', {'create':true}); }
    ],
    'postcondition': [
      {'fullPath':'/dummy', 'isDirectory':true},
      {'fullPath':'/a/b/c/d/e'},
    ],
  },
  {
    'name': 'CreateNestedWithRelativePath',
    'precondition': [
      {'fullPath':'/a', 'isDirectory':true},
    ],
    'tests': [
      (helper) { helper.getDirectory('/a', './b', {'create':true}); },
      (helper) { helper.getDirectory('/a', '../b', {'create':true}); },
      (helper) { helper.getDirectory('/a', '../../b/c', {'create':true}); },
      (helper) { helper.getDirectory('/a', '/a/../../d', {'create':true}); },
      (helper) { helper.getDirectory('/a', '/a/../../b/./c/../../../../../e', {'create':true}); },
      (helper) { helper.getDirectory('/a', '/a/../.../g', {'create':true}, 'EncodingError'); },
      (helper) { helper.getFile('/a', './b.txt', {'create':true}); },
      (helper) { helper.getFile('/a', '../b.txt', {'create':true}); },
      (helper) { helper.getFile('/a', '../../b/c.txt', {'create':true}); },
      (helper) { helper.getFile('/a', '/a/../../d.txt', {'create':true}); },
      (helper) { helper.getFile('/a', '/a/../../b/./c/../../../../../e.txt', {'create':true}); },
      (helper) { helper.getFile('/a', '/a/../.../g.txt', {'create':true}, 'EncodingError'); },
    ],
    'postcondition': [
      {'fullPath':'/a', 'isDirectory':true},
      {'fullPath':'/a/b', 'isDirectory':true},
      {'fullPath':'/b', 'isDirectory':true},
      {'fullPath':'/b/c', 'isDirectory':true},
      {'fullPath':'/d', 'isDirectory':true},
      {'fullPath':'/e', 'isDirectory':true},
      {'fullPath':'/f', 'nonexistent':true},
      {'fullPath':'/a/f', 'nonexistent':true},
      {'fullPath':'/g', 'nonexistent':true},
      {'fullPath':'/a/g', 'nonexistent':true},
      {'fullPath':'/a/b.txt'},
      {'fullPath':'/b.txt'},
      {'fullPath':'/b/c.txt'},
      {'fullPath':'/d.txt'},
      {'fullPath':'/e.txt'},
      {'fullPath':'/f.txt', 'nonexistent':true},
      {'fullPath':'/a/f.txt', 'nonexistent':true},
      {'fullPath':'/g.txt', 'nonexistent':true},
      {'fullPath':'/a/g.txt', 'nonexistent':true},
    ],
  },
  {
    'name': 'GetExistingEntry',
    'precondition': [ ],
    'tests': [
      (helper) { helper.getDirectory('/', 'a', {'create':true}); },
      (helper) { helper.getFile('/', 'b', {'create':true}); },
      (helper) { helper.getDirectory('/', 'a'); },
      (helper) { helper.getFile('/', 'b'); }
    ],
    'postcondition': [
      {'fullPath':'/a', 'isDirectory':true},
      {'fullPath':'/b'},
    ],
  },
  {
    'name': 'GetNonExistent',
    'precondition': [ ],
    'tests': [
      (helper) { helper.getDirectory('/', 'a', {}, 'NotFoundError'); },
      (helper) { helper.getFile('/', 'b', {}, 'NotFoundError'); },
      (helper) { helper.getDirectory('/', '/nonexistent/a', {'create':true}, 'NotFoundError'); },
      (helper) { helper.getFile('/', '/nonexistent/b', {'create':true}, 'NotFoundError'); }
    ],
    'postcondition': [ ],
  },
  {
    'name': 'GetFileForDirectory',
    'precondition': [
      {'fullPath':'/a', 'isDirectory':true}
    ],
    'tests': [
      (helper) { helper.getFile('/', 'a', {}, 'TypeMismatchError'); },
      (helper) { helper.getFile('/', '/a', {}, 'TypeMismatchError'); },
    ],
    'postcondition': [
      {'fullPath':'/a', 'isDirectory':true}
    ],
  },
  {
    'name': 'GetDirectoryForFile',
    'precondition': [
      {'fullPath':'/a'}
    ],
    'tests': [
      (helper) { helper.getDirectory('/', 'a', {}, 'TypeMismatchError'); },
      (helper) { helper.getDirectory('/', '/a', {}, 'TypeMismatchError'); },
    ],
    'postcondition': [
      {'fullPath':'/a'}
    ],
  },
  {
    'name': 'CreateWithExclusive',
    'precondition': [
      {'fullPath':'/a', 'isDirectory':true},
      {'fullPath':'/b'}
    ],
    'tests': [
      (helper) { helper.getDirectory('/', 'a', {'create':true, 'exclusive':true}, 'InvalidModificationError'); },
      (helper) { helper.getFile('/', 'b', {'create':true, 'exclusive':true}, 'InvalidModificationError'); }
    ],
    'postcondition': [
      {'fullPath':'/a', 'isDirectory':true},
      {'fullPath':'/b'}
    ],
  },
];

main() {
  addConsole();
  run(testCases);
}
