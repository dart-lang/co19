/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description MutationRecord should be exposed on window but not constructable
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  shouldBeNonNull(MutationRecord);
  shouldBeTrue(MutationRecord is Type);

  var div = document.createElement('div');
  var observer = new MutationObserver((m,o){});
  observer.observe(div, attributes: true);
  div.id = 'foo';
  var record = observer.takeRecords()[0];
  shouldBeTrue(record is MutationRecord);
}
