
import 'package:course_app/core/common/app/providers/user_provider.dart';
import 'package:course_app/core/common/widgets/gradient_background.dart';
import 'package:course_app/core/common/widgets/rounded_botton.dart';
import 'package:course_app/core/res/fonts.dart';
import 'package:course_app/core/res/media_res.dart';
import 'package:course_app/core/utils/core_utils.dart';
import 'package:course_app/src/auth/data/models/user_model.dart';
import 'package:course_app/src/auth/presentation/bloc/auth_bloc.dart';
import 'package:course_app/src/auth/presentation/views/sign_in_screen.dart';
import 'package:course_app/src/auth/presentation/widgets/sing_up_form.dart';
import 'package:course_app/src/dashboard/presentation/views/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const routeName = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final fullNameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    fullNameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (_, state) {
          if (state is AuthError) {
            CoreUtils.showSnackBar(context, state.message);
          } else if (state is SignedUp) {
            context.read<AuthBloc>().add(
              SignInEvent(
                  email: emailController.text.trim(),
                  password: passwordController.text.trim(),
              )
            );
          } else if (state is SignedIn) {
            context.read<UserProvider>().initUser(state.user as LocalUserModel);
            Navigator.pushReplacementNamed(context, Dashboard.routeName);
          }
        },
        builder: (context, state) {
          return GradientBackground(
            image: MediaRes.authGradientBackground,
              child: SafeArea(
                  child: Center(
                      child: ListView(
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        children: [
                          const Text(
                        'Easy to learn, discover more skills.',
                        style: TextStyle(
                          fontFamily: Fonts.aeonik,
                          fontWeight: FontWeight.w700,
                          fontSize: 32,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Sign up for an account',
                        style: TextStyle(fontSize: 14),
                      ),
          Align(
          alignment: Alignment.centerRight, // Выравнивание по центру справа
          child: Column( // Обертка для столбца виджетов
          crossAxisAlignment: CrossAxisAlignment.end, // Выравнивание элементов в столбце справа
          children: [ // Дочерние виджеты
          const SizedBox(height: 10), // Промежуток
          TextButton( // Кнопка для перехода к экрану входа
          onPressed: () {
          Navigator.pushReplacementNamed( // Переход на экран входа
          context,
          SignInScreen.routeName,
          );
          },
          child: const Text('Already have an account?'), // Текст кнопки
          ),
          const SizedBox(height: 10), // Промежуток
          SignUpForm( // Форма регистрации
          emailController: emailController,
          fullNameController: fullNameController,
          passwordController: passwordController,
          confirmPasswordController: confirmPasswordController,
          formKey: formKey,
          ),
          const SizedBox(height: 30), // Промежуток
          // Условный рендеринг для индикатора загрузки или кнопки регистрации
          if (state is AuthLoading) // Если загрузка
          const Center(child: CircularProgressIndicator()) // Показать индикатор загрузки
          else // Если не загрузка
          RoundedButton( // Показать кнопку регистрации
          label: 'Sign Up',
          onPressed: () {
          FocusManager.instance.primaryFocus?.unfocus(); // Убрать фокус с элемента, если есть
          FirebaseAuth.instance.currentUser?.reload(); // Перезагрузить текущего пользователя
          if (formKey.currentState!.validate()) { // Проверить форму
          context.read<AuthBloc>().add( // Добавить событие SignUpEvent в AuthBloc
          SignUpEvent(
          email: emailController.text.trim(), // Получить email из контроллера
          password: passwordController.text.trim(), // Получить пароль из контроллера
          name: fullNameController.text.trim(), // Получить имя из контроллера
          ),
          );
          }
          }
          ),
          ],
          ),
          ),

          ],
          ),
          )
          )
          );
        }
        )
    );
  }
}

