part of 'utility.dart';

var log = logging.Logger('root');

void initLogger() {
  // only enable logging for debug mode
  if (kDebugMode) {
    logging.Logger.root.level = logging.Level.FINER;
  } else {
    logging.Logger.root.level = logging.Level.OFF;
  }
  logging.hierarchicalLoggingEnabled = true;

  logging.Logger.root.onRecord.listen((record) {
    if (!kDebugMode) return;

    var start = '\x1b[34m';
    var emoji = '🗣';
    const end = '\x1b[0m';

    switch (record.level.name) {
      case 'FINE':
        start = '\x1b[94m';
        break;
      case 'CONFIG':
        start = '\x1b[96m';
        emoji = '🛠';
        break;
      case 'INFO':
        start = '\x1b[92m';
        emoji = '💡';
        break;
      case 'WARNING':
        start = '\x1b[33;1m';
        emoji = '❗️';
        break;
      case 'SEVERE':
        start = '\x1b[91m';
        emoji = '⛔️';
        break;
      case 'SHOUT':
        start = '\x1b[41m\x1b[93;5m';
        emoji = '🆘';
        break;
    }

    final message = '$start${DateFormat('HH:mm:ss.SSS').format(record.time)} $emoji ${record.message}$end';
    dev.log(
      message,
      name: record.loggerName,
      level: record.level.value,
      time: record.time,
    );
  });
}
