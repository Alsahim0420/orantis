import '../entities/coronilla_entity.dart';
import '../repositories/coronilla_repository.dart';

class GetCoronillaUseCase {
  final CoronillaRepository repository;

  GetCoronillaUseCase(this.repository);

  Future<CoronillaEntity> call() async {
    return await repository.getCoronilla();
  }
}
