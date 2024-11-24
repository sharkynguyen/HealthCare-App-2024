import 'dart:async';

abstract class AdviceRepository {
  Future<void> updateLastestAdvice({
    required String msg,
    required double heart,
    required double oxygen,
    required String updatedTime,
  });
}
