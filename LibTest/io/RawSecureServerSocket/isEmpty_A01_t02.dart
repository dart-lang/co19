/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> isEmpty
 * Whether this stream contains any elements.
 *
 * Waits for the first element of this stream, then completes the returned
 * future with true. If the stream ends without emitting any elements, the
 * returned future is completed with false.
 *
 * If the first event is an error, the returned future is completed with that
 * error.
 *
 * This operation listens to the stream, and a non-broadcast stream cannot be
 * reused after checking whether it is empty.
 *
 * @description Checks that if this is not empty, the returned future completes
 * false.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

String localFile(path) => Platform.script.resolve(path).toFilePath();

SecurityContext serverContext = new SecurityContext()
  ..useCertificateChain(localFile('../certificates/server_chain.pem'))
  ..usePrivateKey(localFile('../certificates/server_key.pem'),
      password: 'co19test');

SecurityContext clientContext = new SecurityContext()
  ..setTrustedCertificates(localFile('../certificates/trusted_certs.pem'));

check(InternetAddress address, int clNumber) {
  const messageSize = 10;
  List<int> expected = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

  var closed = 0;
  asyncStart();
  RawSecureServerSocket.bind(address, 0, serverContext).then((server) {
    Stream<RawSecureSocket> bs = server.asBroadcastStream();
    bs.isEmpty.then((value) {
      Expect.isFalse(value);
    }).whenComplete(() {
      asyncEnd();
    });

    bs.listen((client) {
      int bytesRead = 0;
      int bytesWritten = 0;
      List<int> data = new List<int>(messageSize);
      client.writeEventsEnabled = false;
      client.listen((event) {
        switch (event) {
          case RawSocketEvent.read:
            Expect.isTrue(client.available() > 0);
            var buffer = client.read();
            if (buffer != null) {
              data.setRange(bytesRead, bytesRead + buffer.length, buffer);
              bytesRead += buffer.length;
              Expect.listEquals(expected, buffer);
            }
            if (bytesRead == data.length) {
              Expect.listEquals(expected, data);
              client.writeEventsEnabled = true;
            }
            break;
          case RawSocketEvent.write:
            Expect.listEquals(expected, data);
            bytesWritten +=
                client.write(data, bytesWritten, data.length - bytesWritten);
            if (bytesWritten < data.length) {
              client.writeEventsEnabled = true;
            }
            if (bytesWritten == data.length) {
              client.shutdown(SocketDirection.send);
            }
            break;
          case RawSocketEvent.readClosed:
            closed++;
            break;
          default:
            throw "Unexpected event $event";
        }
      }).onDone(() {
        if (closed == clNumber) {
          server.close();
        }
      });
    });

    for (int i = 1; i <= clNumber; i++) {
      RawSocket.connect(server.address, server.port).then((socket) {
        RawSecureSocket.secure(socket, context: clientContext).then((client) {
          var completer = new Completer();
          int bytesRead = 0;
          int bytesWritten = 0;
          List<int> dataSent = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
          List<int> dataReceived = new List<int>(dataSent.length);
          client.listen((event) {
            switch (event) {
              case RawSocketEvent.read:
                Expect.isTrue(client.available() > 0);
                var buffer = client.read();
                if (buffer != null) {
                  dataReceived.setRange(
                      bytesRead, bytesRead + buffer.length, buffer);
                  bytesRead += buffer.length;
                }
                break;
              case RawSocketEvent.write:
                Expect.isTrue(bytesRead == 0);
                bytesWritten += client.write(
                    dataSent, bytesWritten, dataSent.length - bytesWritten);
                if (bytesWritten < dataSent.length) {}
                break;
              case RawSocketEvent.readClosed:
                Expect.listEquals(expected, dataReceived);
                completer.complete(client);
                break;
              default:
                throw "Unexpected event $event";
            }
          });
          completer.future.then((_) {
            socket.close();
          });
        });
      });
    }
  });
}

main() {
  check(InternetAddress.loopbackIPv4, 1);
  check(InternetAddress.loopbackIPv4, 2);
  check(InternetAddress.loopbackIPv6, 1);
  check(InternetAddress.loopbackIPv6, 2);
}
