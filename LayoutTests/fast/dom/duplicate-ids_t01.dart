/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that getElementById works as elements with duplicate
 * ids are added and removed.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id="container">
    <div id="duplicate">This is the first duplicate div</div>
    <div id="duplicate">This is the second duplicate div</div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var div = document.getElementById('duplicate');
  var dup1 = div..remove();

  div = document.getElementById('duplicate');

  debug('getElementById, expect non null');
  shouldBeNonNull(div);

  debug('getElementById, expect correct div');
  shouldBe(div.firstChild.nodeValue, 'This is the second duplicate div');

  var dup2 = div..remove();
  debug('getElementById, expect null');
  shouldBeNull(document.getElementById('duplicate'));

  // Now insert the nodes again
  var container = document.getElementById('container');
  container.append(dup1);
  container.append(dup2);

  debug('getElementById, expect non null again');
  shouldBeNonNull(document.getElementById('duplicate'));
}
