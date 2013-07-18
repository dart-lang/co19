/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void add(message)
 * Sends an asynchronous message to the linked IsolateStream.
 * List and maps are also allowed to be cyclic.
 * @description Checks that cyclic lists and maps could be sent properly.
 * @author kaigorodov
 */
 
import "dart:isolate";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

IsolateSink replyTo=null;
int msgCount=null;

void readMsg(message) {
  if (replyTo==null) {
    Expect.isTrue(message is IsolateSink);
    replyTo=message;
  } else if (msgCount==null) {
    msgCount=message;
  } else {
    replyTo.add(message);
    msgCount--;
    if (msgCount==0) {
      replyTo.close();
    }
  }
}

void main2() {
  stream.listen(readMsg);
}

List messageList=new List();

void fillMessagesList() {
  // create cyclic list
  List l=new List();
  l.add(l);
  messageList.add(l);
  // create another cyclic list
  List l1=new List();
  List l2=new List();
  l1.add(l2);
  l2.add(l1);
  messageList.add(l1);
  // create cyclic map
  Map m=new Map();
  m[2]=m;
  messageList.add(m);
  // create another cyclic map
  Map m2=new Map();
  m=new Map();
  m[1]=m2;
  m2[1]=m;
  messageList.add(m);
  // yet another cyclic map
  Map mm=new Map();
  mm[mm]=mm;
  messageList.add(m);
}

void main() {
  fillMessagesList();

  IsolateSink sink = streamSpawnFunction(main2);
  MessageBox mbox=new MessageBox();

  sink.add(mbox.sink);
  sink.add(messageList.length);

  for (var message in messageList) {
    asyncStart();
    sink.add(message);
  }
  
  int i = 0;
  mbox.stream.listen((message) {
    Expect.deepEquals(messageList[i], message, "i=$i");
    i++;
    if (i == messageList.length) {
      mbox.sink.close();
    }
    asyncEnd();
  });
}
