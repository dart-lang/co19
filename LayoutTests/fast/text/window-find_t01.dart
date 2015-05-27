/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description This is a test for window.find().
 */
import "../../testharness.dart";

bool windowFind(String string, [bool caseSensitive, bool backwards, bool wrap, bool wholeWord, bool searchInFrames, bool showDialog]) {
    return window.find(string, caseSensitive, backwards, wrap, wholeWord, searchInFrames, showDialog);
}

void main() {
  Text diag=new Text("This is a test for window.find(). Failure!");
  document.body.append(diag);

  // Need to force layout for window.find() to operate correctly.
  var forceLayout = document.body.offsetHeight;
  shouldBeFalse(windowFind('nonsense'), 'found: nonsense');
  // https://bugs.webkit.org/show_bug.cgi?id=53654 -- failure when flipping
  // case sensitivity back-to-back.
  shouldBeFalse(windowFind('nonsense', true), 'found: nonsense');
  shouldBeFalse(windowFind('nonsense', false), 'found: nonsense');
  shouldBeTrue(windowFind('for'), 'not found: for');
  shouldBeFalse(windowFind('for'), 'found: for');
  // Go backwards.
  shouldBeTrue(windowFind('test', true, true, false), 'not found: test');
  shouldBeFalse(windowFind('for', true, true, false), 'found: for');
  // Backwards and case sensitivity.
  shouldBeFalse(windowFind('this', true, true, false), 'found: this');
  shouldBeTrue(windowFind('This', true, true, false), 'not found: This');
  // Wrap-around forwards.
  shouldBeTrue(windowFind('for', true, false, true), 'not found: for');
  shouldBeTrue(windowFind('for', true, false, true), 'not found: for');
  // Wrap-around backwards.
  shouldBeTrue(windowFind('for', true, true, true), 'not found: for');
  shouldBeTrue(windowFind('for', true, true, true), 'not found: for');
  // Case sensitivity, forwards.
  shouldBeTrue(windowFind('for', true, false, true), 'not found: for');
  shouldBeTrue(windowFind('fOR', false, false, true), 'not found: for');
  shouldBeTrue(windowFind('for', false, false, true), 'not found: for');
  shouldBeTrue(windowFind('for', true, false, true), 'not found: for');
  shouldBeFalse(windowFind('FOR', true, false, true), 'found: FOR');

  checkTestFailures();
  diag.text="This is a test for window.find(). SUCCESS!";
}
