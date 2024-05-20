import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_course/dto/cs.dart';
import 'package:my_course/endpoints/endpoints.dart';
import 'package:my_course/screens/UTS/create_cs.dart';
import 'package:my_course/component/bottom_up_transition.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import 'package:my_course/screens/UTS/edit_screen.dart';
import 'package:my_course/services/data_service.dart';
import 'package:path/path.dart';

class CsScreen extends StatefulWidget {
  const CsScreen({Key? key}) : super(key: key);

  @override
  _CsScreenState createState() => _CsScreenState();
}

class _CsScreenState extends State<CsScreen> {
  Future<List<CustomerService>>? _customerservice;

//fungsi delete
  static Future<void> deleteCustomerService(int idCs) async {
    final url = Uri.parse('${Endpoints.cs}/$idCs');
    final response = await http.delete(url);
    if (response.statusCode != 200) {
      throw Exception('Failed to delete data');
    }
  }

  @override
  void initState() {
    super.initState();
    _customerservice = DataService.fetchCustomerService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Service List'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/my-homepage');
          },
        ),
      ),
      body: FutureBuilder<List<CustomerService>>(
        //untuk membangun antar muka berdasarkan list customerservice
        future: _customerservice,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //snapshot untuk mengakses data dari objek future
            final data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final item =
                    data[index]; //mendapatkan item yang sedang di akses
                return ListTile(
                  //menampilkan item
                  title: Column(children: [
                    Text('NIM : ${item.nim}',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: const Color.fromARGB(255, 36, 31, 31),
                          fontWeight: FontWeight.normal,
                        )),
                    Text('Issue Title : ${item.titleIssues}',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: const Color.fromARGB(255, 36, 31, 31),
                          fontWeight: FontWeight.normal,
                        )),
                    Text('Issue Desription : ${item.descriptionIssues}',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: const Color.fromARGB(255, 36, 31, 31),
                          fontWeight: FontWeight.normal,
                        )),
                    const SizedBox(height: 10)
                  ]),
                  subtitle: item.imageUrl != null
                      ? Column(
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    fit: BoxFit.fitWidth,
                                    width: 370,
                                    Uri.parse(
                                            '${Endpoints.baseURLLive}/public/${item.imageUrl!}')
                                        .toString(),
                                    errorBuilder: (context, error,
                                            stackTrace) =>
                                        const Icon(Icons
                                            .error), // Display error icon if image fails to load
                                  ),
                                ),
                              ],
                            ),
                            RatingBar(
                              minRating: 1,
                              maxRating: 5,
                              ignoreGestures: true,
                              allowHalfRating: false,
                              initialRating: item.rating.toDouble(),
                              ratingWidget: RatingWidget(
                                full: const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                half: const Icon(
                                  Icons.star_half,
                                  color: Colors.amber,
                                ),
                                empty: const Icon(
                                  Icons.star_border,
                                  color: Colors.amber,
                                ),
                              ),
                              onRatingUpdate: (double ratings) {},
                            ),
                            // const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => EditScreen(
                                                    editCs: item,
                                                  )));
                                    },
                                    icon: Icon(Icons.edit)),
                                IconButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text('Confirm'),
                                              content: const Text(
                                                  'Are you sure want to delete this issue?'),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(context),
                                                  child: const Text('Cancel'),
                                                ),
                                                TextButton(
                                                  child: const Text('Delete'),
                                                  onPressed: () async {
                                                    try {
                                                      // int idDatas =
                                                      //     data[index].idDatas;
                                                      await deleteCustomerService(
                                                          data[index].idCs);
                                                      Navigator.pop(context,
                                                          url); //refres
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  CsScreen()));
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        const SnackBar(
                                                          content: Text(
                                                              'Delete Sucessfully'),
                                                        ),
                                                      );
                                                    } catch (e) {
                                                      print('Error: $e');
                                                    }
                                                  },
                                                )
                                              ],
                                            );
                                          });
                                    },
                                    icon: const Icon(Icons.delete))
                              ],
                            ),
                            const Divider(),
                          ],
                        )
                      : null,
                );
              },
            );
          } else if (snapshot.hasError) {
            //jika terjadi kesalahan saat melakukan snapshot
            return Center(child: Text('${snapshot.error}'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 140, 31, 236),
        tooltip: 'Add Issue',
        onPressed: () {
          // Navigator.pushNamed(context, '/form-screen');
          // BottomUpRoute(page: const FormScreen());
          Navigator.push(context, BottomUpRoute(page: const FormCreate()));
        },
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
    );
  }
}
