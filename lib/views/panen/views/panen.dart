import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sortcoff/views/panen/views/detail_panen.dart';
import 'package:sortcoff/views/panen/views/edit_panen.dart';
import '../../../bloc/navigation/navigation_bloc.dart';
import '../../../bloc/navigation/navigation_event.dart';
import '../../../global/widgets/navbar.dart';
import 'add_panen.dart';
import '../../../bloc/panen/panen_bloc.dart';
import '../../../bloc/panen/panen_event.dart';
import '../../../bloc/panen/panen_state.dart';
import '../../../models/panen_data.dart';
import '../../../services/panen_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PanenKopi extends StatelessWidget {
  const PanenKopi({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final String userId = user != null ? user.uid : '';

    return BlocProvider(
      create: (context) =>
          PanenBloc(panenService: PanenService())..add(LoadPanenData(userId)),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const Text(
                    'Data Hasil Panen',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<PanenBloc, PanenState>(
                builder: (context, state) {
                  if (state is PanenLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is PanenLoaded) {
                    return ListView.builder(
                      itemCount: state.panenList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPanen(
                                  panenData: state.panenList[index],
                                ),
                              ),
                            );
                          },
                          child: Card(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: ListTile(
                              title: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'assets/images/content/img1.png',
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(width: 16),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.panenList[index].judul,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                          'Kopi: ${state.panenList[index].jenisKopi}'),
                                      Text(
                                          'Tanggal: ${state.panenList[index].tanggalPanen}'),
                                    ],
                                  ),
                                ],
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EditPanen(
                                          panenData: state.panenList[index]),
                                    ),
                                  ).then((editedData) {
                                    if (editedData != null &&
                                        editedData is PanenData) {
                                      context.read<PanenBloc>().add(
                                          UpdatePanenData(userId, editedData));
                                    }
                                  });
                                },
                                icon: const Icon(Icons.edit),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else if (state is PanenError) {
                    return Center(
                        child: Text('Failed to load data: ${state.message}'));
                  }
                  return const Center(child: Text('Unknown state'));
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddPanen()),
            );
            if (result != null && result is PanenData) {
              // ignore: use_build_context_synchronously
              context.read<PanenBloc>().add(AddPanenData(userId, result));
            }
          },
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: 2,
          onTap: (index) {
            if (index == 0) {
              context.read<NavigationBloc>().add(NavigateToHomePage());
            } else if (index == 1) {
              context.read<NavigationBloc>().add(NavigateToProfilePage());
            }
          },
        ),
      ),
    );
  }
}
