import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'package:provider/provider.dart';
import '../data/app_state.dart';
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
import '../models/recipe.dart';
import '../theme/app_theme.dart';
import 'completion_screen.dart';

/// 9-ekran: "Tayyorlash" — bosqichma-bosqich retsept jarayoni,
/// progress bar va Oldingi/Keyingi tugmalari bilan.
class CookingStepsScreen extends StatefulWidget {
  final Recipe recipe;
  const CookingStepsScreen({super.key, required this.recipe});

  @override
  State<CookingStepsScreen> createState() => _CookingStepsScreenState();
}

class _CookingStepsScreenState extends State<CookingStepsScreen> {
  int _current = 0;

  List<CookingStep> get _steps => widget.recipe.steps;

  void _next() {
    if (_current < _steps.length - 1) {
      setState(() => _current++);
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => CompletionScreen(recipe: widget.recipe)),
      );
    }
  }

  void _prev() {
    if (_current > 0) setState(() => _current--);
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return Scaffold(
      backgroundColor: AppColors.background,
=======
    final appState = context.watch<AppState>();
    final lang = appState.languageCode;
    final t = appState.t;
    return Scaffold(
      backgroundColor: context.colors.background,
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
<<<<<<< HEAD
                    child: const Icon(Icons.arrow_back, color: AppColors.textDark),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text('${widget.recipe.title} — Tayyorlash',
                        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800)),
=======
                    child: Icon(Icons.arrow_back, color: context.colors.textDark),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text('${widget.recipe.titleFor(lang)} — ${t('cooking_suffix')}',
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: context.colors.textDark)),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
                  ),
                ],
              ),
              const SizedBox(height: 6),
<<<<<<< HEAD
              Text('${_current + 1}/${_steps.length} bosqich',
                  style: const TextStyle(color: AppColors.textGrey, fontSize: 13)),
=======
              Text('${_current + 1}/${_steps.length} ${t('step_of')}',
                  style: TextStyle(color: context.colors.textGrey, fontSize: 13)),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
              const SizedBox(height: 10),
              Row(
                children: List.generate(_steps.length, (i) {
                  final active = i <= _current;
                  return Expanded(
<<<<<<< HEAD
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      height: 6,
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      decoration: BoxDecoration(
                        color: active ? AppColors.primary : AppColors.divider,
=======
                    child: Container(
                      height: 6,
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      decoration: BoxDecoration(
                        color: active ? AppColors.primary : context.colors.divider,
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: ListView.builder(
                  itemCount: _steps.length,
                  itemBuilder: (context, i) {
                    final step = _steps[i];
                    final done = i < _current;
                    final active = i == _current;
<<<<<<< HEAD
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: active ? AppColors.primary : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: active
                            ? []
                            : const [
                                BoxShadow(
                                    color: Color(0x0D000000),
                                    blurRadius: 8,
                                    offset: Offset(0, 4))
                              ],
=======
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: active ? AppColors.primary : context.colors.card,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: active
                            ? []
                            : const [BoxShadow(color: Color(0x0D000000), blurRadius: 8, offset: Offset(0, 4))],
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 13,
                            backgroundColor: done
                                ? AppColors.green
                                : active
                                    ? Colors.white
<<<<<<< HEAD
                                    : AppColors.divider,
=======
                                    : context.colors.divider,
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
                            child: done
                                ? const Icon(Icons.check, size: 15, color: Colors.white)
                                : Text('${i + 1}',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
<<<<<<< HEAD
                                        color: active ? AppColors.primary : AppColors.textGrey)),
=======
                                        color: active ? AppColors.primary : context.colors.textGrey)),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
<<<<<<< HEAD
                                Text(step.title as String,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15,
                                        color: active ? Colors.white : AppColors.textDark)),
                                const SizedBox(height: 4),
                                Text(step.description as String,
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: active
                                            ? Colors.white.withOpacity(0.9)
                                            : AppColors.textGrey)),
=======
                                Text(step.titleFor(lang),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15,
                                        color: active ? Colors.white : context.colors.textDark)),
                                const SizedBox(height: 4),
                                Text(step.descriptionFor(lang),
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: active ? Colors.white.withValues(alpha: 0.9) : context.colors.textGrey)),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _current == 0 ? null : _prev,
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size.fromHeight(54),
                        side: const BorderSide(color: AppColors.primary),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
<<<<<<< HEAD
                      child: const Text('Oldingi',
                          style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w700)),
=======
                      child: Text(t('btn_prev'), style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w700)),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _next,
<<<<<<< HEAD
                      child: Text(_current == _steps.length - 1 ? 'Tugatish' : 'Keyingi'),
=======
                      child: Text(_current == _steps.length - 1 ? t('btn_finish') : t('btn_next')),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
