import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sortcoff/models/finance_data.dart';
import 'package:sortcoff/views/keuangan/views/detail_keuangan.dart';
import '../../../bloc/finance/finance_bloc.dart';
import '../../../bloc/finance/finance_event.dart';
import '../../../bloc/finance/finance_state.dart';
import '../../../global/widgets/navbar.dart';
import '../../../services/finance_services.dart';
import 'add_keuangan.dart';
import 'edit_keuangan.dart';

class FinanceRecordingScreen extends StatelessWidget {
  const FinanceRecordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final String userId = user != null ? user.uid : '';

    return BlocProvider(
      create: (context) => VM_Keuangan(financeService: FinanceService())
        ..add(LoadFinanceData(userId)),
      child: FinanceRecordingView(userId: userId),
    );
  }
}

class FinanceRecordingView extends StatelessWidget {
  final String userId;
  const FinanceRecordingView({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Text('Pencatatan Keuangan'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: BlocBuilder<VM_Keuangan, FinanceState>(
                builder: (context, state) {
                  if (state is FinanceLoaded) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CategoryButton(
                          label: 'Pemasukan',
                          selected: state.selectedCategory == 'Pemasukan',
                          onTap: () => context
                              .read<VM_Keuangan>()
                              .add(const UpdateCategory('Pemasukan')),
                        ),
                        CategoryButton(
                          label: 'Pengeluaran',
                          selected: state.selectedCategory == 'Pengeluaran',
                          onTap: () => context
                              .read<VM_Keuangan>()
                              .add(const UpdateCategory('Pengeluaran')),
                        ),
                        CategoryButton(
                          label: 'All',
                          selected: state.selectedCategory == 'All',
                          onTap: () => context
                              .read<VM_Keuangan>()
                              .add(const UpdateCategory('All')),
                        ),
                      ],
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
            Expanded(
              child: BlocBuilder<VM_Keuangan, FinanceState>(
                builder: (context, state) {
                  if (state is FinanceLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is FinanceLoaded) {
                    final filteredData = state.filteredData;
                    final filteredByCategory = filteredData.where((data) {
                      if (state.selectedCategory == 'All') {
                        return true;
                      } else {
                        return data.jenisTransaksi == state.selectedCategory;
                      }
                    }).toList();
                    return ListView.builder(
                      itemCount: filteredByCategory.length,
                      itemBuilder: (context, index) {
                        final financeData = filteredByCategory[index];
                        return FinanceItem(
                          financeData: financeData,
                        );
                      },
                    );
                  } else if (state is FinanceError) {
                    return Center(child: Text(state.message));
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddFinance()),
            );
            if (result != null && result is M_PencatatanKeuangan) {
              // ignore: use_build_context_synchronously
              context.read<VM_Keuangan>().add(AddFinanceData(userId, result));
            }
          },
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        bottomNavigationBar: const Navigasi(currentPage: '/Keuangan'));
  }
}

class CategoryButton extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const CategoryButton(
      {super.key,
      required this.label,
      required this.selected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: selected ? Colors.brown : Colors.grey[300],
        foregroundColor: selected ? Colors.white : Colors.black,
      ),
      onPressed: onTap,
      child: Text(label),
    );
  }
}

class FinanceItem extends StatelessWidget {
  final M_PencatatanKeuangan financeData;
  const FinanceItem({
    Key? key,
    required this.financeData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final String userId = user != null ? user.uid : '';
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailFinance(financeData: financeData),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: ListTile(
          leading: const CircleAvatar(
            backgroundImage: AssetImage('assets/coffee.jpg'),
          ),
          title: Text(financeData.judul),
          subtitle: Text(financeData.catatan),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: financeData.jenisTransaksi == 'Pemasukan'
                          ? const Color(0xFF004FAC)
                          : const Color(0xFFAC0000),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      financeData.jenisTransaksi,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                      height:
                          4), // Add some space between the text and the transaction type container
                  Text(financeData.tanggal),
                ],
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          EditFinance(financeData: financeData),
                    ),
                  ).then((editedData) {
                    if (editedData != null &&
                        editedData is M_PencatatanKeuangan) {
                      context
                          .read<VM_Keuangan>()
                          .add(UpdateFinanceData(userId, editedData));
                    }
                  });
                },
                icon: const Icon(Icons.edit),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
