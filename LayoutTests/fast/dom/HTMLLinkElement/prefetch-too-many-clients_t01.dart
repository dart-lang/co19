/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test makes sure that a single prefetch element is not a 
 * client of multiple cachedresources at the same time; by repeatedly changing
 * an existing link element, we will induce a double-notify bug if that
 * element is not releasing its cachedresource on update.
 * Tests passes if it did not crash.
 */
import "dart:html";

main() {

  addLink(url, rel) {
    var byId = document.getElementById(rel), link;
    if (byId != null)
      link = byId;
    else
      link = document.createElement('link');
    link.id = rel;
    link.rel = rel;
    link.href = url;
    document.body.append(link);
  }

  many_link_updates(iter) {
    for(var i=0;i<iter;++i) {
      addLink("IntentionallyMissingFile_$i.html", "prefetch");
    }
  }

  many_link_updates(50);
}

