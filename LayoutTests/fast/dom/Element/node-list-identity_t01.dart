/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test checking that node list fetched by various queries have
 * proper object identity
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <ol name='name1' class='class2'/>
    <ol name='name2' class='class1'/>
    <p   name='name1' class='class1'/>
    ''', treeSanitizer: new NullTreeSanitizer());

  areSame(f) {
    // Except we don't preserve identity in Dartium, so only compare
    // for equality.
    Expect.equals(f(), f());
  }

  areSame(() => document.getElementsByTagName("ol"));
  areSame(() => document.getElementsByName("name1"));
  areSame(() => document.getElementsByClassName("class1"));
}
