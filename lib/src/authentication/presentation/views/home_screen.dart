//
// import 'package:course_app/src/authentication/presentation/cubit/authentication_cubit.dart';
// import 'package:course_app/src/authentication/presentation/widgets/loading_column.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:course_app/src/authentication/presentation/widgets/add_user_dialog.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//
//   final TextEditingController nameController = TextEditingController();
//   void getUsers() {
//     context.read<AuthenticationCubit>().getUsers();
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     getUsers();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<AuthenticationCubit, AuthenticationState>(
//       listener: (context, state) {
//         if(state is AuthenticationError) {
//           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)),);
//         }
//         else if(state is UserCreated) {
//           getUsers();
//         }
//       },
//       builder: (context, state) {
//         return Scaffold(
//             body: state is GettingUser ?
//                 const LoadingColumn(message: 'Получить пользователей')
//                 : state is CreatingUser
//             ? const LoadingColumn(message: 'Создать пользователя')
//                 : state is UsersLoaded
//             ? Center(
//               child: ListView.builder(
//                 itemCount: state.users.length,
//                 itemBuilder: (context, index) {
//                   final user = state.users[index];
//                   return ListTile(
//                     leading: Image.network(user.avatar),
//                     title: Text(user.name),
//                     subtitle: Text(user.createdAt.substring(10)),
//                   );
//                 },
//               ),
//             ) : SizedBox.shrink(),
//         floatingActionButton: FloatingActionButton.extended(
//             onPressed: () async {
//             await showDialog(
//               context: context,
//               builder: (context) => AddUserDialog(nameController: nameController,),
//              );
//           },
//           icon: const Icon(Icons.add),
//           label: const Text('Добавить пользователя'),
//     ),);
//   },);
// }}
//
