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
    'name': 'RestrictedChars',
    'precondition': [
      {'fullPath':'/ab', 'isDirectory':true},
    ],
    'tests': [
        // Test for difficult characters in 'path' parameters.
      (helper) { helper.getFile('/', 'a<b', {'create':true}); },
      (helper) { helper.getFile('/', 'a>b', {'create':true}); },
      (helper) { helper.getFile('/', 'a:b', {'create':true}); },
      (helper) { helper.getFile('/', 'a?b', {'create':true}); },
      (helper) { helper.getFile('/', 'a*b', {'create':true}); },
      (helper) { helper.getFile('/', 'a"b', {'create':true}); },
      (helper) { helper.getFile('/', 'a|b', {'create':true}); },

      (helper) { helper.getFile('/', '<ab', {'create':true}); },
      (helper) { helper.getFile('/', ':ab', {'create':true}); },
      (helper) { helper.getFile('/', '?ab', {'create':true}); },
      (helper) { helper.getFile('/', '*ab', {'create':true}); },
      (helper) { helper.getFile('/', '"ab', {'create':true}); },
      (helper) { helper.getFile('/', '|ab', {'create':true}); },

      (helper) { helper.getFile('/', 'ab<', {'create':true}); },
      (helper) { helper.getFile('/', 'ab:', {'create':true}); },
      (helper) { helper.getFile('/', 'ab?', {'create':true}); },
      (helper) { helper.getFile('/', 'ab*', {'create':true}); },
      (helper) { helper.getFile('/', 'ab"', {'create':true}); },
      (helper) { helper.getFile('/', 'ab|', {'create':true}); },

      // Only '\\' is disallowed.
      (helper) { helper.getFile('/', 'a\\b', {'create':true}, 'InvalidModificationError'); },

      // Test for difficult characters in 'name' parameters.
      (helper) { helper.copy('/ab', '/', ' a<b'); },
      (helper) { helper.copy('/ab', '/', ' a:b'); },
      (helper) { helper.copy('/ab', '/', ' a?b'); },
      (helper) { helper.copy('/ab', '/', ' a*b'); },
      (helper) { helper.copy('/ab', '/', ' a"b'); },
      (helper) { helper.copy('/ab', '/', ' a|b'); },

      // 'Name' parameter cannot contain '/' or '\\'.
      (helper) { helper.copy('/ab', '/', 'a/b', 'InvalidModificationError'); },
      (helper) { helper.copy('/ab', '/', 'a\\b', 'InvalidModificationError'); },
    ],
    'postcondition': [
      {'fullPath':'/ab', 'isDirectory':true},
      {'fullPath':'a<b', 'isDirectory':false},
      {'fullPath':' a|b', 'isDirectory':true}
    ],
  },
];

main() {
  addConsole();
  run(testCases);
}


