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
    'name': 'RestrictedNames',
    'precondition': [
      {'fullPath':'/a', 'isDirectory':true},
      {'fullPath':'/b', 'isDirectory':true},
      {'fullPath':'/c', 'isDirectory':true}
    ],
    'tests': [
      (helper) { helper.getFile('/', '.', {'create':true}, 'SecurityError'); },
      (helper) { helper.getFile('/', '..', {'create':true}, 'SecurityError'); },
      (helper) { helper.getFile('/', 'con', {'create':true}); },
      (helper) { helper.getFile('/', 'CON', {'create':true}); },
      (helper) { helper.getFile('/', 'Con', {'create':true}); },
      (helper) { helper.getFile('/', 'cOn.txt', {'create':true}); },
      (helper) { helper.getFile('/', 'a/coN', {'create':true}); },

      (helper) { helper.getFile('/', 'prn', {'create':true}); },
      (helper) { helper.getFile('/', 'PRN', {'create':true}); },
      (helper) { helper.getFile('/', 'Prn', {'create':true}); },
      (helper) { helper.getFile('/', 'pRn.txt', {'create':true}); },
      (helper) { helper.getFile('/', 'a/prN', {'create':true}); },

      (helper) { helper.getFile('/', 'aux', {'create':true}); },
      (helper) { helper.getFile('/', 'AUX', {'create':true}); },
      (helper) { helper.getFile('/', 'Aux', {'create':true}); },
      (helper) { helper.getFile('/', 'aUx.txt', {'create':true}); },
      (helper) { helper.getFile('/', 'a/auX', {'create':true}); },

      (helper) { helper.getFile('/', 'nul', {'create':true}); },
      (helper) { helper.getFile('/', 'NUL', {'create':true}); },
      (helper) { helper.getFile('/', 'Nul', {'create':true}); },
      (helper) { helper.getFile('/', 'nUl.txt', {'create':true}); },
      (helper) { helper.getFile('/', 'a/nuL', {'create':true}); },

      (helper) { helper.getFile('/', 'com1', {'create':true}); },
      (helper) { helper.getFile('/', 'COM2', {'create':true}); },
      (helper) { helper.getFile('/', 'Com4', {'create':true}); },
      (helper) { helper.getFile('/', 'cOM7.foo', {'create':true}); },
      (helper) { helper.getFile('/', 'a/coM9', {'create':true}); },

      (helper) { helper.getFile('/', 'lpt1', {'create':true}); },
      (helper) { helper.getFile('/', 'LPT2', {'create':true}); },
      (helper) { helper.getFile('/', 'Lpt4', {'create':true}); },
      (helper) { helper.getFile('/', 'lPT7.foo', {'create':true}); },
      (helper) { helper.getFile('/', 'a/lpT9', {'create':true}); },

      (helper) { helper.getFile('/', 'foo ', {'create':true}); },
      (helper) { helper.getFile('/', 'foo\n', {'create':true}); },
      (helper) { helper.getFile('/', 'foo.', {'create':true}); },
      (helper) { helper.copy('/a', '/', 'foo  '); },
      (helper) { helper.copy('/a', '/', 'foo\t'); },
      (helper) { helper.copy('/a', '/', 'foo..'); },
      (helper) { helper.move('/a', '/', 'foo    '); },
      (helper) { helper.move('/b', '/', 'foo\t\t'); },
      (helper) { helper.move('/c', '/', 'foo.....'); },
    ],
    'postcondition': [
      {'fullPath':'/foo    ', 'isDirectory':true},
      {'fullPath':'/foo\t\t', 'isDirectory':true},
      {'fullPath':'/foo.....', 'isDirectory':true}
    ],
  },
];

main() {
  addConsole();
  run(testCases);
}



