import 'package:uuid/uuid.dart';

String createUuid() {
  const uuid = Uuid();
  return uuid.v4();
}
