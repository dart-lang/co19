/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Testing mutations are delivered following Database transaction 
 * callbacks.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var mutations;

  testDatabase() {
    var div;
    var db;
    var observer;

    finish() {
      shouldBe(mutations.length, 1);
      shouldBe(mutations[0].type, "attributes");
      shouldBe(mutations[0].attributeName, "foo");
      observer.disconnect();
      asyncEnd();
    }

    mutate(_) {
      div.setAttribute('foo', 'bar');
      setTimeout(finish, 0);
    }

    start() {
      mutations = null;
      div = document.createElement('div');
      observer = new MutationObserver((m,o) {
        mutations = m;
      });

      observer.observe(div, attributes: true, characterData: true);

      db = window.openDatabase('DatabaseMutationDelivery', '1.0', '', 1);
      db.transaction(mutate);
    }

    start();
  }

  asyncStart();
  testDatabase();
}
