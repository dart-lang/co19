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
    'name': 'RestrictedUnicodeChars',
    'precondition': [ ],
    'tests': [
      (helper) { helper.getFile('/', 'ab', {'create':true}); },

      // Embedded NULs aren't allowed; anything else in the first 32 is fair game.
      (helper) { helper.getFile('/', 'a\u0000b', {'create':true}, 'InvalidModificationError'); },
      (helper) { helper.getFile('/', 'a\u0001b', {'create':true}); },
      (helper) { helper.getFile('/', 'a\u0002b', {'create':true}); },
      (helper) { helper.getFile('/', 'a\u0003b', {'create':true}); },
      (helper) { helper.getFile('/', 'a\u0004b', {'create':true}); },
      (helper) { helper.getFile('/', 'a\u0005b', {'create':true}); },
      (helper) { helper.getFile('/', 'a\u0006b', {'create':true}); },
      (helper) { helper.getFile('/', 'a\u0007b', {'create':true}); },
      (helper) { helper.getFile('/', 'a\u0008b', {'create':true}); },
      (helper) { helper.getFile('/', 'a\u0009b', {'create':true}); },
      (helper) { helper.getFile('/', 'a\u000ab', {'create':true}); },
      (helper) { helper.getFile('/', 'a\u000bb', {'create':true}); },
      (helper) { helper.getFile('/', 'a\u000cb', {'create':true}); },
      (helper) { helper.getFile('/', 'a\u000db', {'create':true}); },
      (helper) { helper.getFile('/', 'a\u000eb', {'create':true}); },
      (helper) { helper.getFile('/', 'a\u000fb', {'create':true}); },
      (helper) { helper.getFile('/', 'a\u0010b', {'create':true}); },
      (helper) { helper.getFile('/', 'a\u0011b', {'create':true}); },
      (helper) { helper.getFile('/', 'a\u0012b', {'create':true}); },
      (helper) { helper.getFile('/', 'a\u0013b', {'create':true}); },
      (helper) { helper.getFile('/', 'a\u0014b', {'create':true}); },
      (helper) { helper.getFile('/', 'a\u0015b', {'create':true}); },
      (helper) { helper.getFile('/', 'a\u0016b', {'create':true}); },
      (helper) { helper.getFile('/', 'a\u0017b', {'create':true}); },
      (helper) { helper.getFile('/', 'a\u0018b', {'create':true}); },
      (helper) { helper.getFile('/', 'a\u0019b', {'create':true}); },
      (helper) { helper.getFile('/', 'a\u001ab', {'create':true}); },
      (helper) { helper.getFile('/', 'a\u001bb', {'create':true}); },
      (helper) { helper.getFile('/', 'a\u001cb', {'create':true}); },
      (helper) { helper.getFile('/', 'a\u001db', {'create':true}); },
      (helper) { helper.getFile('/', 'a\u001eb', {'create':true}); }
    ],
    'postcondition': [
      {'fullPath':'/ab'},
    ],
  },
];

main() {
  addConsole();
  run(testCases);
}




