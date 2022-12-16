import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saigai01/repository/quake_repository.dart';
import '../model/earthquake/earthquake_list.dart';

class QuakeController extends StateNotifier<EarthquakeList> {
  final Ref ref;
  final picker = ImagePicker();

  QuakeController(this.ref) : super(EarthquakeList(nextCursor: ''));

  Future<void> feachQuake() async {
    final model = await ref.read(quakeRepositoryProvider).fechQuake();
    state = model;
  }
}
