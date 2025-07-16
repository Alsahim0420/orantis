import '../entities/coronilla_entity.dart';
import '../repositories/coronilla_repository.dart';

class GetCoronillaStepsUseCase {
  final CoronillaRepository repository;

  GetCoronillaStepsUseCase(this.repository);

  Future<List<CoronillaStepEntity>> call() async {
    return await repository.getCoronillaSteps();
  }
}
