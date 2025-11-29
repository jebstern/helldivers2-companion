// coverage:ignore-file
import "dart:developer";

import "package:flutter/foundation.dart";
import "package:logging/logging.dart";

final Logger hdLogger = Logger("helldiversLogger");

void initLogging() {
  Logger.root.level = kDebugMode ? Level.INFO : Level.WARNING;

  Logger.root.onRecord.listen((LogRecord record) {
    String object = "";
    if (record.object != null && record.object.toString() != record.message) {
      object = "${record.object}";
    }

    log(
      "${record.level.name}: ${record.time}: ${record.message} $object",
      error: record.error,
      level: record.level.value,
      name: record.loggerName,
      sequenceNumber: record.sequenceNumber,
      stackTrace: record.level == Level.SEVERE ? record.stackTrace : null,
      time: record.time,
      zone: record.zone,
    );
  });
}
