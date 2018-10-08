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
    'name': 'CopyFileSimple',
    'precondition': [
      {'fullPath':'/a', 'isDirectory':true},
      {'fullPath':'/a/b'}
    ],
    'tests': [
      (helper) { helper.copy('/a/b', '/a', 'c'); }
    ],
    'postcondition': [
      {'fullPath':'/a', 'isDirectory':true},
      {'fullPath':'/a/b'},
      {'fullPath':'/a/c'}
    ],
  },
  {
    'name': 'CopyDirectorySimple',
    'precondition': [
      {'fullPath':'/a', 'isDirectory':true},
      {'fullPath':'/a/b', 'isDirectory':true}
    ],
    'tests': [
      (helper) { helper.copy('/a/b', '/a', 'c'); },
    ],
    'postcondition': [
      {'fullPath':'/a', 'isDirectory':true},
      {'fullPath':'/a/b', 'isDirectory':true},
      {'fullPath':'/a/c', 'isDirectory':true}
    ],
  },
  {
    'name': 'CopyFileToDifferentDirectory',
    'precondition': [
      {'fullPath':'/a', 'isDirectory':true},
      {'fullPath':'/a/b'},
      {'fullPath':'/c', 'isDirectory':true}
    ],
    'tests': [
      (helper) { helper.copy('/a/b', '/c', 'd'); },
    ],
    'postcondition': [
      {'fullPath':'/a', 'isDirectory':true},
      {'fullPath':'/a/b'},
      {'fullPath':'/c/d'}
    ],
  },
  /*{
    'name': 'CopyFileWithEmptyName',
    'precondition': [
    {'fullPath':'/a', 'isDirectory':true},
    {'fullPath':'/a/b'},
    {'fullPath':'/c', 'isDirectory':true},
    ],
    'tests': [
    (helper) { helper.copy('/a/b', '/c', null); },
    ],
    'postcondition': [
    {'fullPath':'/a', 'isDirectory':true},
    {'fullPath':'/a/b'},
    {'fullPath':'/c/b'}
    ],
    },
    {
    'name': 'CopyFileWithEmptyNameToSameDirectory',
    'precondition': [
    {'fullPath':'/a', 'isDirectory':true},
    {'fullPath':'/a/b'},
    ],
    'tests': [
    (helper) { helper.copy('/a/b', '/a', null, 'InvalidModificationError'); },
    ],
    'postcondition': [
    {'fullPath':'/a', 'isDirectory':true},
    {'fullPath':'/a/b'},
    ],
    },*/
  {
    'name': 'CopyFileWithSameName',
    'precondition': [
      {'fullPath':'/a', 'isDirectory':true},
      {'fullPath':'/a/b'},
    ],
    'tests': [
      (helper) { helper.copy('/a/b', '/a', 'b', 'InvalidModificationError'); },
    ],
    'postcondition': [
      {'fullPath':'/a', 'isDirectory':true},
      {'fullPath':'/a/b'},
    ],
  },
  {
    'name': 'CopyForNonExistentEntry',
    'precondition': [
      {'fullPath':'/a', 'isDirectory':true},
      {'fullPath':'/a/b'},
      {'fullPath':'/c', 'isDirectory':true},
    ],
    'tests': [
      (helper) { helper.remove('/a/b'); },
      (helper) { helper.copy('/a/b', '/c', 'b', 'NotFoundError'); },
    ],
    'postcondition': [
      {'fullPath':'/a', 'isDirectory':true},
      {'fullPath':'/c', 'isDirectory':true},
    ],
  },
  {
    'name': 'CopyEntryToNonExistentDirectory',
    'precondition': [
      {'fullPath':'/a', 'isDirectory':true},
      {'fullPath':'/a/b'},
      {'fullPath':'/c', 'isDirectory':true},
    ],
    'tests': [
      (helper) { helper.remove('/c'); },
      (helper) { helper.copy('/a/b', '/c', 'b', 'NotFoundError'); },
    ],
    'postcondition': [
      {'fullPath':'/a', 'isDirectory':true},
      {'fullPath':'/a/b'},
    ],
  },
  {
    'name': 'CopyEntryToItsChild',
    'precondition': [
      {'fullPath':'/a', 'isDirectory':true},
      {'fullPath':'/a/b', 'isDirectory':true},
      {'fullPath':'/a/b/c', 'isDirectory':true},
    ],
    'tests': [
      (helper) { helper.copy('/a', '/a/b', 'd', 'InvalidModificationError'); },
      (helper) { helper.copy('/a/b', '/a/b/c', 'd', 'InvalidModificationError'); },
    ],
    'postcondition': [
      {'fullPath':'/a', 'isDirectory':true},
      {'fullPath':'/a/b', 'isDirectory':true},
      {'fullPath':'/a/b/c', 'isDirectory':true},
    ],
  },
  {
    'name': 'CopyRecursive',
    'precondition': [
      {'fullPath':'/a', 'isDirectory':true},
      {'fullPath':'/a/b', 'isDirectory':true},
      {'fullPath':'/a/b/c'},
      {'fullPath':'/a/b/d'},
      {'fullPath':'/b', 'isDirectory':true},
    ],
    'tests': [
      (helper) { helper.copy('/a', '/b', 'a'); },
    ],
    'postcondition': [
      {'fullPath':'/a', 'isDirectory':true},
      {'fullPath':'/a/b', 'isDirectory':true},
      {'fullPath':'/a/b/c'},
      {'fullPath':'/a/b/d'},
      {'fullPath':'/b/a', 'isDirectory':true},
      {'fullPath':'/b/a/b', 'isDirectory':true},
      {'fullPath':'/b/a/b/c'},
      {'fullPath':'/b/a/b/d'},
    ],
  },
  {
    'name': "OverwritingCopyFileToFile",
    'precondition': [
      {'fullPath':"/a"},
      {'fullPath':"/b"},
    ],
    'tests': [
      (helper) {helper.copy("/a","/","b");}
    ],
    'postcondition': [
      {'fullPath':"/a"},
      {'fullPath':"/b"},
    ],
  },
  {
    'name': "OverwritingCopyDirectoryToEmptyDirectory",
    'precondition': [
      {'fullPath':"/a", 'isDirectory':true},
      {'fullPath':"/a/b"},
      {'fullPath':"/c", 'isDirectory':true},
    ],
    'tests': [
      (helper) {helper.copy("/a","/","c");}
    ],
    'postcondition': [
      {'fullPath':"/a", 'isDirectory':true},
      {'fullPath':"/a/b"},
      {'fullPath':"/c", 'isDirectory':true},
      {'fullPath':"/c/b"},
    ],
  },
  {
    'name': "OverwritingCopyFileToDirectory",
    'precondition': [
      {'fullPath':"/a"},
      {'fullPath':"/b", 'isDirectory': true},
    ],
    'tests': [
      (helper) {helper.copy("/a","/","b",'InvalidModificationError');}
    ],
    'postcondition': [
      {'fullPath':"/a"},
      {'fullPath':"/b", 'isDirectory': true},
    ],
  },
  {
    'name': "OverwritingCopyDirectoryToFile",
    'precondition': [
      {'fullPath':"/a", 'isDirectory': true},
      {'fullPath':"/b"},
    ],
    'tests': [
      (helper) {helper.copy("/a","/","b",'InvalidModificationError');}
    ],
    'postcondition': [
      {'fullPath':"/a", 'isDirectory': true},
      {'fullPath':"/b"},
    ],
  },
  {
    'name': "OverwritingCopyFileToNonemptyDirectory",
    'precondition': [
      {'fullPath':"/a"},
      {'fullPath':"/b", 'isDirectory': true},
      {'fullPath':"/b/c"},
    ],
    'tests': [
      (helper) {helper.copy("/a","/","b",'InvalidModificationError');}
    ],
    'postcondition': [
      {'fullPath':"/a"},
      {'fullPath':"/b", 'isDirectory': true},
      {'fullPath':"/b/c"},
    ],
  },
  {
    'name': "OverwritingCopyDirectoryToNonemptyDirectory",
    'precondition': [
      {'fullPath':"/a", 'isDirectory': true},
      {'fullPath':"/a/b"},
      {'fullPath':"/c", 'isDirectory': true},
      {'fullPath':"/c/d"},
    ],
    'tests': [
      (helper) {helper.copy("/a","/","c",'InvalidModificationError');}
    ],
    'postcondition': [
      {'fullPath':"/a", 'isDirectory': true},
      {'fullPath':"/a/b"},
      {'fullPath':"/c", 'isDirectory': true},
      {'fullPath':"/c/d"},
    ],
  },
];

main() {
  addConsole();
  run(testCases);
}
