import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_halka_ve_kopru/oyun_halka_ve_kopru.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(halkaConfig.title.length, 33);
    expect(halkaConfig.tagline.length, 33);
    for (final s in halkaConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler çözülebilir', () {
    final planner = LevelPlanner(gameId: halkaId, optionalMechanics: const []);
    for (final lv in [1, 77, 1500, 33333, 49999]) {
      final gl = halkaRules.build(planner.spec(lv));
      expect(gl.validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
