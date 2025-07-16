import '../entities/coronilla_entity.dart';

abstract class CoronillaRepository {
  Future<CoronillaEntity> getCoronilla();
  Future<List<CoronillaStepEntity>> getCoronillaSteps();
}
